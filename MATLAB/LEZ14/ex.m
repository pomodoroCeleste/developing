% 1. dir: structure with the files of each folder
% 2. for loop running for each folder and windowize each file
% 3. for each frame compute the statistical features
clear;clc
addpath(genpath(pwd))
femaleRecordings = dir([pwd,'\female\*.wav']);
maleRecordings = dir([pwd,'\male\*.wav']);

maleFeatures = [];
index = 1;
h=waitbar(0,'extraction of male features');
for i=1:length(maleRecordings)
    [y,fs] = audioread(maleRecordings(i).name);
    M = windowize(y,0.025*fs,0.01*fs);
    for j=1:size(M,2)
        a=mean(M(:,j));
        b=var(M(:,j));
        c=quantile(M(:,j),0.25);
        d=median(M(:,j));
        e=quantile(M(:,j),0.75);
        maleFeatures(index,:) = [a b c d e];
        index = index + 1;
    end
    waitbar(i/length(maleRecordings))
end
close(h)

femaleFeatures = [];
index = 1;
h=waitbar(0,'extraction of female features');
for i=1:length(femaleRecordings)
    [y,fs] = audioread(femaleRecordings(i).name);
    M = windowize(y,0.025*fs,0.01*fs);
    for j=1:size(M,2)
        a=mean(M(:,j));
        b=var(M(:,j));
        c=quantile(M(:,j),0.25);
        d=median(M(:,j));
        e=quantile(M(:,j),0.75);
        femaleFeatures(index,:) = [a b c d e];
        index = index + 1;
    end
    waitbar(i/length(femaleRecordings))
end
close(h)


