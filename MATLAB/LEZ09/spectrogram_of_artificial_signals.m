clear;clc

fs = 20000;
intlv = 1/fs;
secs = 2;
tim = intlv:intlv:secs;

freq1 = 1000;
ampl1 = 1;
freq2 = 4200;
ampl2 = 0.5;


wave1 = sin(tim*2*pi*freq1)*ampl1;
wave2 = sin(tim*2*pi*freq2)*ampl2;

addwav = wave1 + wave2;
index = 1;

for nfft = [512 1024 2048 8096]
    subplot(2, 2, index)
    specgram(addwav, nfft, fs)
    title('nfft: ', mat2str(nfft))
    index = index + 1;
end

