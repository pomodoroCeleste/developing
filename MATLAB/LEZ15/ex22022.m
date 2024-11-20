clear;clc
angerFiles = dir([pwd,'\anger\*.wav']);
angerMFCCs = [];
h=waitbar(0,'extracting angerMFCCs...');
for i=1:length(angerFiles)
    [y,fs] = audioread(angerFiles(i).name);
    mfccs = mfcc(y, fs, 'WindowLength', ...
        0.025*fs, 'OverlapLength', ...
        0.01*fs, 'NumCoeffs', 12);
    angerMFCCs = [angerMFCCs ; mfccs];
    waitbar(i/length(angerFiles))
end
close(h)

happyFiles = dir([pwd,'\happiness\*.wav']);
happyMFCCs = [];
h=waitbar(0,'extracting happyMFCCs...');
for i=1:length(happyFiles)
    [y,fs] = audioread(happyFiles(i).name);
    mfccs = mfcc(y, fs, 'WindowLength', ...
        0.025*fs, 'OverlapLength', ...
        0.01*fs, 'NumCoeffs', 12);
    happyMFCCs = [happyMFCCs ; mfccs];
    waitbar(i/length(happyFiles))
end
close(h)