clear;clc

fs = 20000;
intlv = 1/fs;
secs = 2;
tim = intlv:intlv:secs;

freq1 = 1000;
ampl1 = 1;
index = 1; 

for freq2 = [1001 1002 1010]
    for ampl2 = [1 0.1 1.5]

        wave1 = sin(tim*2*pi*freq1)*ampl1;
        wave2 = sin(tim*2*pi*freq2)*ampl2;

        addwav = wave1 + wave2;

        figure(1)
        subplot(3, 3, index);
        plot(tim, addwav);
        title(['freq2: ', mat2str(freq2), '- ampl2: ', mat2str(ampl2)])

        figure(2)
        subplot(3, 3, index)
        specgram(addwav, 512, fs);
        title(['freq2: ', mat2str(freq2), '- ampl2: ', mat2str(ampl2)])

        index = index + 1;
    end
end