local data = {};

-- Configuration file shared between iotSensor and iotLamp scripts.
--  Configure to your needs
 
data.sdaPin = 1;
data.sclPin = 2;
data.outputPin = 4;

data.host = ""; -- ex. "mqtt.dioty.co"
data.port = 8883; --ex. 8883
data.username = ""; -- username for broker
data.password = ""; --password for broker
-- Destination topics
data.temperatureTopic = "";
data.pressureTopic = "";
data.lampTopic = "";

-- How many times ESP will try to connect to broker
data.connectionAttempts = 3;
-- DeepSleep time in seconds
data.sleepTime = 30; 

-- PEM format certificate
-- This example is DIoTY MQTT certificate 
data.certificate = [[-----BEGIN CERTIFICATE-----
MIIEATCCAumgAwIBAgIJALlFBeielqZzMA0GCSqGSIb3DQEBBQUAMIGWMQswCQYD
VQQGEwJHQjEXMBUGA1UECAwOR3JlYXRlciBMb25kb24xDzANBgNVBAcMBkxvbmRv
bjEXMBUGA1UECgwOU3RhcnQgTGVhbiBMdGQxDjAMBgNVBAsMBURJb1RZMRUwEwYD
VQQDDAx3d3cuZGlvdHkuY28xHTAbBgkqhkiG9w0BCQEWDmFkbWluQGRpb3R5LmNv
MB4XDTE0MDYyNTEzNDk1N1oXDTI0MDYyMjEzNDk1N1owgZYxCzAJBgNVBAYTAkdC
MRcwFQYDVQQIDA5HcmVhdGVyIExvbmRvbjEPMA0GA1UEBwwGTG9uZG9uMRcwFQYD
VQQKDA5TdGFydCBMZWFuIEx0ZDEOMAwGA1UECwwFRElvVFkxFTATBgNVBAMMDHd3
dy5kaW90eS5jbzEdMBsGCSqGSIb3DQEJARYOYWRtaW5AZGlvdHkuY28wggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDTm+TcMLyWJmKkAz+Di4C32TIMX3Uj
i9iq5S3huICrWibo8y5bFhbuWVS/0dP1HLTZVCazS9DLAcvS15KnP6gi19jANTEu
mLPFwJFBRsxrdLx72yAQjHUzESzx/IyvTE2MsdpcYSFyWmhX+Fl3V3rj5TY+UJZm
fMEKnPuhq5ZoSo8eRcw1zTyhMhvVup+IbSOcp3rcAzMsllt/q9oxC7BqbGzZgSH2
YVg0f23Q7cNFMzaJPuGfheWvYQdondZaiwjN568GmDapfZvTdX21AVv9KN04tKTG
plti1A69d+kVzGTXVRyQXAvYGgEHvftu0BBdGvigarEjGvBJdqhZsn/RAgMBAAGj
UDBOMB0GA1UdDgQWBBSekA+7MDiMuu/Ivsv7rq4cHaQ5dzAfBgNVHSMEGDAWgBSe
kA+7MDiMuu/Ivsv7rq4cHaQ5dzAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUA
A4IBAQA4Qv9MTLHPPlJhTDsTiauvJ8nCRA5SrjACLT0RL1kFAVhZ7gwMkUv1ZG6E
mu0qrjhsxymQNPFrTqIjVtcwbSGmEozl5OJJaLW3QSBBKuR4ucdMZQaQ26J+6CNg
kzAVxN9AF1F3Vk9g9cVWRoJn7twyzB7y8WASXQOiuZrX/GBAnoOUG0LnOhZT9tE4
sdrqMfCK00roIt08hBItaVKIX9hRcES4rXfZspx3br3qAMphcCB4PIxhcWWt1cNd
dHUW6BEeRjuIZQrbeWPAwOm+/DMP9+h9+Y+Kp0Reu1Q98hio/sCyM6y4qAE/f2pi
MplNSgyPNMDcpOyObMOvL9gRSwHG
-----END CERTIFICATE-----]];

return data;