%example3.m

audioFilename = 'paulhill.wav'; %Define the name of the audio file 
[Y, Fs]=audioread(audioFilename); %Input the (mono) signal
timeAxis=(1:length(Y))/Fs;	% Convert sample number ot time vector
plot(timeAxis, Y);		% Plot the waveform
xlabel('time (seconds)');
title('Waveform');
sound(Y, Fs);			% Playback the sound



audioFilename = 'coltrane.wav'; %Define the name of the audio file 
[y, fs]=audioread(audioFilename);	% Read wave file (?????)
sound(y, fs);			% Playback (????)
left=y(:,1);			% Left channel (?????)
right=y(:,2);			% Right channel (?????)
subplot(2,1,1), plot((1:length(left))/fs, left);
subplot(2,1,2), plot((1:length(right))/fs, right);
