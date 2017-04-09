
# To be include by the project
set(GenericCmakeLists   "${CMAKE_CURRENT_LIST_DIR}/phoenix_generic.cmake")

set(Toolchain           "${CMAKE_CURRENT_LIST_DIR}/stm32_generic.cmake")


set(TOOLCHAIN_PATH ${CMAKE_CURRENT_LIST_DIR}/libopencm3)
include_directories (${TOOLCHAIN_PATH}/libopencm3/include)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
# set(CMAKE_SYSTEM_PROCESSOR )

set(CMAKE_C_COMPILER        /usr/bin/arm-none-eabi-gcc)
set(CMAKE_C_COMPILER_WORKS   1)
set(CMAKE_CXX_COMPILER      /usr/bin/arm-none-eabi-g++)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(Toolchain_CFlags "-Os -ffunction-sections -fdata-sections -fno-common --static \
-mcpu=cortex-m0 -mthumb -mfloat-abi=soft -DSTM32F0")

set(Toolchain_LFlags "-Os -Wl,--gc-sections -nostartfiles \
-L${TOOLCHAIN_PATH} -L${TOOLCHAIN_PATH}/libopencm3/lib -lopencm3_stm32f0 -Tstm32f0.ld \
-lm -lstdc++_nano -lc -lg -lrdimon")

set(OpenOCD_CFG "board/stm32f0discovery.cfg")

