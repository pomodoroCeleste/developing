% Speech - music discrimination demo:
% Step 1: mid-term classification (classifier trained on speech - music):
[labels, Ps, Conf, centers, classNames] = mtFileClassification(...
     'speech_music_sample.wav', 3, 'modelSM.mat');

% Step 2: extract segment boundaries:
[a, fs] = audioread('speech_music_sample.wav');
totalDuration = length(a) / fs; % determine the input file's duration in seconds
[segs, classes, Labels] = segmentationProbSeq(...
    Ps, centers, totalDuration, 0); % segmentation (naive merging)
% write results on output:
for i=1:size(segs, 1)
    fprintf('segment %5d of %5d (%6.2f - %6.2f) : %10s\n', ...
        i, size(segs, 1), segs(i, 1), segs(i, 2), classNames{classes(i)+1});
    % play sound:
    [x, fs] = audioread(['speech_music_sample.wav'], ...
        round([segs(i,1) * fs + 1,  segs(i,2) * fs]));
    sound(x, fs);    
    pause
end