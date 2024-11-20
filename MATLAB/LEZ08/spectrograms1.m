subplot(2,2,1)
load chirp.mat
spectrogram(y,hamming(round(0.05*Fs)),round(0.025*Fs),256,Fs,'yaxis')
title('chirp')
subplot(2,2,2)
load mtlb.mat
spectrogram(mtlb,hamming(round(0.05*Fs)),round(0.025*Fs),256,Fs,'yaxis')
title('mtlb')
subplot(2,2,3)
load train.mat
spectrogram(y,hamming(round(0.05*Fs)),round(0.025*Fs),256,Fs,'yaxis')
title('train')
subplot(2,2,4)
load laughter.mat
spectrogram(y,hamming(round(0.05*Fs)),round(0.025*Fs),256,Fs,'yaxis')
title('laughter')


figure
subplot(2,2,1)
load chirp.mat
spectrogram(y,hanning(round(0.05*Fs)),round(0.025*Fs),256,Fs,'yaxis')
title('chirp')
subplot(2,2,2)
load mtlb.mat
spectrogram(mtlb,hanning(round(0.05*Fs)),round(0.025*Fs),256,Fs,'yaxis')
title('mtlb')
subplot(2,2,3)
load train.mat
spectrogram(y,hanning(round(0.05*Fs)),round(0.025*Fs),256,Fs,'yaxis')
title('train')
subplot(2,2,4)
load laughter.mat
spectrogram(y,hanning(round(0.05*Fs)),round(0.025*Fs),256,Fs,'yaxis')
title('laughter')
