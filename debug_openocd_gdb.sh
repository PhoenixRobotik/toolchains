#!/bin/bash

if [ $# -eq 0 ] ; then
    OpenOCD_CFG=/usr/share/openocd/scripts/board/st_nucleo_f3.cfg
    Executable=build-libopencm3/PhoenixBoard_CarteKiwiTests
else
    OpenOCD_CFG=$1
    Executable=$2
fi

# Start "daemonized" OpenOCD
sudo openocd -f $OpenOCD_CFG        \
    -c "reset_config none separate" \
    -c "telnet_port 4444"           \
    -c "gdb_port 3333"              \
    -c "init" >/dev/null 2>&1 &

# Wait for OpenOCD to start
sleep 1

# Start GDB
arm-none-eabi-gdb -tui --eval-command="target remote localhost:3333" $Executable


# Quit OpenOCD
# { echo "shutdown"; sleep 1 } | telnet localhost 4444
