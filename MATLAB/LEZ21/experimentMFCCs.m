clear; clc
addpath(genpath(pwd))
disp('extract features of speaker 1...')
filesSpeaker1 = dir([pwd,'\speech\DR1*.*']);
MFCC1 = [];
for i=1:length(filesSpeaker1)
    coeffs = extractMFCCs(filesSpeaker1(i).name,0.025,0.01);
    MFCC1 = [MFCC1 coeffs];
end

disp('extract features of speaker 2...')
filesSpeaker2 = dir([pwd,'\speech\DR2*.*']);
MFCC2 = [];
for i=1:length(filesSpeaker2)
    coeffs = extractMFCCs(filesSpeaker2(i).name,0.025,0.01);
    MFCC2 = [MFCC2 coeffs];
end

disp('plotting...')
scatter3(MFCC1(1,:),MFCC1(2,:),MFCC1(3,:),'filled');
grid on
hold on;
scatter3(MFCC2(1,:),MFCC2(2,:),MFCC2(3,:),'filled');
legend('speaker 1', 'speaker 2')
title('features before normalization')

% normalization
allFeats = [MFCC1 MFCC2(:,1:length(MFCC1))];
allFeats = allFeats';
mn = mean(allFeats);
st = std(allFeats);
allFeatsNorm =  (allFeats - repmat(mn,size(allFeats,1),1))./repmat(st,size(allFeats,1),1);

figure
disp('plotting...')
scatter3(allFeatsNorm(1:3541,1),allFeatsNorm(1:3541,2),allFeatsNorm(1:3541,3),'filled');
grid on
hold on;
scatter3(allFeatsNorm(3542:end,1),allFeatsNorm(3542:end,2),allFeatsNorm(3542:end,3),'filled'); grid on
legend('speaker 1', 'speaker 2')
title('normalized features')

%distances
disp('computing distances...')
dists=[];
for i=1:13
    dists(i,:)=(allFeatsNorm(1:3541,i)-allFeatsNorm(3542:end,i)).^2;
end

%which feature is more discriminative
average_dists = mean(dists,2);
[sorted, indices] = sort(average_dists,'descend');
MFCC1=MFCC1';
MFCC2=MFCC2';
normMFCC1 =  (MFCC1 - repmat(mn,size(MFCC1,1),1))./repmat(st,size(MFCC1,1),1);
normMFCC2 =  (MFCC2 - repmat(mn,size(MFCC2,1),1))./repmat(st,size(MFCC2,1),1);

figure
scatter3(MFCC1(:,indices(1)),MFCC1(:,indices(2)),MFCC1(:,indices(3)),'filled')
hold on
scatter3(MFCC2(:,indices(1)),MFCC2(:,indices(2)),MFCC2(:,indices(3)),'filled')
title('MFCCs with the highest distance')