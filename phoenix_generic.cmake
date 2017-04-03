
if(NOT DEFINED MainModule)
    set(MainModule TRUE)
    set(Root_Directory "${CMAKE_CURRENT_LIST_DIR}/..")
else()
    set(MainModule FALSE)
endif()

if(MainModule)
    # The "real" current build directory
    set(CURRENT_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR})

    set(CMAKE_CXX_STANDARD  14)
    set(CMAKE_C_STANDARD    11)

    include(${Toolchain})

    include_directories(${Root_Directory})

    set(CMAKE_C_FLAGS "${Toolchain_CFlags} -fdiagnostics-color=always -Wall -DDEBUG=${DEBUG}")

    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions")
endif()
