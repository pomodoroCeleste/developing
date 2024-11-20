clear
kNN_model_add_class('emo.mat', 'sadness', './sadness/', {'mean','std',}, 0.050, 0.025, 2.0, 1.0);
[label, P, classNames] = fileClassification('rab-f1-b2.wav', 3, 'emo.mat');
scriptClassificationPerformance('emo1.mat')