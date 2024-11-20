clear
clc
addpath(genpath(pwd)) % add all folders and subfolders to MATLAB path
maleFiles=dir([pwd,'\male\*.wav']);
femaleFiles=dir([pwd,'\female\*.wav']);

maleFeats=[];
femaleFeats=[];

for i=1:length(maleFiles) % number of files
    [C,S,R,ceps]=frequency_features(maleFiles(i).name, 0.03, 0.01);
    tmp = [C' S' R' ceps'];
    maleFeats = [maleFeats; tmp];
end
for i=1:length(femaleFiles)
    [C,S,R,ceps]=frequency_features(femaleFiles(i).name, 0.03, 0.01);
    tmp = [C' S' R' ceps'];
    femaleFeats = [femaleFeats; tmp];
end

% concatenate features from all classes
allFeats = [maleFeats; femaleFeats];
maleLabel = ones(1,length(maleFeats)); % serves for visualization purposes
femaleLabel = repmat(2,1,length(femaleFeats));
label = [maleLabel femaleLabel]; 

% normalization
mn = mean(allFeats);
st = std(allFeats);
allFeatsNorm =  (allFeats - repmat(mn,size(allFeats,1),1))./repmat(st,size(allFeats,1),1);

subplot(2,1,1)
plot(allFeats); grid on
subplot(2,1,2)
plot(allFeatsNorm); grid on

% scatter plot for each feature (without considering the MFCCs)
% so for spectral centroid, spread, and rolloff
figure
index = 1;
for i=1:4
    for j=1:4
        subplot(4,4,index)
        scatter(allFeats(:,i),allFeats(:,j),1,label)
        index = index + 1;
    end
end

figure 
index = 1;
for i=1:4
    for j=1:4
        subplot(4,4,index)
        scatter(allFeatsNorm(:,i),allFeatsNorm(:,j),1,label)
        index = index + 1;
    end
end