clear;clc
load chirp
subplot(2,4,1)
spectrogram(y,'yaxis')
title('chirp-default')
subplot(2,4,2)
spectrogram(y, round(0.05*Fs), round(0.025*Fs), 256, Fs, 'yaxis')
title('chirp-custom')

load mtlb
subplot(2,4,3)
spectrogram(mtlb,'yaxis')
title('mtlb-default')
subplot(2,4,4)
spectrogram(mtlb, round(0.05*Fs), round(0.025*Fs), 256, Fs, 'yaxis')
title('mtlb-custom')

load train
subplot(2,4,5)
spectrogram(y,'yaxis')
title('train-default')
subplot(2,4,6)
spectrogram(y, round(0.05*Fs), round(0.025*Fs), 256, Fs, 'yaxis')
title('train-custom')


load laughter
subplot(2,4,7)
spectrogram(y,'yaxis')
title('laughter-default')
subplot(2,4,8)
spectrogram(y, round(0.05*Fs), round(0.025*Fs), 256, Fs, 'yaxis')
title('laughter-custom')
