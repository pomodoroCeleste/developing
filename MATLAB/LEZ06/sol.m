clear
[y,fs]=audioread('cat.ogg');
[M,nf]=windowize(y,0.05*fs,0.05*0.8*fs);
plot(M(:,50))
xlabel('Time (samples)')
ylabel('Amplitude')
title('cat frame')
disp(['the total number of frames is ',mat2str(nf)])

[y,fs]=audioread('airplane.ogg');
[M,nf]=windowize(y,0.15*fs,0.15*0.2*fs);
figure
plot(M(:,33))
xlabel('Time (samples)')
ylabel('Amplitude')
title('airplane frame')
disp(['the total number of frames is ',mat2str(nf)])

[y,fs]=audioread('speech-happy.wav');
[M,nf]=windowize(y,0.025*fs,0.025*0.3*fs);
figure
plot(M(:,111))
xlabel('Time (samples)')
ylabel('Amplitude')
title('speech-happy frame')
disp(['the total number of frames is ',mat2str(nf)])
