# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(wifi)

# set(ZEPHYR_EXTRA_MODULES drivers/sensor/soil_moisture)
add_subdirectory(drivers)

FILE(GLOB app_sources src/*.cpp)
target_sources(app PRIVATE ${app_sources})
