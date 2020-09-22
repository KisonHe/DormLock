//
// Created by kisonhe on 2020/9/20.
//
#include "cmsis_os.h"
#include "bsp_unlock.h"
#include "tim.h"

#define CLOSE_POS 0
#define OPEN_OPS 0

TimerHandle_t lockCutPowerDelayTimer = nullptr;
TimerHandle_t unlockCallLockDelayTimer = nullptr;

/**
 * @brief The function to be hooked to cut servo power, after the servo back to closed location for some time
 * @param xTimer
 */
static void lockCutPowerHook(TimerHandle_t xTimer){
    HAL_GPIO_WritePin(STEER_EN_GPIO_Port,STEER_EN_Pin,GPIO_PIN_RESET);
    xTimerStop(lockCutPowerDelayTimer,pdMS_TO_TICKS(50));
    xTimerStop(unlockCallLockDelayTimer,pdMS_TO_TICKS(50));
}

/**
 * @brief The function to be hooked, after the door is opened for a certain time and needs to close now
 * @param xTimer
 */
static void unlockCallLockHook(TimerHandle_t xTimer){
    __HAL_TIM_SET_COMPARE(&htim16, TIM_CHANNEL_4, CLOSE_POS);
    //wait for sometime then cut power
    xTimerStart(lockCutPowerDelayTimer,pdMS_TO_TICKS(2000));
}

/**
 * @brief Call this function to init the module
 */
void bsp_unlock_init(){
    lockCutPowerDelayTimer = xTimerCreate("lockCutPowerDelayTimer", pdMS_TO_TICKS(2000), false, nullptr,lockCutPowerHook);
    unlockCallLockDelayTimer = xTimerCreate("unlockCallLockDelayTimer", pdMS_TO_TICKS(5000), false, nullptr,unlockCallLockHook);

    HAL_TIM_PWM_Start(&htim16,TIM_CHANNEL_1);
    HAL_GPIO_WritePin(STEER_EN_GPIO_Port,STEER_EN_Pin,GPIO_PIN_RESET);
    __HAL_TIM_SET_COMPARE(&htim16, TIM_CHANNEL_4, CLOSE_POS);

}

/**
 * @brief Call this function to open the door
 * @return
 */
int bsp_unlock(){
    //function to open the door
    HAL_GPIO_WritePin(STEER_EN_GPIO_Port,STEER_EN_Pin,GPIO_PIN_SET);
    __HAL_TIM_SET_COMPARE(&htim16, TIM_CHANNEL_4, OPEN_OPS);
    xTimerStart(unlockCallLockDelayTimer,pdMS_TO_TICKS(5000));
}




