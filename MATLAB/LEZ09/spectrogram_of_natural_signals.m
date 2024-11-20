clear;clc

[zfData zfFs] = audioread('zfinch.wav');
[wcsData wcsFs] = audioread('wcs.wav');

index = 1;
figure(1)
for nfft = [32 128 512 2048]
    subplot(2, 2, index)
    specgram(zfData, nfft, zfFs)
    colorbar
    title(['nfft:', mat2str(nfft)])
    index = index + 1;
end

index = 1;
figure(2)
for nfft = [32 128 512 2048]
    subplot(2, 2, index)
    specgram(wcsData, nfft, wcsFs)
    colorbar
    title(['nfft:', mat2str(nfft)])
    index = index + 1;
end
