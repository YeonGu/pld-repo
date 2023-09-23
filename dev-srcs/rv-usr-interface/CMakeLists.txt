cmake_minimum_required(VERSION 3.22.0)

project(rv_user_interface)

include_directories(core)

add_executable(rv_user_interface sim/main.c core/core.cpp)
