clear
clc
addpath(genpath(pwd)) % add all folders and subfolders to MATLAB path
angerFiles=dir([pwd,'\anger\*.wav']);
happyFiles=dir([pwd,'\happiness\*.wav']);
sadFiles=dir([pwd,'\sadness\*.wav']);

angerFeats=[];
happyFeats=[];
sadFeats=[];
for i=1:length(angerFiles) % number of files
    [C,S,R,ceps]=frequency_features(angerFiles(i).name, 0.03, 0.01);
    tmp = [C' S' R' ceps'];
    angerFeats = [angerFeats; tmp];
end
for i=1:length(happyFiles)
    [C,S,R,ceps]=frequency_features(happyFiles(i).name, 0.03, 0.01);
    tmp = [C' S' R' ceps'];
    happyFeats = [happyFeats; tmp];
end
for i=1:length(sadFiles)
    [C,S,R,ceps]=frequency_features(sadFiles(i).name, 0.03, 0.01);
    tmp = [C' S' R' ceps'];
    sadFeats = [sadFeats; tmp];
end

% concatenate features from all classes
allFeats = [angerFeats; happyFeats; sadFeats];
angerLabel = ones(1,length(angerFeats));
happyLabel = repmat(2,1,length(happyFeats));
sadLabel = repmat(3,1,length(sadFeats));
label = [angerLabel happyLabel sadLabel];

% normalization
mn = mean(allFeats);
st = std(allFeats);
allFeatsNorm =  (allFeats - repmat(mn,size(allFeats,1),1))./repmat(st,size(allFeats,1),1);

subplot(2,1,1)
plot(allFeats); grid on
title('before normalization')
subplot(2,1,2)
plot(allFeatsNorm); grid on
title('after normalization')

% scatter plot for each feature (without considering the MFCCs)
% so for spectral centroid, spread, and rolloff
figure
feats_name={'centroid','spread','rolloff'};
index = 1;
for i=1:3
    for j=1:3
        subplot(3,3,index)
        scatter(allFeats(:,i),allFeats(:,j),1,label)
        title(['features ',feats_name{i},' - ',feats_name{j}])
        index = index + 1;
    end
end
sgtitle('before normalization')

figure
index = 1;

for i=1:3
    for j=1:3
        subplot(3,3,index)
        scatter(allFeatsNorm(:,i),allFeatsNorm(:,j),1,label)
        title(['features ',feats_name{i},' - ',feats_name{j}])
        index = index + 1;
    end
end
sgtitle('after normalization')