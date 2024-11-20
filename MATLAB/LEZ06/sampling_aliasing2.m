clear;clc

Fs = 1000;
time = 0:1/Fs:1;
Freq1 = 800;
Freq2 = 600;

X1 = sin(2*pi*Freq1*time);
X2 = sin(2*pi*Freq2*time);

soundsc(X1,Fs)
f_alias1 = abs(round(Freq1/Fs)*Fs-Freq1);

pause

soundsc(X2,Fs)
f_alias2 = abs(round(Freq2/Fs)*Fs-Freq2);

subplot(2,1,1)
spectrogram(X1, 'yaxis')
title('X1')

subplot(2,2,1)
spectrogram(X2, 'yaxis')
title('X2')


%% RICONTROLLA I SUBPLOT!!

