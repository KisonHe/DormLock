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
#include "bsp_rgb.h"
/* Private typedef -----------------------------------------------------------*/


/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/


/* Private variables ---------------------------------------------------------*/
TaskHandle_t Main_Task_Handle = nullptr; /*系统状态任务句柄*/
TimerHandle_t adcBatteryCallLockDelayTimer = nullptr;
TimerHandle_t adcBatteryVoltageMonitor = nullptr;
uint16_t ADC_raw = 0;
uint16_t Battery_Level = 0; // can only be 100,75,50,25,0

//todo set these values
static uint16_t Battery100Threshold = 0;
static uint16_t Battery75Threshold = 0;
static uint16_t Battery50Threshold = 0;
static uint16_t Battery25Threshold = 0;

/* Private function prototypes -----------------------------------------------*/

static void adcBatteryHook(TimerHandle_t xTimer) {

}


[[noreturn]] void Main_Task(void *pvParameters) {
    bsp_unlock_init();
    HAL_ADC_PollForConversion(&hadc, 50);


    bsp_rgb_init();
    adcBatteryCallLockDelayTimer = xTimerCreate("adcBatteryCallLockDelayTimer", pdMS_TO_TICKS(60000), true, nullptr,
                                                adcBatteryHook);
    adcBatteryVoltageMonitor = xTimerCreate("adcBatteryVoltageMonitor", pdMS_TO_TICKS(60000), true, nullptr, \
    [](TimerHandle_t xTimer) {
        HAL_ADC_PollForConversion(&hadc, 50);
        if (HAL_IS_BIT_SET(HAL_ADC_GetState(&hadc), HAL_ADC_STATE_REG_EOC)) ADC_raw = HAL_ADC_GetValue(&hadc);
        Battery_Level =
                ADC_raw > Battery100Threshold ? 100 : ADC_raw > Battery75Threshold ? 75 : ADC_raw > Battery50Threshold
                                                                                          ? 50 : ADC_raw >
                                                                                                 Battery25Threshold ? 25
                                                                                                                    : 0;
    });
    HAL_ADC_Start(&hadc);
    for (;;) {
        bsp_rgb_handle();
        osDelay(10);


    }
}


