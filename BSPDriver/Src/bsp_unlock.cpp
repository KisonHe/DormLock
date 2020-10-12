//
// Created by kisonhe on 2020/9/20.
//
#include "cmsis_os.h"
#include "bsp_unlock.h"
#include "tim.h"

#define CLOSE_POS (200)
#define OPEN_OPS (400)

TimerHandle_t lockCutPowerDelayTimer = nullptr;
TimerHandle_t unlockCallLockDelayTimer = nullptr;

/**
 * @brief The function to be hooked to cut servo power, after the servo back to closed location for some time
 * @param xTimer
 */
static void lockCutPowerHook(TimerHandle_t xTimer) {
    HAL_GPIO_WritePin(STEER_EN_GPIO_Port, STEER_EN_Pin, GPIO_PIN_RESET);
    xTimerStop(lockCutPowerDelayTimer, pdMS_TO_TICKS(500));
    xTimerStop(unlockCallLockDelayTimer, pdMS_TO_TICKS(500));
}

/**
 * @brief The function to be hooked, after the door is opened for a certain time and needs to close now
 * @param xTimer
 */
static void unlockCallLockHook(TimerHandle_t xTimer) {
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    __HAL_TIM_SET_COMPARE(&htim16, TIM_CHANNEL_1, CLOSE_POS);
    //wait for sometime then cut power
    xTimerStart(lockCutPowerDelayTimer, pdMS_TO_TICKS(5000));
}

/**
 * @brief Call this function to init the module
 */
void bsp_unlock_init() {
    lockCutPowerDelayTimer = xTimerCreate("lockCutPowerDelayTimer", pdMS_TO_TICKS(5000), false, nullptr,
                                          lockCutPowerHook);
    unlockCallLockDelayTimer = xTimerCreate("unlockCallLockDelayTimer", pdMS_TO_TICKS(5000), false, nullptr,
                                            unlockCallLockHook);

    HAL_TIM_PWM_Start(&htim16, TIM_CHANNEL_1);
    HAL_GPIO_WritePin(STEER_EN_GPIO_Port, STEER_EN_Pin, GPIO_PIN_RESET);
    //HAL_GPIO_WritePin(STEER_EN_GPIO_Port,STEER_EN_Pin,GPIO_PIN_SET);
    __HAL_TIM_SET_COMPARE(&htim16, TIM_CHANNEL_1, 0);

}

/**
 * @brief Call this function to open the door
 * @return
 */
int bsp_unlock() {
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    //function to open the door
    HAL_GPIO_WritePin(STEER_EN_GPIO_Port, STEER_EN_Pin, GPIO_PIN_SET);
    __HAL_TIM_SET_COMPARE(&htim16, TIM_CHANNEL_1, OPEN_OPS);
    xTimerStartFromISR(unlockCallLockDelayTimer, &xHigherPriorityTaskWoken);
}




