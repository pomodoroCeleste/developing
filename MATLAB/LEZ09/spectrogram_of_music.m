clear;clc

[Data Fs] = audioread('popPJSmithBeautyQueenmono.wav');

index = 1;

figure
for nfft = [32 128 512 2048 4096 8096] %come faccio a determinare quale valore è il migliore?
    subplot(2, 3, index)
    specgram(Data, nfft, Fs)
    colorbar
    title(['nfft:', mat2str(nfft)])
    index = index + 1;
end
sgtitle('pop song')