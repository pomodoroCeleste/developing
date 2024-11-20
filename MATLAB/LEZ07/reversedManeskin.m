clear; clc
[y,fs]=audioread('Maneskin-ZittiEBuonimono.wav');

a=randperm(length(y)-10*fs);
randomStart = a(1); %start from this sample

randomPart = y(randomStart:randomStart+10*fs);

revRandomPart = flipud(randomPart);

subplot(2,1,1); plot(randomPart); title('randomply-selected 10sec')
axis tight
subplot(2,1,2); plot(revRandomPart); title('reversed')
axis tight