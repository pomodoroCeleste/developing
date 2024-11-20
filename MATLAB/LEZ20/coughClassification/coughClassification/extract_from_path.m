function features = extract_from_path(path,extension,windowLength,stepLength)
addpath(genpath(path))
files = dir([path,'*.',extension]);
features=[];
for i=1:length(files)
    [C,S,R,ceps]=frequency_features(files(i).name,windowLength,stepLength);
    C(isnan(C))=0;
    S(isnan(S))=0;
    feats = [C ;S; R; ceps];
    features = [features feats ];
end