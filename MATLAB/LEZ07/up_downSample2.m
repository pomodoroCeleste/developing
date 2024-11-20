clear;clc
load handel.mat

y_down = downsample(y,2);
y_up = upsample(y,2);

subplot(3,1,1)
plot(y(100:200))
title('original')

subplot(3,1,2)
plot(y_down(100:200))
title('downsampled')

subplot(3,1,3)
plot(y_up(100:200))
title('upsampled')

