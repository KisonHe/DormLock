/** 
* @brief    RGB灯板级支持包
* @details  
* @author   Asn
* @date     2019.10.20
* @version  1.0
* @par Copyright (c):  Asn
* @par 日志
*/

#include "bsp_rgb.h"
#include "tim.h"
#include <cstdlib>
#include <cstring>

#define RED_TIM &htim1               //红
#define RED_CHANNEL TIM_CHANNEL_2
#define RED_SET TIM1->CCR2

#define GREEN_TIM &htim1
#define GREEN_CHANNEL TIM_CHANNEL_1  //绿
#define GREEN_SET TIM1->CCR1

#define BLUE_TIM &htim1
#define BLUE_CHANNEL TIM_CHANNEL_3   //蓝
#define BLUE_SET TIM1->CCR3

static uint16_t gradational;//渐变爆闪专属
static int16_t countDown = 0;


#ifdef BSP_RGB_REQUEUE
bsp_rgb_RequestStruct onGoing;
QueueHandle_t bsp_rgb_RequestQueue = nullptr;
#endif


void bsp_rgb_init(void) {
    RED_SET = GREEN_SET = BLUE_SET = 0;
    HAL_TIM_PWM_Start(BLUE_TIM, BLUE_CHANNEL);
    HAL_TIM_PWM_Start(RED_TIM, RED_CHANNEL);
    HAL_TIM_PWM_Start(GREEN_TIM, GREEN_CHANNEL);
#ifdef BSP_RGB_REQUEUE
    memset(&onGoing, 0, sizeof(onGoing));
    if (bsp_rgb_RequestQueue == nullptr) {
        bsp_rgb_RequestQueue = xQueueCreate(10, sizeof(bsp_rgb_RequestStruct));
    }
#endif
}


#ifdef BSP_RGB_REQUEUE

//typedef struct bsp_rgb_RequestStruct_ {
//    int16_t Type;       //00000000 00000000 -->> High for main type, Low for sub type
//    uint8_t Involved;    //00000111 -->> RGB
//    int16_t Duration;   //times to repeat, -1 stands forever. 0 stands for operation done
//} bsp_rgb_RequestStruct;

/**
 * @brief Pack the request and send it to the queue
 * @attention When nothing is in the queue all lights kills. If Duration set to -1, handle
 * will receive new requests.
 * @param Type_ Type of the Request
 * @param SubType_ SubType of the Request
 * @param Involved_ Involved RGBs
 * @param Duration_ How many times handle is called before expiring
 * @param Queue2Send_ Queue to send
 * @example bsp_rgb_Request(BSP_RGB_RE_CONSTANT, 0, BSP_RGB_Inv_R | BSP_RGB_Inv_G | BSP_RGB_Inv_B , 100, bsp_rgb_RequestQueue);
 * @return 0 if success, -1 if fucked
 */

int bsp_rgb_Request(int8_t Type_, int8_t SubType_, uint8_t Involved_, int16_t Duration_, QueueHandle_t Queue2Send_) {
    bsp_rgb_RequestStruct newRequest;
    newRequest.Duration = Duration_;
    newRequest.Type = (int16_t) (Type_ << 8 + SubType_);
    newRequest.Involved = Involved_;
    if (xQueueSend(bsp_rgb_RequestQueue, &newRequest, 0) == pdTRUE)
        return 0;
    return -1;
}


int bsp_rgb_handle() {
    if (onGoing.Duration <= 0) { //Should receive message if set to forever
        if (xQueueReceive(bsp_rgb_RequestQueue, &onGoing, 0) != pdTRUE) {
            if (onGoing.Duration != -1) {
                BLUE_SET = 0;
                GREEN_SET = 0;
                RED_SET = 0;
            }
            return -1;
        }
    }
    switch ((onGoing.Type) >> 8) {
        case BSP_RGB_RE_CONSTANT:
            BLUE_SET = (onGoing.Involved & 0b00000001) ? 2500 : 0;
            GREEN_SET = (onGoing.Involved & 0b00000010) ? 2500 : 0;
            RED_SET = (onGoing.Involved & 0b00000100) ? 2500 : 0;
            onGoing.Duration = onGoing.Duration > 0 ? onGoing.Duration - 1 : onGoing.Duration == -1 ? -1 : 0;
            break;
        case BSP_RGB_RE_BLINK:

            break;
        case BSP_RGB_RE_BRETHING:

            break;
        default:
            memset(&onGoing, 0, sizeof(onGoing));
            return -1;
    }

    return 0;
}


#endif

void bsp_rgb_set(uint16_t r, uint16_t g, uint16_t b) {
    RED_SET = r;
    GREEN_SET = g;
    BLUE_SET = b;
}


void bsp_rgb_gradational(void) {
    //static int last_enter_time = 0;
    //if (HAL_GetTick() - last_enter_time > 10)
    //{
    //	last_enter_time = HAL_GetTick();

    if (gradational >= 7500)
        gradational = 0;
    gradational += 100;
    switch (gradational > 2500 ? (gradational > 5000 ? 'b' : 'g') : 'r') {
        case 'r':
            bsp_rgb_set(2500 - gradational, gradational, 0);
            break;
        case 'g':
            bsp_rgb_set(0, 5000 - gradational, gradational - 2500);
            break;
        case 'b':
            bsp_rgb_set(gradational - 5000, 0, 7500 - gradational);
            break;
    }
    //}
}
