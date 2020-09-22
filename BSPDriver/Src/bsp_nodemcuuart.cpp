/** 
* @brief    视觉串口协议文件
* @details  32与nodemcu的通讯处理
*/
//extern "C" {
#include "bsp_nodemcuuart.h"
//}
#include "usart.h"
#include <cstring>

#include "task_main.h"
#include "bsp_unlock.h"

#define FRAME_HEAD 0xAF
#define FRAME_END 0xEF

#define FW_OPENDOOR 0x01
#define SFW_OPENDOOR_1 0x00

static uint8_t NodeMcuUART_Rxbuffer[BSP_NODEMCU_BUFFER_SIZE] = {0}; //串口接收数据缓存数组，现在缓冲区可以连续接收三帧的数据

static int fw_opendoor_handle(uint8_t sfw);
static int bsp_nodemcu_Analysis();
/**
* @brief  串口初始化
* @details  初始化
* @param  NULL
* @retval  NULL
*/
void bsp_modemcu_Init()
{
	__HAL_UART_CLEAR_IDLEFLAG(&BSP_NODEMCU_UART);												  //清除空闲中断位
	__HAL_UART_ENABLE_IT(&BSP_NODEMCU_UART, UART_IT_IDLE);										  //使能DMA接收空闲中断
	HAL_UART_Receive_DMA(&BSP_NODEMCU_UART, (uint8_t *)NodeMcuUART_Rxbuffer, BSP_NODEMCU_BUFFER_SIZE); //开始DMA接收
}

/**
* @brief  中断处理函数
* @details  
* @param  NULL
* @retval  NULL
*/
void bsp_modemcu_It()
{
	if (__HAL_UART_GET_FLAG(&BSP_NODEMCU_UART, UART_FLAG_IDLE) != RESET) //如果产生了空闲中断
	{
		HAL_UART_DMAStop(&BSP_NODEMCU_UART); //关闭DMA
        bsp_nodemcu_Analysis();
		//memset(NodeMcuUART_Rxbuffer, 0, BSP_NODEMCU_BUFFER_SIZE);										  //解析完成，数据清0
		__HAL_UART_CLEAR_IDLEFLAG(&BSP_NODEMCU_UART);												  //清除空闲中断标志位
		HAL_UART_Receive_DMA(&BSP_NODEMCU_UART, (uint8_t *)NodeMcuUART_Rxbuffer, BSP_NODEMCU_BUFFER_SIZE); //重新开启DMA接收传输
	}
}

static int bsp_nodemcu_Analysis()
{
	if (NodeMcuUART_Rxbuffer[0] == FRAME_HEAD && NodeMcuUART_Rxbuffer[20] == FRAME_END )
	{
		uint8_t tmp_sum = 0;
		//帧头帧尾对了，检测一次和校验
		for (int i = 1; i < 19; i++)
		    tmp_sum += NodeMcuUART_Rxbuffer[i];

		tmp_sum = tmp_sum & 0xff;
		if (tmp_sum != NodeMcuUART_Rxbuffer[19])
		    return -1;		  //校验和出错，直接退出,继续在缓冲区检测数据帧


		//帧头帧尾正确，和校验正确，开始解析
		
		switch (NodeMcuUART_Rxbuffer[1])
		{
		case FW_OPENDOOR:
            fw_opendoor_handle(NodeMcuUART_Rxbuffer[2]);
		    break;
		
		default:
			return 1;
		}
		memset(NodeMcuUART_Rxbuffer,0,sizeof(NodeMcuUART_Rxbuffer));
		return 0;		   
	}
	return -1;
}

static int fw_opendoor_handle(uint8_t sfw){
    switch (sfw) {
        case SFW_OPENDOOR_1:
            bsp_unlock();
            return 0;
            break;
        default:
            return -1;
            break;
    }
}

// /**
// * @brief  视觉串口解析函数
// * @details  对缓冲池中数据进行一次遍历并解析数据
// * @param  NULL
// * @retval  uint8_t 1还没有解析完整个缓冲池数据 0解析已经完成
// */
// static uint8_t bsp_vision_Analysis(void)
// {
// 	int16_t _check_sum = 0; //和校验用变量
// 	if(Array_index <= BSP_NODEMCU_BUFFER_SIZE-18) //缓冲区内开始检测
// 	{
// 		//缓冲区里检测数据帧，首先要帧头帧尾对了才开始解包
// 		if((Vision_Rxbuffer[Array_index+Frame_header]==FRAME_HEADER_DATA) && (Vision_Rxbuffer[Array_index+Frame_end]==FRAME_END_DATA))
// 		{
// 			//帧头帧尾对了，检测一次和校验
// 			for(int i=0; i<18; i++)
// 			{
// 				if(i!=Sum_check)	_check_sum+=Vision_Rxbuffer[Array_index+i];
// 			}
// 			_check_sum = _check_sum & 0xff;
// 			if(_check_sum!=Vision_Rxbuffer[Array_index+Sum_check])
// 			{
// 				Array_index += 1;  //和校验错了，指针移动1位继续重新检测
// 				return 1; //校验和出错，直接退出,继续在缓冲区检测数据帧
// 			}

// 			//帧头帧尾正确，和校验正确，开始解析
// 			static BaseType_t Linux_xHigherPriorityTaskWoken;
// 			xSemaphoreGiveFromISR(task_control_Linux_Update_Handle,&Linux_xHigherPriorityTaskWoken); //释放信号量
// 			switch (Vision_Rxbuffer[Array_index+Function_word])
// 			{
// 				case CMD_GIMBAL_RELATIVE_CONTROL:			//控制云台相对角度，数据解析
// 					bsp_vision_Rec_Data.Function_word = CMD_GIMBAL_RELATIVE_CONTROL;
// 					memcpy(&bsp_vision_Rec_Data.Pitch,Vision_Rxbuffer+Array_index+2,4);	//云台角度解析
// 					memcpy(&bsp_vision_Rec_Data.Yaw,Vision_Rxbuffer+Array_index+6,4);
// 					memcpy(&bsp_vision_Rec_Data.Cloud_mode,Vision_Rxbuffer+Array_index+10,1);	//云台模式解析
// 					memcpy(&bsp_vision_Rec_Data.Shoot_mode,Vision_Rxbuffer+Array_index+11,1);	//射击模式
// 					bsp_vision_Rec_Data.Ready_flag = 1;  //数据就绪
// 				break;
// 				case CMD_GIMBAL_ABSOLUTE_CONTROL:			//控制云台绝对角度，数据解析
// 					bsp_vision_Rec_Data.Function_word = CMD_GIMBAL_ABSOLUTE_CONTROL;
// 					memcpy(&bsp_vision_Rec_Data.Yaw,Vision_Rxbuffer+Array_index+2,4);
// 					memcpy(&bsp_vision_Rec_Data.Pitch,Vision_Rxbuffer+Array_index+6,4);
// 					memcpy(&bsp_vision_Rec_Data.Cloud_mode,Vision_Rxbuffer+Array_index+10,1);
// 					memcpy(&bsp_vision_Rec_Data.Shoot_mode,Vision_Rxbuffer+Array_index+11,1);
// 					bsp_vision_Rec_Data.Ready_flag = 1;		 //数据就绪
// 				break;
// 				case CMD_SHOOT:					//射击指令
// 					bsp_vision_Rec_Data.Function_word = CMD_SHOOT;
// 					bsp_vision_Rec_Data.Shoot_flag = 1; //射击指令就绪
// 					memcpy(&bsp_vision_Rec_Data.Shoot_speed,Vision_Rxbuffer+Array_index+2,4); //射击速度
// 					memcpy(&bsp_vision_Rec_Data.Shoot_freq,Vision_Rxbuffer+Array_index+6,1); //射击频率
// 					memcpy(&bsp_vision_Rec_Data.Shoot_mode,Vision_Rxbuffer+Array_index+7,1);	//射击模式
// 				break;
// 				case CMD_CHASSIS_CONTROL: //底盘控制
// 					bsp_vision_Rec_Data.Function_word = CMD_CHASSIS_CONTROL;
// 					//bsp_vision_Rec_Data.Ready_flag = 1;		 //数据就绪
// 					memcpy(&bsp_vision_Rec_Data.Vx,Vision_Rxbuffer+Array_index+2,4);	//底盘速度解析
// 					memcpy(&bsp_vision_Rec_Data.Vy,Vision_Rxbuffer+Array_index+6,4);
// 				break;
// 				case CMD_AUTO_ALIGN:  //自动对位信息获取
// 					bsp_vision_Rec_Data.Function_word = CMD_AUTO_ALIGN;
// 					bsp_vision_Rec_Data.ATD_Ready_flag = 1;		 //数据就绪
// 					memcpy(&bsp_vision_Rec_Data.VX_ATD,Vision_Rxbuffer+Array_index+2,2);  //X轴方向速度
// 					memcpy(&bsp_vision_Rec_Data.VY_ATD,Vision_Rxbuffer+Array_index+4,2);  //Y轴方向速度
// 					memcpy(&bsp_vision_Rec_Data.Chassis_Yaw,Vision_Rxbuffer+Array_index+6,4);  //Chassis_Yaw轴修正角度
// 					memcpy(&bsp_vision_Rec_Data.Cloud_Yaw,Vision_Rxbuffer+Array_index+10,4);  //Cloud_Yaw轴修正角度
// 				default:
// 				break;
// 			}
// 			//运行到这里就表示解析已经成功，一帧数据已经完备
// 			Array_index +=18; //数据帧一帧长度为18，所以移动18位
// 			return 1; //处理完一帧，移动18位继续检测
// 		}
// 		else
// 		{
// 			Array_index+=1; //帧头帧尾不对，移动一位继续检测
// 			return 1;
// 		}
// 	}
// 	else //余下的数据明显不能构成一帧了，结束解析
// 	{
// 		Array_index = 0; //将指针复位
// 		return 0; //已经遍历一遍缓冲区，结束处理
// 	}
// }
