
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_C_STANDARD 11)

set(CMAKE_C_FLAGS "-Os -g -Wl,--gc-sections -lm -lpthread -DDEBUG=${DEBUG}")
set(CMAKE_CXX_FLAGS ${CMAKE_C_FLAGS})

add_definitions("-Os -W -Wall")
# Clean unused sections on link
add_definitions("-ffunction-sections -fdata-sections -Wl,--gc-sections")
