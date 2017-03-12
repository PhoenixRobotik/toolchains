add_custom_target(flash
    USES_TERMINAL
    DEPENDS main_binary
    COMMAND arm-none-eabi-objcopy -Oihex $<TARGET_FILE:main_binary> $<TARGET_FILE:main_binary>.hex
    COMMAND echo "Flashing the STM32 Board !"
    COMMAND sudo openocd -f ${OpenOCD_CFG}
            -c \"init\"
            -c \"reset init\"
            -c \"flash write_image erase $<TARGET_FILE:main_binary>.hex\"
            -c \"reset\"
            -c \"shutdown\"
)

set(TOOLCHAIN "libopencm3")