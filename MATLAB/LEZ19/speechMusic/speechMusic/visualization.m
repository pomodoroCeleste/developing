clear
clc
addpath(genpath(pwd)) % add all folders and subfolders to MATLAB path
musicFiles=dir([pwd,'\music\*.mp3']);
speechFiles=dir([pwd,'\speech\*.wav']);

musicFeats=[];
speechFeats=[];
for i=1:length(musicFiles) % number of files
    [C,S,R,ceps]=frequency_features(musicFiles(i).name,0.03,0.01);
    tmp = [C' S' R' ceps'];
    musicFeats = [musicFeats; tmp];
end

for i=1:length(speechFiles)
    [C,S,R,ceps]=frequency_features(speechFiles(i).name,0.03,0.01);
    tmp = [C' S' R' ceps'];
    speechFeats = [speechFeats; tmp];
end
% concatenate features from all classes
allFeats = [musicFeats; speechFeats];
% normalization
mn = mean(allFeats);
st = std(allFeats);
allFeats =  (allFeats - repmat(mn,size(allFeats,1),1));%./repmat(st,size(allFeats,1),1);

% apply PCA
[coeff,score,latent,tsquared,explained] = pca(allFeats);
disp('explained variance...')
explained
% plotting
S=[]; % size of each point, empty for all equal
C=[repmat([1 0 0],length(musicFeats),1); repmat([0 1 0],length(speechFeats),1)];
    % define color R G B
scatter3(score(:,1),score(:,2),score(:,3),S,C)
axis equal
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
zlabel('3rd Principal Component')
figure
scatter3(allFeats(:,1),allFeats(:,2),allFeats(:,3),S,C)