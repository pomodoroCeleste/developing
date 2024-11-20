titles = {'mean','var','25th quant','median','75th quant'};
for i=1:5
    subplot(5,1,i)
    plot(maleFeatures(:,i))
    title(titles(i))
end
sgtitle('male features')

figure
for i=1:5
    subplot(5,1,i)
    plot(femaleFeatures(:,i))
    title(titles(i))
end
sgtitle('female features')

figure
for i=1:5
    subplot(5,1,i)
    histogram(maleFeatures(:,i))
    title(titles(i))
    grid on
end
sgtitle('male features')

figure
for i=1:5
    subplot(5,1,i)
    histogram(femaleFeatures(:,i))
    title(titles(i))
    grid on
end
sgtitle('female features')
