/*
 * Copyright (c) 2022 Andy Belle-Isle. All Rights Reserved.
 */

#include <zephyr/device.h>
#include <zephyr/devicetree.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/drivers/adc.h>

static int soil_moisture_init(const struct device *dev)
{
    (void)dev;

    return 0;
}
