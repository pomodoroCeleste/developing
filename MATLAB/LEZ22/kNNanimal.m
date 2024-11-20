clear; clc
addpath(genpath(pwd))

windowLength = 0.03;
stepLength = 0.01;

% extract train and test features for both classes
traincowPath = [pwd,'\cow\train\'];
trainsheepPath = [pwd,'\sheep\train\'];

testcowPath = [pwd,'\cow\test\'];
testsheepPath = [pwd,'\sheep\test\'];

disp('extract train features...')
train_cow_features = extract_from_path_mfccs(traincowPath,'ogg',windowLength,stepLength);
train_sheep_features = extract_from_path_mfccs(trainsheepPath,'ogg',windowLength,stepLength);
labelcow = repmat(1,length(train_cow_features),1);
labelsheep = repmat(2,length(train_sheep_features),1);
all_train = [train_cow_features train_sheep_features];
all_labels = [labelcow; labelsheep];

% normalization
all_train = all_train';
mn = mean(all_train);
st = std(all_train);
all_train =  (all_train - repmat(mn,size(all_train,1),1))./repmat(st,size(all_train,1),1);

disp('extract test features...')
test_cow_features = extract_from_path_mfccs(testcowPath,'ogg',windowLength,stepLength);
test_sheep_features = extract_from_path_mfccs(testsheepPath,'ogg',windowLength,stepLength);
all_test = [test_cow_features test_sheep_features];
testcowLabel = repmat(1,length(test_cow_features),1);
testsheepLabel = repmat(2,length(test_sheep_features),1);
ground_truth = [testcowLabel; testsheepLabel];

all_test = all_test';
all_test =  (all_test - repmat(mn,size(all_test,1),1))./repmat(st,size(all_test,1),1);

k=[1 5 10 15 20 50 100];
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
[a,b]=max(rate);
disp('----------results----------------')
disp(['the maximum recognition rate is ',mat2str(a)])
disp(['and it is acheived with ',mat2str(k(b)),' nearest neighbors'])

% plot performance vs. k
plot(k,rate)
xlabel('number of neighbors')
ylabel('performance (%)')
grid on

Mdl = fitcknn(all_train,all_labels','NumNeighbors',(k(b)));
predicted_label = predict(Mdl,all_test);

% cow recognition rate - find labels == 1
correctcow = find(predicted_label(1:length(testcowLabel))==1);
cow_rr = length(correctcow) / length(testcowLabel) * 100
wrongcow = find(predicted_label(1:length(testcowLabel))==2);
cow_wr = length(wrongcow) / length(testcowLabel) * 100
% sheep recognition rate - find labels == 2
correctsheep = find(predicted_label(length(testcowLabel)+1:end)==2);
sheep_rr = length(correctsheep) / length(testsheepLabel) * 100
wrongsheep = find(predicted_label(length(testcowLabel)+1:end)==1);
sheep_wr = length(wrongsheep) / length(testsheepLabel) * 100
% average recognition rate
av_rr = (cow_rr+sheep_rr)/2

% confusion matrix (absolute numbers)
cmA = [length(correctcow) length(wrongcow);...
         length(wrongsheep) length(correctsheep)]
    
% confusion matrix (percentages)
cmP = [cow_rr cow_wr;...
         sheep_wr sheep_rr ]
