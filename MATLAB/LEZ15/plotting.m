for i=1:13
    subplot(7,2,i)
    histogram(angerMFCCs(:,i))
    title(['MFCC ',mat2str(i)])
    grid on
end
sgtitle('angerMFCCs')

figure
for i=1:13
    subplot(7,2,i)
    histogram(happyMFCCs(:,i))
    title(['MFCC ',mat2str(i)])
    grid on
end
sgtitle('happyMFCCs')
