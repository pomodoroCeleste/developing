% generate data
Data = mvnrnd([5, 5],[1 1.5; 1.5 3], 100);
figure(1); plot(Data(:,1), Data(:,2), '+');
%center the data
for i = 1:size(Data,1)
    Data(i, :) = Data(i, :) - mean(Data);
end

DataCov = cov(Data); % covariance matrix
[PC, variances, explained] = pcacov(DataCov); % eigen

% plot principal components
figure(2); clf; hold on;
plot(Data(:,1), Data(:,2), '+b');
plot(PC(1,1)*[-5 5], PC(2,1)*[-5 5], 'r')
plot(PC(1,2)*[-5 5], PC(2,2)*[-5 5], 'b'); hold off

% project down to 1 dimension
PcaPos = Data * PC(:, 1);
