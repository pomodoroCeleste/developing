clear; clc
addpath(genpath(pwd)) % add all folders and subfolders to MATLAB path
windowLength = 0.03;
stepLength = 0.01;

% extract train and test features for both classes
trainMusicPath = [pwd,'\music\train\'];
trainSpeechPath = [pwd,'\speech\train\'];

testMusicPath = [pwd,'\music\test\'];
testSpeechPath = [pwd,'\speech\test\'];

disp('extract train features...')
train_music_features = extract_from_path(trainMusicPath,'mp3',windowLength,stepLength);
train_speech_features = extract_from_path(trainSpeechPath,'wav',windowLength,stepLength);
labelMusic = repmat(1,length(train_music_features),1);
labelSpeech = repmat(2,length(train_speech_features),1);
all_train = [train_music_features train_speech_features];
all_labels = [labelMusic; labelSpeech];

% normalization
all_train = all_train';
mn = mean(all_train);
st = std(all_train);
all_train =  (all_train - repmat(mn,size(all_train,1),1))./repmat(st,size(all_train,1),1);

disp('extract test features...')
test_music_features = extract_from_path(testMusicPath,'mp3',windowLength,stepLength);
test_speech_features = extract_from_path(testSpeechPath,'wav',windowLength,stepLength);
all_test = [test_music_features test_speech_features];
testMusicLabel = repmat(1,length(test_music_features),1);
testSpeechLabel = repmat(2,length(test_speech_features),1);
ground_truth = [testMusicLabel; testSpeechLabel];

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
% compute recognition rate per class
% music recognition rate - find labels == 1
correctMusic = find(predicted_label(1:length(testMusicLabel))==1);
mrr = length(correctMusic) / length(testMusicLabel) * 100
% speech recognition rate
correctSpeech = find(predicted_label(length(testMusicLabel)+1:end)==2);
srr = length(correctSpeech) / length(testSpeechLabel) * 100
