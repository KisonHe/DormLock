/** 
* @brief    RGB�ư弶֧�ְ�
* @details  
* @author   Asn
* @date     2019.10.20
* @version  1.0
* @par Copyright (c):  Asn
* @par ��־
*/
#ifndef __BSP_RGB_H
#define __BSP_RGB_H

#include "stm32f0xx_hal.h"
#include "cmsis_os.h"

#define BSP_RGB_REQUEUE

#define BSP_RGB_RE_CONSTANT (0)
#define BSP_RGB_RE_BLINK (1)
#define BSP_RGB_RE_BRETHING (2)

#define BSP_RGB_Inv_R (1<<0)
#define BSP_RGB_Inv_G (1<<1)
#define BSP_RGB_Inv_B (1<<2)

#ifdef __cplusplus
extern "C" {
#endif

void bsp_rgb_init(void);
void bsp_rgb_set(uint16_t r, uint16_t g, uint16_t b);
void bsp_rgb_gradational(void);


typedef struct bsp_rgb_RequestStruct_ {
    int16_t Type;       //00000000 00000000 -->> High for main type, Low for sub type
    uint8_t Involved;    //00000111 -->> RGB
    int16_t Duration;   //times to repeat, -1 stands forever. 0 stands for operation done
} bsp_rgb_RequestStruct;


extern QueueHandle_t bsp_rgb_RequestQueue;

#ifdef BSP_RGB_REQUEUE
int bsp_rgb_handle();
int bsp_rgb_Request(int8_t Type_,int8_t SubType_,uint8_t Involved_,int16_t Duration_,QueueHandle_t Queue2Send_);
#endif

#ifdef __cplusplus
}
#endif


#endif
