clear; clc
addpath(genpath(pwd))
disp('extract features of speaker 1...')
filesSpeaker1 = dir([pwd,'\speech\DR1*.*']);
feats1 = [];
for i=1:length(filesSpeaker1)
    [C, S, E, F, R]  = frequencyFeatures(filesSpeaker1(i).name,0.025,0.01);
    tmp = [C; S; E; F; R];
    feats1 = [feats1  tmp];
end

disp('extract features of speaker 2...')
filesSpeaker2 = dir([pwd,'\speech\DR2*.*']);
feats2 = [];
for i=1:length(filesSpeaker2)
    [C, S, E, F, R] = frequencyFeatures(filesSpeaker2(i).name,0.025,0.01);
    tmp = [C; S; E; F; R];
    feats2 = [feats2  tmp];
end

% normalization
allFeats = [feats1 feats2];
allFeats = allFeats';
mn = mean(allFeats);
st = std(allFeats);
allFeatsNorm =  (allFeats - repmat(mn,size(allFeats,1),1))./repmat(st,size(allFeats,1),1);

% apply PCA
[coeff,score,latent,tsquared,explained] = pca(allFeatsNorm);
disp('explained variance...')
explained
% plotting
S=[]; % size of each point, empty for all equal
C=[repmat([1 0 0],length(feats1),1); repmat([0 1 0],length(feats2),1)];
    % define color R G B
scatter3(score(:,1),score(:,2),score(:,3),S,C)
axis equal
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
zlabel('3rd Principal Component')
sgtitle('features after PCA')

figure
scatter(score(:,1),score(:,2),S,C)
xlabel('1st Principal Component')
ylabel('2nd Principal Component')

%distances
dists=[];
for i=1:5
    dists(i,:)=(allFeatsNorm(1:length(feats1),i)-allFeatsNorm(length(feats1)+1:2*length(feats1),i)).^2;
end

%which feature is more discriminative
average_dists = mean(dists,2);
[sorted, indices] = sort(average_dists,'descend');
figure
plot(dists')
legend( 'C', 'S', 'E', 'F', 'R')
