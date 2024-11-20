function mp3towav(mp3filename)

if exist(mp3filename)==2
    signal   = audioread(mp3filename);
    info = audioinfo(mp3filename);
    Fs = info.SampleRate;
    audiowrite([mp3filename(1:end-4),'.wav'], signal, Fs);
    plot(signal)
	xlabel('Time (samples)')
	ylabel('Amplitude')
    sound(signal,Fs)
else
    disp('the file does not exist.')
end

