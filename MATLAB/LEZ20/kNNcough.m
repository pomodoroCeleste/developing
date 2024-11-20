clear; clc
addpath(genpath(pwd)) % add all folders and subfolders to MATLAB path
windowLength = 3;
stepLength = 0.5; %1

% extract train and test features for both classes
trainBreathPath = [pwd,'\Breathing\train\'];
trainCoughPath = [pwd,'\Coughing\train\'];

testBreathPath = [pwd,'\Breathing\test\'];
testCoughPath = [pwd,'\Coughing\test\'];

disp('extract train features...')
train_Breath_features = extract_from_path(trainBreathPath,'ogg',windowLength,stepLength);
train_Cough_features = extract_from_path(trainCoughPath,'ogg',windowLength,stepLength);
labelBreath = repmat(1,length(train_Breath_features),1);
labelCough = repmat(2,length(train_Cough_features),1);
all_train = [train_Breath_features train_Cough_features];
all_labels = [labelBreath; labelCough];

% normalization
all_train = all_train';
mn = mean(all_train);
st = std(all_train);
all_train =  (all_train - repmat(mn,size(all_train,1),1))./repmat(st,size(all_train,1),1);

disp('extract test features...')
test_Breath_features = extract_from_path(testBreathPath,'ogg',windowLength,stepLength);
test_Cough_features = extract_from_path(testCoughPath,'ogg',windowLength,stepLength);
all_test = [test_Breath_features test_Cough_features];
testBreathLabel = repmat(1,length(test_Breath_features),1);
testCoughLabel = repmat(2,length(test_Cough_features),1);
ground_truth = [testBreathLabel; testCoughLabel];

all_test = all_test';
all_test =  (all_test - repmat(mn,size(all_test,1),1))./repmat(st,size(all_test,1),1);

k=[1 5 10 15 20 50 100 200];
rate = [];
for kk=1:length(k)
    disp(['set-up the kNN... number of neighbors: ',mat2str(k(kk))])
    Mdl = fitcknn(all_train,all_labels','NumNeighbors',k(kk));
    
    % test the kNN
    predicted_label = predict(Mdl,all_test);
    
    % measure the performance
    correct = 0;
    for i=1:length(predicted_label)
        if predicted_label(i)==ground_truth(i)
            correct=correct+1;            
        end
    end
    disp('recognition rate:')
    rate(kk) = (correct/length(predicted_label))*100
end
plot(k,rate)
xlabel('k')
ylabel('recognition rate (%)')
grid on
% find the maximum
[a,b]=max(rate);
disp('----------results----------------')
disp(['the maximum recognition rate is ',mat2str(a)])
disp(['and it is acheived with ',mat2str(k(b)),' nearest neighbors'])
% train using the best k
Mdl = fitcknn(all_train,all_labels','NumNeighbors',(k(b)));
predicted_label = predict(Mdl,all_test);

% breath recognition rate - find labels == 1
correctBreath = find(predicted_label(1:length(testBreathLabel))==1);
brr = length(correctBreath) / length(testBreathLabel) * 100
% Cough recognition rate
correctCough = find(predicted_label(length(testBreathLabel)+1:end)==2);
crr = length(correctCough) / length(testCoughLabel) * 100