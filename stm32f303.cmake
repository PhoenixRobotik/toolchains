
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

set(Toolchain_CFlags "-ffunction-sections -fdata-sections -fno-common --static \
-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32F3")

set(Toolchain_LFlags "-Wl,--gc-sections -nostartfiles \
-L${TOOLCHAIN_PATH} -L${TOOLCHAIN_PATH}/libopencm3/lib -lopencm3_stm32f3 -Tstm32f303k8.ld \
-lm -lstdc++_nano -lc -lg -lrdimon")

set(OpenOCD_CFG "/usr/share/openocd/scripts/board/st_nucleo_f3.cfg")

