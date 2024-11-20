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
    [C,S,R,ceps]=frequency_features(angerFiles(i).name, 0.025, 0.01);
    tmp = [C' S' R' ceps'];
    angerFeats = [angerFeats; tmp];
        
    [C,S,R,ceps]=frequency_features(happyFiles(i).name, 0.025, 0.01);
    tmp = [C' S' R' ceps'];
    happyFeats = [happyFeats; tmp];
    
    [C,S,R,ceps]=frequency_features(sadFiles(i).name, 0.025, 0.01);
    tmp = [C' S' R' ceps'];
    sadFeats = [sadFeats; tmp];
end
% concatenate features from all classes
allFeats = [angerFeats; happyFeats; sadFeats];
% normalization
mn = mean(allFeats);
st = std(allFeats);
allFeats =  (allFeats - repmat(mn,size(allFeats,1),1))./repmat(st,size(allFeats,1),1);

% apply PCA
[coeff,score,latent,tsquared,explained] = pca(allFeats);
disp('explained variance...')
explained
% plotting
S=[]; % size of each point, empty for all equal
C=[repmat([1 0 0],length(angerFeats),1); repmat([0 1 0],length(happyFeats),1); repmat([0 0 1],length(sadFeats),1)];
    % define color R G B
scatter3(score(:,1),score(:,2),score(:,3),S,C)
axis equal
title('after PCA')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
zlabel('3rd Principal Component')
figure
scatter3(allFeats(:,1),allFeats(:,2),allFeats(:,3),S,C)
title('before PCA')