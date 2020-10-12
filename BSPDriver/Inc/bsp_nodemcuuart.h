#ifndef  __BSP_NODEMCUUART_HPP
#define  __BSP_NODEMCUUART_HPP

#include "main.h"
//外设相关宏定义
#define BSP_NODEMCU_UART                        huart1
//接收缓存的数组大小
#define BSP_NODEMCU_BUFFER_SIZE        (60)


#ifdef __cplusplus
extern "C" {
#endif

void bsp_modemcu_Init(); //初始化
void bsp_nodemcu_It(); //串口中断处理
int bsp_nodemcuuart_send(uint8_t FW, uint8_t SFW, uint8_t *data);
//HAL_StatusTypeDef bsp_nodemcu_reply(uint8_t _Functionword); //视觉传口发送函数


#ifdef __cplusplus
}
#endif

#endif
