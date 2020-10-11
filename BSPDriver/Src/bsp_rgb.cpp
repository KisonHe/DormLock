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
bsp_rgb_Request onGoing;
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
        bsp_rgb_RequestQueue = xQueueCreate(10, sizeof(bsp_rgb_Request));
    }
#endif
}


#ifdef BSP_RGB_REQUEUE

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

void bsp_rgb_rand(void) {
    switch (rand() % 6) {
        case 0:
            bsp_rgb_set(2500, 0, 0);
            break;
        case 1:
            bsp_rgb_set(0, 2500, 0);
            break;
        case 2:
            bsp_rgb_set(0, 0, 2500);
            break;
        case 3:
            bsp_rgb_set(2500, 2500, 0);
            break;
        case 4:
            bsp_rgb_set(2500, 0, 2500);
            break;
        case 5:
            bsp_rgb_set(0, 2500, 2500);
            break;
        case 6:
            bsp_rgb_set(2500, 2500, 2500);
            break;
    }
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
