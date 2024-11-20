clear; clc
addpath(genpath(pwd))
disp('extract features of speaker 1...')
filesSpeaker1 = dir([pwd,'\speech\DR1*.*']);
E1 = [];
Z1 = [];
for i=1:length(filesSpeaker1)
  [E,Z] = time_domain_features(filesSpeaker1(i).name,0.025,0.01);  
  E1 = [E1 E];
  Z1 = [Z1 Z];
end

disp('extract features of speaker 2...')
filesSpeaker2 = dir([pwd,'\speech\DR2*.*']);
E2=[];
Z2=[];
for i=1:length(filesSpeaker2)
  [E,Z] = time_domain_features(filesSpeaker2(i).name,0.025,0.01);  
  E2 = [E2 E];
  Z2 = [Z2 Z];
end

disp('plotting...')
scatter(E1,Z1,'filled');
hold on;
scatter(E2,Z2,'filled');
legend('speaker 1', 'speaker 2')
grid on
xlabel('Energy')
ylabel('ZCR')

% normalization
allFeats = [E1 E2(1:length(E1)); Z1 Z2(1:length(E1))];
allFeats = allFeats';
mn = mean(allFeats);
st = std(allFeats);
allFeatsNorm =  (allFeats - repmat(mn,size(allFeats,1),1))./repmat(st,size(allFeats,1),1);

figure
disp('plotting...')
scatter(allFeatsNorm(1:3541,1),allFeatsNorm(1:3541,2),'filled');
grid on
hold on;
scatter(allFeatsNorm(3542:end,1),allFeatsNorm(3542:end,2),'filled'); 
legend('speaker 1', 'speaker 2')
xlabel('Energy')
ylabel('ZCR')

%distances
energydiff = (E1-E2(1:length(E1))).^2;
ZCRdiff = (Z1-Z2(1:length(Z1))).^2;
figure
subplot(2,1,1)
stem(energydiff)
title('energydiff')
subplot(2,1,2)
stem(ZCRdiff)
title('ZCRdiff')
disp('the average distances of the features w.r.t two speakers')
mean(energydiff)
mean(ZCRdiff)
%which feature is more discriminative