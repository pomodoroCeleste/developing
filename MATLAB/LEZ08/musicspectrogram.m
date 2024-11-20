clear; clc
[y,fs] = audioread('music.wav');
subplot(2,1,1)
plot(y)
xlabel('time (samples)')
ylabel('Amplitude')
axis tight
subplot(2,1,2)
spectrogram(y,round(0.05*fs),round(0.025*fs),1024,fs,'yaxis')