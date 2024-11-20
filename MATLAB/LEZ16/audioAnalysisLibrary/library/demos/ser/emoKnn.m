clear all
clc
addpath(genpath(pwd));
kNN_model_add_class('emo.mat', 'anger', './anger/', {'mean','std',}, 0.050, 0.025, 2.0, 1.0);
kNN_model_add_class('emo.mat', 'sadness', './sadness/', {'mean','std',}, 0.050, 0.025, 2.0, 1.0);
kNN_model_add_class('emo.mat', 'happiness', './happiness/', {'mean','std',}, 0.050, 0.025, 2.0, 1.0);

[label, P, classNames] = fileClassification('rab-f1-b2.wav', 3, 'emo.mat')

disp(['the prediction is that the sample belongs to the *',classNames{label},'* class'])
scriptClassificationPerformance('emo.mat')

