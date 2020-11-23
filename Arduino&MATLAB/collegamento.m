%% inizio:

%per vedere la porta seriale a cui è connessa arduino:
serialportlist("available")

%creazione  oggetto specificando porta e banda 

a=arduino('COM4','Mega2560','libraries','I2C');

%creazione oggetto per il sensore

indirizzi = scanI2CBus(a);
% qui ho trovato due indirizzi 
%l'indirizzo 0X1D è dedicato all'accellerometro
%l'indirizzo 0X6B è dadicato al giroscopio
accel = device( a,'I2CAddress',0x1D);
%infromazioni su accellerometro
%Interface: 'I2C'
% I2CAddress: 29 ('0x1D') 
%        Bus: 0
%     SCLPin: 'D21'
%     SDAPin: 'D20'
%   BitRate: 100000 (bits/s)
%write(acceleroemtro, 0x0, 'uint8')
%indirizzi presi dal datasheet
AXlow = readRegister(accel,hex2dec('28'),'int8');
AXhigh = readRegister(accel,hex2dec('29'),'int8');
AYlow = readRegister(accel,hex2dec('2A'),'int8');
AYhigh = readRegister(accel,hex2dec('2B'),'int8');
AZlow = readRegister(accel,hex2dec('2C'),'int8');
AZhigh = readRegister(accel,hex2dec('2D'),'int8');

  ax = double(typecast(int8([AXlow AXhigh]),'int16'));
  ay = double(typecast(int8([AYlow AYhigh]),'int16'));
  az = double(typecast(int8([AZlow AZhigh]),'int16'));

