/* Linker script for ST STM32F303K8 (64K flash, 12K RAM). */

/* Define memory regions. */
MEMORY
{
    rom (rx)  : ORIGIN = 0x08000000, LENGTH = 60K
    usr (rw)  : ORIGIN = 0x0800F000, LENGTH = 4K
    ram (rwx) : ORIGIN = 0x20000000, LENGTH = 12K
}

/* Include the common ld script. */
INCLUDE libopencm3_stm32f3.ld

SECTIONS {
    user_data : {
        . = ALIGN(4);
        *(.user_data)
        . = ALIGN(4);
    } > usr

    /*
    .fill_eeprom : {
        FILL(0xDEADC0DE);
        . = ORIGIN(usr) + LENGTH(usr) - 1;
        BYTE(0xAA)
    } > usr
    */
}
