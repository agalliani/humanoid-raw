%% inizio:

%per vedere la porta seriale a cui è connessa arduino:
serialportlist("available")

%creazione  oggetto specificando porta e banda 

a=arduino('COM3','Mega2560','libraries','I2C','BaudRate',115200);

%creazione oggetto per il sensore

indirizzi = scanI2CBus(a);
% qui ho trovato due indirizzi 
%l'indirizzo 0X1D è dedicato all'accellerometro e  magnetometro
%l'indirizzo 0X6B è dadicato al giroscopio
accelmagn = device( a,'I2CAddress',0x1D);
giro = device(a,'I2CAddress',0x6B);
%infromazioni su accellerometro
%Interface: 'I2C'
% I2CAddress: 29 ('0x1D') 
%        Bus: 0
%     SCLPin: 'D21'
%     SDAPin: 'D20'
%   BitRate: 100000 (bits/s)
%write(acceleroemtro, 0x0, 'uint8')
%indirizzi presi dal datasheet
%% lettura dati 
n=50;
accelerometro = zeros(n,3);
giroscopio = zeros(n,3);
magnetometro = zeros(n,3);

for i=1:n
    
%lettura accellerometro
AXlow = readRegister(accelmagn,hex2dec('28'),'int8');
AXhigh = readRegister(accelmagn,hex2dec('29'),'int8');
AYlow = readRegister(accelmagn,hex2dec('2A'),'int8');
AYhigh = readRegister(accelmagn,hex2dec('2B'),'int8');
AZlow = readRegister(accelmagn,hex2dec('2C'),'int8');
AZhigh = readRegister(accelmagn,hex2dec('2D'),'int8');
[ax,ay,az] = lettura(AXlow,AXhigh,AYlow,AYhigh,AZlow,AZhigh);

accelerometro(i,1)=ax;
accelerometro(i,2)=ay;
accelerometro(i,3)=az;

%lettura giroscopio
GXlow = readRegister(giro,hex2dec('28'),'int8');
GXhigh = readRegister(giro,hex2dec('29'),'int8');
GYlow = readRegister(giro,hex2dec('2A'),'int8');
GYhigh = readRegister(giro,hex2dec('2B'),'int8');
GZlow = readRegister(giro,hex2dec('2C'),'int8');
GZhigh = readRegister(giro,hex2dec('2D'),'int8');


[gx,gy,gz] = lettura(GXlow,GXhigh,GYlow,GYhigh,GZlow,GZhigh);

giroscopio(i,1)=gx;
giroscopio(i,2)=gy;
giroscopio(i,3)=gz;

%lettura magnetometro
MXlow = readRegister(accelmagn,hex2dec('8'),'int8');
MXhigh = readRegister(accelmagn,hex2dec('9'),'int8');
MYlow = readRegister(accelmagn,hex2dec('A'),'int8');
MYhigh = readRegister(accelmagn,hex2dec('B'),'int8');
MZlow = readRegister(accelmagn,hex2dec('C'),'int8');
MZhigh = readRegister(accelmagn,hex2dec('D'),'int8');

[mx,my,mz] = lettura(MXlow,MXhigh,MYlow,MYhigh,MZlow,MZhigh);

magnetometro(i,1)=mx;
magnetometro(i,2)=my;
magnetometro(i,3)=mz;

pause(0.005)
end

 FUSE = ahrsfilter;
[orientation,angularVelocity] = FUSE(accelerometro,giroscopio,magnetometro);
quatAverage = meanrot(orientation)
velocita_angolare = mean(angularVelocity);




