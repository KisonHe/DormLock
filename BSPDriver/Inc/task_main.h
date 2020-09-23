#ifndef __TASK_MAIN_H
#define __TASK_MAIN_H

/* Includes ------------------------------------------------------------------*/

/* Standard STM Library */
#include "main.h"
#include "cmsis_os.h"

/* BSP Headers */

/* APP and Task Headers */

#ifdef __cplusplus
extern "C" {
#endif

extern TaskHandle_t Main_Task_Handle; /*系统状态任务句柄*/
[[noreturn]] void Main_Task(void *pvParameters);

#ifdef __cplusplus
}
#endif

#endif // !__TASK_CONTROL_H


