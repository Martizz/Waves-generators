%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%     Techniki optymalizacji    %%%%%%%%%%%%
%%%%%%%%%%%%        Projekt: etap 1.       %%%%%%%%%%%%
%%%%%%%%%%%%   Wykonanie: Marta Zawadzka   %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clc
clear all

pkg load signal

function[signalWithNoise] = addNoise(signal, A, t)
noise = A * randn(1, length(t))
signalWithNoise = signal + noise
end
%
%
% Sine Plot
function[] = generateSinePlot()
A = 1
B = 2
f = 10
phase = pi
fs = 40*f %sampling frequency
An = 0.3 %noise amplitude
dt = 1/fs;
t = 0:dt:1

y1 = A*sin(2*pi*f*t + phase) + B
subplot(3, 2, 1)
plot(t, y1)
title('Sine plot')
xlabel('time t')
ylabel('Amplitude A')

y1_noisy = addNoise(y1, An, t)
subplot(3, 2, 2)
plot(t, y1_noisy)
title('Sine plot with noise')
xlabel('time t')
ylabel('Amplitude A')
grid ON
end
%
% Square Plot
function[] = generateSquarePlot()
A = 1
B = 1
f = 10
k = 50 %duty cycle
fs = 40*f %sampling frequency
An = 0.3
dt = 1/fs;
t = 0:dt:1

y2 = A*square(2*pi*f*t, k) + B
subplot(3, 2, 3)
plot(t, y2)
title('Square plot')
xlabel('time t')
ylabel('Amplitude A')

y2_noisy = addNoise(y2, An, t)
subplot(3, 2, 4)
plot(t, y2_noisy)
title('Square plot with noise')
xlabel('time t')
ylabel('Amplitude A')
grid ON
end
%
% Triangle Plot
function[] = generateTrianglePlot()
A = 1
B = 1
f = 10
fs = 40*f %sampling frequency
An = 0.3
dt = 1/fs;
t = 0:dt:1

y3 = A*sawtooth(2*pi*f*t) + B
subplot(3, 2, 5)
plot(t, y3)
title('Triangle plot')
xlabel('time t')
ylabel('Amplitude A')

y3_noisy = addNoise(y3, An, t)
subplot(3, 2, 6)
plot(t, y3_noisy)
title('Triangle plot with noise')
xlabel('time t')
ylabel('Amplitude A')
grid ON
end
%
%%%%%   MAIN PART   %%%%%
generateSinePlot()
generateSquarePlot()
generateTrianglePlot()