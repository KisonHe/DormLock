/**
 * @brief The file "info" tells how many users configd.
 * Say 4 for example, then there should be 4 files, naming 
 * "user1","user2","user3","user4"
 * the file above should save the configd username and password
 * split by a \n. example to be "wsx\n123" 
 * 
 */

#include <string.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <Arduino_JSON.h>
#include <Base64.h>
#include <NTPClient.h>
#include <WiFiUdp.h>
#include "LittleFS.h"

#define FW_OPENDOOR (0x01)
#define SFW_OPENDOOR_1 (0x00)

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

String userNames[4] = {"KisonHe", "wsx", "zby", "hjj"};
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

int sendMessage2_32(uint8_t FW, uint8_t SFW, uint8_t *data);

int K_LittleFSinit();

int K_readInfoFromFile();
//===============================================================
// This routine is executed when you open its IP in browser
//===============================================================
void handleCP()
{
    String cp = server.arg("cp");
    JSONVar myObject = JSON.parse(cp);

    if (authCheck(myObject) == 200)
    {
        //change password on flash
        //temperary reply
        server.send(500, "text/html", "method not supported");
    }
    else
    {
        server.send(403, "text/html", "failed the auth");
    }
}

void handleRoot()
{
    //String s = MAIN_page; //Read HTML contents
    String info = server.arg("info");

    JSONVar myObject = JSON.parse(info);
    uint8_t to32Data[16];
    memset(to32Data, 0, sizeof(to32Data));
    switch (authCheck(myObject))
    {
    case 200:
        /* code */
        server.send(200, "text/html", "auth passed");
        sendMessage2_32(FW_OPENDOOR, SFW_OPENDOOR_1, to32Data);
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
    //Serial.println(info);
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
    //Serial.println("");
    //Serial.print("Connected to ");
    //Serial.println("WiFi");
    //Serial.print("IP address: ");
    Serial.println(WiFi.localIP()); //IP address assigned to your ESP

    server.on("/", handleRoot);             //Which routine to handle at root location
    server.on("/changepassword", handleCP); //Which routine to handle at root location

    server.begin(); //Start server
    //Serial.println("HTTP server started");
    timeClient.begin();
    timeClient.setTimeOffset(28800);
    if (K_LittleFSinit() < 0){
        //handler here
        Serial.println("FS is fucked");
    }
    K_readInfoFromFile();
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

    //Serial.print("Hour:");
    //Serial.println(Hour);
    //Serial.print("Minutes:");
    //Serial.println(Minutes);
}

int authCheck(JSONVar obj)
{

    if (JSON.typeof(obj) == "undefined")
    {
        //Serial.println("Parsing input failed!");
        return -1;
    }
    else if (obj.hasOwnProperty("verifyCode"))
    {
        verifyCode = obj["verifyCode"];
        //verifyCode = verifyCode.substring(0, verifyCode.length() - 1);
        //Serial.println(verifyCode);
        int inputStringLength = verifyCode.length();
        char verifyCodeCSTR[inputStringLength];
        verifyCode.toCharArray(verifyCodeCSTR, inputStringLength);
        // //Serial.print("CStr:");
        // //Serial.println(verifyCodeCSTR);
        int decodedStrLength = Base64.decodedLength(verifyCodeCSTR, inputStringLength);
        char decodedString[decodedStrLength];
        Base64.decode(decodedString, verifyCodeCSTR, inputStringLength);
        //Serial.println(decodedString);

        ntpOnly();
        int token = atoi(decodedString);
        // //Serial.print("token:");
        // //Serial.println(token);
        if ((token == (100 * Hour + Minutes)) || (token == (100 * Hour + Minutes - 1)) ||
            (token == (100 * Hour + Minutes + 1)))
        {
            if (obj.hasOwnProperty("cUserName"))
            {
                if (obj.hasOwnProperty("cUserPassword"))
                {
                    String inUserName;
                    inUserName = obj["cUserName"]; //inUserName = inUserName.substring(0, inUserName.length() - 1);
                    //Serial.print("inbound username:");
                    //Serial.println(inUserName);
                    String inUserPassword;
                    inUserPassword = obj["cUserPassword"]; //inUserPassword = inUserPassword.substring(0, inUserPassword.length() - 1);
                    //Serial.print("inbound UserPassword:");
                    //Serial.println(inUserPassword);
                    for (int i = 0; i < TotalNumofUser; i++)
                    {
                        if (userNames[i] == inUserName && userPasswords[i] == inUserPassword)
                        {
                            //Serial.println("auth passed");
                            return 200;
                        }
                    }
                    //Serial.println("no matching username and passwod");
                    return 403;
                }
                else
                {
                    //Serial.println("missing userPassword");
                    return 403;
                }
            }
            else
            {
                //Serial.println("missing username");
                return 403;
            }
        }
        else
        {
            //Serial.println("wrong token");
            return 403;
        }
    }
}

int sendMessage2_32(uint8_t FW, uint8_t SFW, uint8_t *data)
{
    //static uint8_t Message[21];
    //static char Message[21];
    static char Message[22];
    uint8_t tmp_sum = 0;
    memset(Message, 0, sizeof(Message));
    Message[0] = 0xAF;
    Message[1] = FW;
    Message[2] = SFW;
    memcpy(&Message[3], data, 16);
    for (int i = 1; i < 19; i++)
    {
        tmp_sum += Message[i];
    }
    Message[19] = tmp_sum;

    Message[20] = 0xFF;
    Serial.write(Message, 22);
    // for (int i = 0;i < 21;i++){
    //   Serial.write(Message[i]);
    // }
}


int K_readInfoFromFile(){
    if (LittleFS.exists("/info"))
    {
        File f = LittleFS.open("/info", "r");
        String tmp;
        for(int i = 0;i<f.size();i++){
            tmp += (char)f.read();
        }
        Serial.print("read string in info of ");
        Serial.println(tmp);
        
        TotalNumofUser = tmp.toInt();
        if (TotalNumofUser == 0){
            TotalNumofUser = 4;
            f.close();
            File fw = LittleFS.open("/info", "w");
            fw.print("4");
            fw.close();
            return -2;
        }
        f.close();
    }
    else 
        return -1;
}


int K_LittleFSinit()
{
    if (LittleFS.begin())
    {
        Serial.println("LittleFS Initialize....ok");
        if (!LittleFS.exists("/info"))
        {
            Serial.println("File not fount");
            if (LittleFS.format())
            {
                Serial.println("File System Formated");
                File f = LittleFS.open("/info", "w");
                if (!f)
                {
                    Serial.println("File create failed");
                    return -1;
                }
                else
                {
                    //todo
                    //make init here
                    //todo should use var not hardcoded string
                    f.print("4");
                    f.close(); //Close file
                    if (LittleFS.exists("/info"))
                    {
                        Serial.println("File create success");
                        
                        return 1;
                    }
                }
            }
            else
            {
                Serial.println("File System Formatting Error");
                return -1;
            }
        }
        else
        {
            Serial.println("File found");
            return 0;
        }
    }
    else
    {
        Serial.println("LittleFS Initialization...failed");
        return -1;
    }
    return -1;
}