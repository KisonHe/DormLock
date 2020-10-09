~~~
FrameHead | Function Word | SubFunctionWord | Data | SUM | FrameEnd
0xAF 0        1位 1              1位          16位    1位     0xFF 
  0             1                2            18     19       20
~~~


## Function Word

1. `0x00`

    Ask for heart beat pack. 

    SubFunctionWord: 
    1. `0x00` requesting

        Data: All 0x00

    2. `0x01` Reply from stm32 to nodemcu

        Data: 

        | Battery Level | STM32 ticks |      |      |      |      |      |      |      |
        | ---- | ------ | -------- | ----- | ----- | ----- | ---- | ------ | ---- |
        | int8 |  int32 |      |      |      |      |      |      |      |
    > `STM32 ticks`: Got by using HAL_GetTick()
    
    > Battery Level can only be 100,75,50,25,0

2. `0x01`

    Door opening

    SubFunctionWord: 
    1. `0x00` nodemcu requesting stm32 to open the door

        Data: All 0x00

    1. `0x01` stm32 reporting door opening

        | TimeStamp of opening |      |      |      |      |      |      |      |      |
        | ---- | ------ | -------- | ----- | ----- | ----- | ---- | ------ | ---- |
        | int32 |      |      |      |      |      |      |      |      |
    
3. `0x02`

    nodemcu freshing data to show over ips 

    SubFunctionWord: 
    1. `0x00` [TODO]

        Data: All 0x00

    2. `0x01` Weather info mation

        Data: 

        |  |      |      |      |      |      |      |      |      |
        | ---- | ------ | -------- | ----- | ----- | ----- | ---- | ------ | ---- |
        |      |      |      |      |      |      |      |      |      |


