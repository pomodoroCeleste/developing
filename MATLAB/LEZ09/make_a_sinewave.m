clear;clc

freq = 5;
secs = 2;
index = 1;

for fs = [8 10 15 20 50 100]
    intlv = 1/fs;
    tim = intlv:intlv:secs;
    wav = sin(tim*2*pi*freq);
    subplot(2, 3, index);
    plot(tim, wav);
    title(['fs: ', mat2str(fs)]);
    index = index +1;
end