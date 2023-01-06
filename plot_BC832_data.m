clear all
close all
rawtable = readtable('20230104Data.csv');

% dtime = rawtable.Time - rawtable.Time(1);
dtime = 1:length(rawtable.Time);
CH0_V = rawtable.Ch0*2/1000; %battery
CH1_V = rawtable.Ch1*20.51/0.51/1000;%E-
CH2_V = rawtable.Ch2/1000; %RSENSE
CH3_V = rawtable.Ch3*20.51/0.51/1000; %E+
Impedance = (CH3_V - CH1_V)/(CH2_V/10);
%%
figure
subplot(5,1,1);
plot(dtime,CH0_V);
title('Battery voltage (V)')
hold on
subplot(5,1,4);
plot(dtime,CH1_V);
title('E- voltage (V)')
subplot(5,1,2);
plot(dtime,CH2_V);
title('Voltage across R_{sense} (V)')
subplot(5,1,3);
plot(dtime,CH3_V);
title('E+ voltage (V)') 
subplot(5,1,5);
plot(dtime,Impedance);
title('Impedance (kOhm)')
xlabel('Time (hrs)')

