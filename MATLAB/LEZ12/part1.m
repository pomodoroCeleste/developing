% First let's filter an artificial signal. We'll add two sinewaves together:
% one with a frequency of 5 kHz and the other at 500 Hz. We've done this before,
% so no problem!
freq1 = 5000;
freq2 = 500;
Fs = 20000;
intvl = 1/Fs;
secs = 2;
tim = intvl : intvl : secs;
amp1 = 1;
amp2 = 1;
wave1 = sin(tim*2*pi*freq1) * amp1;
wave2 = sin(tim*2*pi*freq2) * amp2;
addwav = wave1 + wave2;
% We'll do a high-pass and a low-pass filter. We can have different
% frequencies for the high- and low-pass parts, but to start we'll use
% the same frequency, 2500Hz.
lowcut = 2500;
highcut = 2500;
% These next steps make the filter. There are many types of filter -
% the one we are using is called a "Butterworth" filter. The only
% thing to change here is the 'order' - which is the slope of the
% filter. Lower numbers have a broader slope, whereas higher
% numbers have a steeper slope.
order = 5;
lowcut = lowcut*2/Fs;
highcut = highcut*2/Fs;
[b,a] = butter(order,lowcut,'low');
[d,c] = butter(order,highcut,'high');

% Here is where the filtering actually occurs. 'filtfilt' takes the
% filter that we made above, and applies it to the signal, in this case
% addwav.
lowfilt = filtfilt(b,a,addwav);
highfilt = filtfilt(d,c,addwav);
% Now let's plot the results. Top is original signal, middle is high
% pass filtered, bottom is low-pass filtered.
subplot(3,1,1); specgram(addwav, 512, Fs);
subplot(3,1,2); specgram(highfilt, 512, Fs);
subplot(3,1,3); specgram(lowfilt, 512, Fs);