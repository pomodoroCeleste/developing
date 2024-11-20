clear; clc
addpath(genpath(pwd))
angerFiles = dir([pwd,'\anger\*.wav']);
happyFiles = dir([pwd,'\happiness\*.wav']);

i = randi(length(angerFiles))
j = randi(length(happyFiles))

[anger,fs] = audioread(angerFiles(i).name);
happy = audioread(happyFiles(j).name);

subplot(2,2,1)
plot(anger);title('anger')

subplot(2,2,2)
plot(happy);title('happy')

subplot(2,2,3)
spectrogram(anger,0.025*fs,0.01*fs,1024,fs,'yaxis')
title('anger')

subplot(2,2,4)
spectrogram(happy,0.025*fs,0.01*fs,1024,fs,'yaxis')
title('happy')
