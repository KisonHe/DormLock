/** 
* @brief    视觉串口协议文件
* @details  32与nodemcu的通讯处理
*/

#include "bsp_nodemcuuart.h"
#include "usart.h"
#include <cstring>

#include "task_main.h"
#include "bsp_unlock.h"
#include "bsp_rgb.h"

#define FRAME_HEAD 0xAF
#define FRAME_END 0xFF

#define FW_OPENDOOR (0x01)
#define SFW_OPENDOOR_ASK (0x00)
#define SFW_OPENDOOR_REPLY (0x00)

#define FW_ASKHEARTBEAT (0x00)
#define SFW_ASKHEARTBEAT_REQUEST (0x00)
#define SFW_ASKHEARTBEAT_REPLY (0x01)

static uint8_t NodeMcuUART_Rxbuffer[BSP_NODEMCU_BUFFER_SIZE] = {0};

static int fw_opendoor_handle(uint8_t sfw);

static int fw_askheartbeat_handle(uint8_t sfw);

static int bsp_nodemcu_Analysis();

/**
* @brief  串口初始化
* @details  初始化
* @param  NULL
* @retval  NULL
*/
void bsp_modemcu_Init() {
    __HAL_UART_CLEAR_IDLEFLAG(&BSP_NODEMCU_UART);                                                  //清除空闲中断位
    __HAL_UART_ENABLE_IT(&BSP_NODEMCU_UART, UART_IT_IDLE);                                          //使能DMA接收空闲中断
    HAL_UART_Receive_DMA(&BSP_NODEMCU_UART, (uint8_t *) NodeMcuUART_Rxbuffer, BSP_NODEMCU_BUFFER_SIZE); //开始DMA接收
}

/**
* @brief  中断处理函数
* @details  
* @param  NULL
* @retval  NULL
*/
void bsp_nodemcu_It() {
    if (__HAL_UART_GET_FLAG(&BSP_NODEMCU_UART, UART_FLAG_IDLE) != RESET) //如果产生了空闲中断
    {
        HAL_UART_DMAStop(&BSP_NODEMCU_UART); //关闭DMA
        bsp_nodemcu_Analysis();
        memset(NodeMcuUART_Rxbuffer, 0, BSP_NODEMCU_BUFFER_SIZE);                                          //解析完成，数据清0
        __HAL_UART_CLEAR_IDLEFLAG(&BSP_NODEMCU_UART);                                                  //清除空闲中断标志位
        __HAL_UART_CLEAR_OREFLAG(&BSP_NODEMCU_UART);
        HAL_UART_Receive_DMA(&BSP_NODEMCU_UART, (uint8_t *) NodeMcuUART_Rxbuffer,
                             BSP_NODEMCU_BUFFER_SIZE); //重新开启DMA接收传输
    }
}

static int bsp_nodemcu_Analysis() {
    if ((NodeMcuUART_Rxbuffer[0] == FRAME_HEAD) && (NodeMcuUART_Rxbuffer[20] == FRAME_END)) {
        uint8_t tmp_sum = 0;
        //帧头帧尾对了，检测一次和校验
        for (int i = 1; i < 19; i++)
            tmp_sum += NodeMcuUART_Rxbuffer[i];

        tmp_sum = tmp_sum & 0xff;
        if (tmp_sum != NodeMcuUART_Rxbuffer[19])
            return -1;          //校验和出错，直接退出,继续在缓冲区检测数据帧


        //帧头帧尾正确，和校验正确，开始解析

        switch (NodeMcuUART_Rxbuffer[1]) {
            case FW_OPENDOOR:
                fw_opendoor_handle(NodeMcuUART_Rxbuffer[2]);
                break;
            case FW_ASKHEARTBEAT:
                fw_askheartbeat_handle(NodeMcuUART_Rxbuffer[2]);

            default:
                return 1;
        }
        return 0;
    }
    return -1;
}

static int fw_askheartbeat_handle(uint8_t sfw) {
    switch (sfw) {
        case SFW_ASKHEARTBEAT_REQUEST:
            uint8_t data[20];
            memset(data, 0, sizeof(data));
            memcpy(data, &Battery_Level, sizeof(Battery_Level));
            bsp_nodemcuuart_send(FW_ASKHEARTBEAT, SFW_ASKHEARTBEAT_REPLY, data);
            bsp_rgb_Request(BSP_RGB_RE_CONSTANT,0,BSP_RGB_Inv_R,50,bsp_rgb_RequestQueue,1);
            return 0;
            break;
        default:
            return -1;
            break;
    }
}


static int fw_opendoor_handle(uint8_t sfw) {
    switch (sfw) {
        case SFW_OPENDOOR_ASK:
            bsp_unlock();
            uint8_t data[20];
            uint32_t tick;
            tick = HAL_GetTick();
            memset(data, 0, sizeof(data));
            memcpy(data, &tick, sizeof(tick));
            bsp_nodemcuuart_send(FW_OPENDOOR, SFW_OPENDOOR_REPLY, data);
            bsp_rgb_Request(BSP_RGB_RE_CONSTANT,0,BSP_RGB_Inv_B,100,bsp_rgb_RequestQueue,1);
            return 0;
            break;
        default:
            return -1;
            break;
    }
}


int bsp_nodemcuuart_send(uint8_t FW, uint8_t SFW, uint8_t *data) {
    static uint8_t Message[22];
    uint8_t tmp_sum = 0;
    memset(Message, 0, sizeof(Message));
    Message[0] = 0xAF;
    Message[1] = FW;
    Message[2] = SFW;
    memcpy(&Message[3], data, 16);
    for (int i = 1; i < 19; i++) {
        tmp_sum += Message[i];
    }
    Message[19] = tmp_sum;
    Message[20] = 0xFF;
    return HAL_UART_Transmit_DMA(&BSP_NODEMCU_UART, Message, 21);
}