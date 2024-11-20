clear;clc
load train.mat
y2 = upsample(y,2);

subplot(2,1,1)
plot(y2)
title('unsampled version')
subplot(2,1,2)
plot(y)
title('original version')
linkaxes