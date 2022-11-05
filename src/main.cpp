#define ETL_NO_STL

#include <Arduino.h>

#include <etl/vector.h>

void setup()
{
    Serial.begin(115200);
    Serial.println("Initializing Analog Sensor");
}

void loop()
{
    int sensorValue = analogRead(A0);
    Serial.println(sensorValue);
    delay(500);
}
