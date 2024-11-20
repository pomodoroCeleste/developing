%example2.m

audioFilename = 'paulhill.wav'; %Define the name of the audio file 
inputRange = 4000:4200;

[Y, Fs]=audioread(audioFilename, [inputRange(1) inputRange(end)]); %Input the (mono) signal
timeAxis=inputRange/Fs;	% Convert sample number ot time vector
plot(timeAxis, Y);		% Plot the waveform
xlabel('time (seconds)');
title('Waveform');

sound(Y, Fs);