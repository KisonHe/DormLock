/**
 * @file task_main.cpp
 * @brief main task
 * @author KisonHe (kisonhe@qq.com)
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
TimerHandle_t adcBatteryVoltageMonitor = nullptr;
uint16_t ADC_raw = 0;
uint16_t Battery_Level = 0; // can only be 100,75,50,25,0

//todo set these values
// 8.8v, adc get 3300
// 8.0v, adc get 2600
// 7.0v, adc get 1750
// 6.5v, adc get 1350
// 5.5v, adc get 500
static uint16_t Battery100Threshold = 2600;
static uint16_t Battery75Threshold = 1750;
static uint16_t Battery50Threshold = 1350;
static uint16_t Battery25Threshold = 700;

/* Private function prototypes -----------------------------------------------*/


[[noreturn]] void Main_Task(void *pvParameters) {
    bsp_unlock_init();
    HAL_ADC_PollForConversion(&hadc, 50);


    bsp_rgb_init();

    adcBatteryVoltageMonitor = xTimerCreate("adcBatteryVoltageMonitor", pdMS_TO_TICKS(600000), true, nullptr, \
//adcTimerHook);
    [](TimerHandle_t xTimer) {
        HAL_ADC_Start(&hadc);
        HAL_ADC_PollForConversion(&hadc, 50);
        if (HAL_IS_BIT_SET(HAL_ADC_GetState(&hadc), HAL_ADC_STATE_REG_EOC)) ADC_raw = HAL_ADC_GetValue(&hadc);
        Battery_Level =
                ADC_raw > Battery100Threshold ? 100 : ADC_raw > Battery75Threshold ? 75 : ADC_raw > Battery50Threshold
                                                                                          ? 50 : ADC_raw >
                                                                                                 Battery25Threshold ? 25
                                                                                                                    : 0;
        HAL_ADC_Stop(&hadc);
    });
    xTimerStart(adcBatteryVoltageMonitor,1000);
    HAL_ADC_Start(&hadc);
    for (;;) {
        bsp_rgb_handle();
        osDelay(10);


    }
}


