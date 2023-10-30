cmake_minimum_required(VERSION 3.22.0)

project(rv_user_interface)
find_package(SDL2 REQUIRED)

SET(CMAKE_BUILD_TYPE "Debug")

include_directories(core ${SDL2_INCLUDE_DIRS})

add_executable(rv_user_interface sim/main.c sim/disp.c sim/fonts.c core/core.c core/print.c)

target_link_libraries(rv_user_interface ${SDL2_LIBRARIES})
