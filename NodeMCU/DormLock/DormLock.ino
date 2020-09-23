#include <string.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <Arduino_JSON.h>
#include <Base64.h>
#include <NTPClient.h>
#include <WiFiUdp.h>



#define FW_OPENDOOR 0x01
#define SFW_OPENDOOR_1 0x00



#define DORM
//SSID and Password of your WiFi router
#ifdef DORM
const char *ssid = "505";
char *password = "Nopassword~";
#else
const char *ssid = "Kison";
const char *password = "azxcvbnm";
#endif

//change into newing a mem, cause in final ver we should be able to
//do anything from adminside of app
int TotalNumofUser = 4; //future admin included

String userNames[4] = {"KisonHe", "wxc", "zby", "hjj"};
String userPasswords[4] = {"azxcvbnm", "123", "123", "123"};
String verifyCode;
const long utcOffsetInSeconds = 3600;
ESP8266WebServer server(80); //Server on port 80

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "ntp1.aliyun.com", utcOffsetInSeconds);

int Hour = 0;
int Minutes = 0;

void ntpOnly(void);
int authCheck(JSONVar obj);
int sendMessage2_32(uint8_t FW,uint8_t SFW, uint8_t* data);
//===============================================================
// This routine is executed when you open its IP in browser
//===============================================================
void handleCP(){
    String cp = server.arg("cp");
    JSONVar myObject = JSON.parse(cp);

    if (authCheck(myObject) == 200){
        //change password on flash
        //temperary reply
        server.send(500, "text/html", "method not supported");
    }
    else{
        server.send(403, "text/html", "failed the auth");
    }

}


void handleRoot()
{
  //String s = MAIN_page; //Read HTML contents
  String info = server.arg("info");
  

  JSONVar myObject = JSON.parse(info);
  switch (authCheck(myObject))
  {
  case 200:
    /* code */
    server.send(200, "text/html", "auth passed");
    break;

  case 403:
    /* code */
    server.send(403, "text/html", "failed the auth");
    break;

  case 500:
    /* code */
    server.send(500, "text/html", "something is fucked");
    break;

  default:
    server.send(403, "text/html", "failed the auth");
    break;
  }
  Serial.println(info);
}
//===============================================================
// This routine is executed when you press submit
//===============================================================

void setup(void)
{
  Serial.begin(115200);

  WiFi.begin(ssid, password); //Connect to your WiFi router
  Serial.println("");

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }

  //If connection successful show IP address in serial monitor
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println("WiFi");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP()); //IP address assigned to your ESP

    server.on("/", handleRoot); //Which routine to handle at root location
    server.on("/changepassword", handleCP); //Which routine to handle at root location

  server.begin(); //Start server
  Serial.println("HTTP server started");
  timeClient.begin();
  timeClient.setTimeOffset(28800);
}
//==============================================================
//                     LOOP
//==============================================================
void loop(void)
{
  server.handleClient(); //Handle client requests
}

void ntpOnly(void)
{
  timeClient.update();

  Hour = timeClient.getHours(); //Derect send data in num, though will be treated as Char
  Minutes = timeClient.getMinutes();
  //Seconds = timeClient.getSeconds();

  Serial.print("Hour:");
  Serial.println(Hour);
  Serial.print("Minutes:");
  Serial.println(Minutes);
}

int authCheck(JSONVar obj)
{

  if (JSON.typeof(obj) == "undefined")
  {
    Serial.println("Parsing input failed!");
    return -1;
  }
  else if (obj.hasOwnProperty("verifyCode"))
  {
    verifyCode = obj["verifyCode"];
    //verifyCode = verifyCode.substring(0, verifyCode.length() - 1);
    Serial.println(verifyCode);
    int inputStringLength = verifyCode.length();
    char verifyCodeCSTR[inputStringLength];
    verifyCode.toCharArray(verifyCodeCSTR, inputStringLength);
    // Serial.print("CStr:");
    // Serial.println(verifyCodeCSTR);
    int decodedStrLength = Base64.decodedLength(verifyCodeCSTR, inputStringLength);
    char decodedString[decodedStrLength];
    Base64.decode(decodedString, verifyCodeCSTR, inputStringLength);
    Serial.println(decodedString);

    ntpOnly();
    int token = atoi(decodedString);
    // Serial.print("token:");
    // Serial.println(token);
    if ((token == (100 * Hour + Minutes)) || (token == (100 * Hour + Minutes - 1)) || (token == (100 * Hour + Minutes + 1)))
    {
      if (obj.hasOwnProperty("cUserName"))
      {
        if (obj.hasOwnProperty("cUserPassword"))
        {
          String inUserName;
          inUserName = obj["cUserName"]; //inUserName = inUserName.substring(0, inUserName.length() - 1);
          Serial.print("inbound username:"); Serial.println(inUserName);
          String inUserPassword;
          inUserPassword = obj["cUserPassword"]; //inUserPassword = inUserPassword.substring(0, inUserPassword.length() - 1);
          Serial.print("inbound UserPassword:"); Serial.println(inUserPassword);
          for (int i = 0; i < TotalNumofUser; i++){if (userNames[i] == inUserName && userPasswords[i] == inUserPassword){Serial.println("auth passed");return 200;}}
          Serial.println("no matching username and passwod");return 403;
        }
        else{Serial.println("missing userPassword");return 403;}
      }else{Serial.println("missing username");return 403;}
    }
    else{Serial.println("wrong token");return 403;}
  }
}



int sendMessage2_32(uint8_t FW,uint8_t SFW, uint8_t* data){
  //static uint8_t Message[21];
  //static char Message[21];
  static char Message[22];
  uint8_t tmp_sum = 0;
  memset(Message,0,sizeof(Message));
  Message[0] = 0xAF;
  Message[1] = FW;
  Message[2] = SFW;
  memcpy(Message,data,16);
  for (int i = 1; i < 19; i++)
  {
    tmp_sum += Message[i];
  }
  Message[19] = tmp_sum;
  
  Message[20] = 0xFF;
  Serial.print(Message);


}