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



extern QueueHandle_t bsp_rgb_RequestQueue;

#ifdef BSP_RGB_REQUEUE
int bsp_rgb_handle();
int bsp_rgb_Request(int8_t Type_,int8_t SubType_,uint8_t Involved_,int16_t Duration_,QueueHandle_t Queue2Send_, int8_t isISR);
#endif

#ifdef __cplusplus
}
#endif


#endif
