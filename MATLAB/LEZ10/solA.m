clear;clc
% urlwrite('http://www.aphextwin.nu/visuals/hiddenfaces/equation9sec.wav', 'equation9sec.wav');
[y, FS]=audioread('equation9sec.wav');
y = mean(y,2);
F = logspace(log10(100),log10(22050),1024);
index=1;
for winSize=[1024 512 128]
    for f_s = [FS FS/2 FS/4]
        subplot(3,3,index)
        [~,f,t,p] = spectrogram(y,winSize,[],F,f_s);
        imagesc(t,f,10*log10(abs(p)));
        axis xy;
        xlabel('Time (s)', 'fontsize', 16);
        ylabel('Frequency (Hz)', 'fontsize', 16);
        set(gca,'Yscale','log');
        colormap hsv;
        title(['window ',mat2str(winSize),' FS = ', mat2str(f_s)])
        index=index+1;
    end
end
