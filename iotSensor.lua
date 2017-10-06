conf = require("config");
m = nil;
connAttempts = conf.connectionAttempts; 

function main()
  enduser_setup.start(start,function(err, str) print("Error: "..err.." "..str) end);
end

function start()
  print("Connected to wifi as:" .. wifi.sta.getip())
  bmp085.init(1,2);
  mqtt = mqtt.Client("MQTT"..node.chipid(), 120, conf.username, conf.password);
  net.cert.verify(conf.certificate);
  connectToBroker();
  mqtt:on("connect",function(client)
    print ("connected");
    sendData()
  end)
end

function connectToBroker()
  if(connnAttempts ~= 0) then
    mqtt:connect(conf.host, conf.port, 1, 0, function(con) print(con) end, handleMqttError);
  else
    node.dsleep(conf.sleepTime*1000000, 1);   
  end
end

function handleMqttError(client, reason)
   connAttempts = conncectionAttempts - 1;
  tmr.create():alarm(2*1000, tmr.ALARM_SINGLE, connectToBroker);
end

function sendData()
  local temp,pres = nil;
  print ("sending");
  temp = bmp085.temperature();
  pres = bmp085.pressure();
  if(temp ~= nil and pres ~= nil) then
    mqtt:publish(conf.temperatureTopic, (temp/10)..'.'..(temp%10), 0, 1);
    mqtt:publish(conf.pressureTopic, (pres/100)..'.'..(pres%100), 0, 1, function()
      tmr.create():alarm(1*1000, tmr.ALARM_SINGLE, closeAndSleep);
    end);
  else
    closeAndSleep();
  end
end

function closeAndSleep()
  mqtt:close();
  node.dsleep(conf.sleepTime*1000000, 1);
end

main();
