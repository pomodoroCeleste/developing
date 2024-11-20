clear all
clc

a=-0.95;
h=[1 a];
H=fft(h,1024); % padded with 1022 zeros

Fs=10000; % sampling frequency
N=length(H);
k=0:N-1; fk=k*Fs/N;
figure(1)
plot(fk,20*log10(abs(H))) % plot the magnitude of the frequency response in dB
%---------------
% y=filter([1 a],1,x); % for a given signal x
%---------------
figure(2)
a=-0.95;
h=[1 a];
Fs=10000; % sampling frequency
[H,F]=freqz(h,1,1024,Fs);
plot(F,20*log10(abs(H)))
