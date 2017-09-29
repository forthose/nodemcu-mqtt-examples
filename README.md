# nodemcu-mqtt-examples
Simple Lua scripts for NodeMCU to make own IoT device. iotSensor example uses BMP180 temperature and pressure sensor. To make iotLamp work you have to connect LED diode (or anything that draws less than 20mA on 3.3V) to pin number set in config file. For both examples you have to connect GPIO16 (D0 pin on WeMos D1 Mini) to reset pin to make deep sleep work.   

# How to use
These scripts are intended to use with NodeMCU 1.5.4.1-final because of problems with certificate verification in newer versions. Tested with NodeMCU built with these modules:

bmp085,enduser_setup,file,gpio,i2c,mdns,mqtt,net,node,tmr,uart,wifi,tls.

You can use https://nodemcu-build.com/ to build your own.

These examples work great with http://www.dioty.co/ broker. Other brokers will work, but not all can be verified by certificate. sampleConfig.lua file has to be configured to your needs and flashed as config.lua and iotSensor.lua or iotLamp.lua as init.lua 

You don't have to put WiFI credentials into config file - enduser setup will configure that for you.
