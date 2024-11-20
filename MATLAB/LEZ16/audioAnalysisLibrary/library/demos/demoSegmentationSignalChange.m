% load the groundtruth:
load('topGearGT.mat')
% signal change detection:
[segs] = segmentationSignalChange('topGear.wav', 1);
% class labels are not available here, so just 
% use labels of alternating values (0, 1, 0, 1, etc):
for i=1:size(segs,1) classes(i) = mod(i,2); end
% plot results
titles{1} = 'Estimated'; titles{2} = 'Ground truth';
segmentationCompareResults(segs, classes, ...
    segsReal, classesReal,  'topGear.wav', titles);