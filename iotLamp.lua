conf = require("config");
m = nil;
connAttempts = conf.connectionAttempts; 

function main()
  enduser_setup.start(start, function(err, str) print("Error: "..err.." "..str) end);
end

function start()
  print("Connected to wifi as:" .. wifi.sta.getip())
  gpio.mode(conf.outputPin,gpio.OUTPUT);
  mqtt = mqtt.Client("MQTT"..node.chipid(), 120, conf.username, conf.password);
  net.cert.verify(conf.certificate);
  connectToBroker();
  mqtt:on("connect", function(client) 
    mqtt:subscribe(conf.lampTopic, 0, function(conn) print("subscribe success") end)
  end);
  mqtt:on("connected", function(client) print("connected") end);
  mqtt:on("message",function(client, topic, message)
    if (topic == conf.lampTopic) then
      toggleLamp(message); 
    end;    
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

function toggleLamp(message) 
  if (message == "true") then
    gpio.write(conf.outputPin, gpio.HIGH);
  else
    gpio.write(conf.outputPin, gpio.LOW);
  end
end

main();
