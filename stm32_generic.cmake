
add_custom_target(size
    DEPENDS main_binary
    COMMAND echo "Size of the binary:"
    COMMAND arm-none-eabi-size -A -d $<TARGET_FILE:main_binary>
)

add_custom_target(flash
    USES_TERMINAL
    DEPENDS main_binary size
    COMMAND arm-none-eabi-objcopy -Oihex $<TARGET_FILE:main_binary> $<TARGET_FILE:main_binary>.hex
    COMMAND echo \"Flashing the STM32 Board !\"
    COMMAND sudo openocd -f ${OpenOCD_CFG}
            -c \"reset_config none separate\"
            -c \"init\"
            -c \"reset init\"
            -c \"flash write_image erase $<TARGET_FILE:main_binary>.hex\"
            -c \"reset\"
            -c \"shutdown\"
)

add_custom_target(debug
    USES_TERMINAL
    COMMAND echo \"Debugging the STM32 Board !\"
    COMMAND ${CMAKE_CURRENT_LIST_DIR}/debug_openocd_gdb.sh ${OpenOCD_CFG} $<TARGET_FILE:main_binary>
)

add_custom_target(lib-stm32f0 WORKING_DIRECTORY ${TOOLCHAIN_PATH}
    COMMAND make -C libopencm3 lib/stm32/f0
)
add_custom_target(lib-stm32f1 WORKING_DIRECTORY ${TOOLCHAIN_PATH}
    COMMAND make -C libopencm3 lib/stm32/f1
)
add_custom_target(lib-stm32f3 WORKING_DIRECTORY ${TOOLCHAIN_PATH}
    COMMAND make -C libopencm3 lib/stm32/f3
)
add_custom_target(lib-stm32f4 WORKING_DIRECTORY ${TOOLCHAIN_PATH}
    COMMAND make -C libopencm3 lib/stm32/f4
)
add_custom_target(lib-stm32l4 WORKING_DIRECTORY ${TOOLCHAIN_PATH}
    COMMAND make -C libopencm3 lib/stm32/l4
)

set(TOOLCHAIN "libopencm3")
