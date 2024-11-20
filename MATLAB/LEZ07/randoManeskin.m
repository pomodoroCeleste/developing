clear; clc
[y,fs]=audioread('Maneskin-ZittiEBuonimono.wav');

a=randperm(floor(length(y)/2));
a(1)

randomExcerpt = y(a(1):a(1)+10*fs);
% soundsc(randomExcerpt,fs)

reverseRandomExcerpt = flipud(randomExcerpt);
soundsc(reverseRandomExcerpt,fs)

subplot(2,1,1)
plot(randomExcerpt)
title('original')
subplot(2,1,2)
plot(reverseRandomExcerpt)
title('reversed')

