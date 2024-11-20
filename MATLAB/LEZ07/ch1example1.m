%example1.m

audioFilename = 'paulhill.wav'; %Define the name of the audio file 
[Y, Fs]=audioread(audioFilename); %Input the (mono) signal
timeAxis=(1:length(Y))/Fs;	% Convert sample number ot time vector
plot(timeAxis, Y);		% Plot the waveform
xlabel('time (seconds)');
title('Waveform');
set(findall(gcf,'-property','FontSize'),'FontSize',18)
range tight;
sound(Y, Fs);			% Playback the sound
