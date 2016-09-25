set(TOOLCHAIN_PATH ${CMAKE_CURRENT_LIST_DIR}/libopencm3)

set(CMAKE_C_COMPILER        /usr/bin/arm-none-eabi-gcc)
set(CMAKE_C_STANDARD        11)
set(CMAKE_C_COMPILER_WORKS   1)
set(CMAKE_CXX_COMPILER      /usr/bin/arm-none-eabi-g++)
set(CMAKE_CXX_STANDARD      14)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(stm32_common_CFlags "\
    -ffunction-sections -fdata-sections -fno-common --static -Wl,--gc-sections \
    -specs=nosys.specs -lm -lc -lgcc -lnosys -nostartfiles \
")

set(stm32f0_CFlags "-mcpu=cortex-m0 -mthumb \
    -DSTM32F0 -L${TOOLCHAIN_PATH} -lopencm3_stm32f0 -Tlibopencm3_stm32f0.ld")

set(stm32f3_CFlags "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 \
    -DSTM32F3 -L${TOOLCHAIN_PATH} -lopencm3_stm32f3 -Tlibopencm3_stm32f3.ld")

set(stm32f4_CFlags "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 \
    -DSTM32F4 -L${TOOLCHAIN_PATH} -lopencm3_stm32f4 -Tstm32f4-discovery.ld")

set(stm32l4_CFlags "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 \
    -DSTM32L4 -L${TOOLCHAIN_PATH} -lopencm3_stm32l4 -Tlibopencm3_stm32l4.ld")

set(CMAKE_C_FLAGS "${stm32f4_CFlags} ${stm32_common_CFlags} -DDEBUG=${DEBUG}"
CACHE STRING "" FORCE)

set(CMAKE_CXX_FLAGS ${CMAKE_C_FLAGS})


if (NOT TARGET lib-stm32f4)

add_custom_target(lib-stm32f0 WORKING_DIRECTORY ${TOOLCHAIN_PATH}/libopencm3
    COMMAND make -C libopencm3 lib/stm32/f0
    COMMAND cp libopencm3/lib/libopencm3_stm32f0.a  .
    COMMAND cp libopencm3/lib/libopencm3_stm32f0.ld .
)
add_custom_target(lib-stm32f3 WORKING_DIRECTORY ${TOOLCHAIN_PATH}
    COMMAND make -C libopencm3 lib/stm32/f3
    COMMAND cp libopencm3/lib/libopencm3_stm32f3.a  .
    COMMAND cp libopencm3/lib/libopencm3_stm32f3.ld .
)
add_custom_target(lib-stm32f4 WORKING_DIRECTORY ${TOOLCHAIN_PATH}
    COMMAND make -C libopencm3 lib/stm32/f4
    COMMAND cp libopencm3/lib/libopencm3_stm32f4.a  .
    COMMAND cp libopencm3/lib/libopencm3_stm32f4.ld .
)

add_custom_target(lib-stm32l4 WORKING_DIRECTORY ${TOOLCHAIN_PATH}
    COMMAND make -C libopencm3 lib/stm32/l4
    COMMAND cp libopencm3/lib/libopencm3_stm32l4.a  .
    COMMAND cp libopencm3/lib/libopencm3_stm32l4.ld .
)

endif()
