% The first step is to make a noisy signal.
% Set the length, in seconds
len = 1;
% Set the SampleRate, in Hz. and make a time series...
Fs = 20000;
tim = 1/Fs:1/Fs:len;
% Make the noise sequence using randn. The arguments are in two
% dimensional we want a 1 dimensional noisy sequence, hence the
% second dimension is '1'.
noisy=randn(length(tim),1);
% We can plot this
figure(1);
subplot(3,1,1); specgram(noisy,512,Fs);
% Now we filter, as above, and plot
order = 5;
lowcut = 1500;
highcut = 5700;
lowcut = lowcut*2/Fs;
highcut = highcut*2/Fs;
[b,a] = butter(order,lowcut,'low');
[d,c] = butter(order,highcut,'high');

% Here is where the filtering actually occurs. 'filtfilt' takes the
% filter that we made above, and applies it to the signal, in this case
% addwav.
lowfilt = filtfilt(b,a,noisy);
highfilt = filtfilt(d,c,noisy);
subplot(3,1,2); specgram(highfilt, 512, Fs);
subplot(3,1,3); specgram(lowfilt, 512, Fs);
