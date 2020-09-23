/**
 * @file task_control.c
 * @brief KisonHe 的控制任务
 * @author KisonHe (kisonhe@qq.com)
 * @version 1.0
 * @date 2020-04-28
 * @copyright Copyright (c) 2020
 * @par History:*  Version    Date            Author          Modification
 * V1.0.0     2019-11-23      KisonHe			1. 
 * V1.1.0     2019-12-31      KisonHe			1.代码重构 
 * V2.0.0     2020-04-27      KisonHe			2.手滑导致代码丢失，全面部署git并尝试修复 
 */


/* Includes ------------------------------------------------------------------*/
#include <adc.h>
#include <bsp_unlock.h>
#include "task_main.h"
#include "main.h"
/* Private typedef -----------------------------------------------------------*/


/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/


/* Private variables ---------------------------------------------------------*/
TaskHandle_t Main_Task_Handle = nullptr; /*系统状态任务句柄*/
TimerHandle_t adcBatteryCallLockDelayTimer = nullptr;
/* Private function prototypes -----------------------------------------------*/

static void adcBatteryHook(TimerHandle_t xTimer){

}


[[noreturn]] void Main_Task(void *pvParameters)
{
    bsp_unlock_init();
    adcBatteryCallLockDelayTimer = xTimerCreate("adcBatteryCallLockDelayTimer", pdMS_TO_TICKS(60000), true, nullptr,adcBatteryHook);
	//HAL_ADC_Start(&hadc);
	for(;;)
	{

	    osDelay(1);
	  
	}
}


