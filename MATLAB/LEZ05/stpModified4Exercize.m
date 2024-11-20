function stpFile(wavFile, windowLength, step)
%
% stpFile.m
%
% This function demonstrates the short-term processing of an audio signal
%
% ARGUMENTS:
% - wavFile: the name of the WAV file to be processed
% - windowLength: the length of the window (in seconds)
% - step: the window step (in seconds)
%
% (c) 2014 T. Giannakopoulos, A. Pikrakis

[x,fs] = audioread(wavFile);                      % read the WAV file

%CONVERT TO MONO
if size(x,2)==2, x=sum(x,2)/2; end
% convert window and step from seconds to samples:
windowLength = round(windowLength * fs); step = round(step * fs);
curPos = 1; L = length(x);
% compute the total number of frames:
numOfFrames = floor((L-windowLength)/step) + 1;
figure;
for (i=1:numOfFrames) % for each frame    
    frame  = x(curPos:curPos+windowLength-1);   % get current frame:    
    % multiply the frame with the hamming window:
    frameW = frame .* window(@hamming, length(frame));
    subplot(2,1,1); plot(frame); title('Current frame (original)');
    axis([0 length(frameW) -1 1])

    % plot windowed frame:
    subplot(2,1,2); plot(frameW); title('Current frame (windowed)');
    axis([0 length(frameW) -1 1]); drawnow;  pause(0.1);
    % DO SOMETHIN WITH 'frameW' HERE:
    xticks([0 length(frameW)/2 length(frameW)])
    xticklabels({mat2str(i*windowLength/fs), ...
        mat2str(i*windowLength/fs+windowLength/(2*fs)), ...
        mat2str(i*windowLength/fs + i*windowLength/fs}))
    xlabel('Time (s)')
    curPos = curPos + step;
end


% >> stpFile('music.wav', 1, 0.5)


% == a stpFileNew.m !!!!!