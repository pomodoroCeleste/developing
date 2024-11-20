clear; clc
load splat 
ty = (0:length(y)-1)/Fs; 

% To hear, type sound(y,Fs) 
wind = hamming(128); 
olen = 64; 
nfft = 1024; 

stft(y,Fs,'Window',wind,'OverlapLength',olen,'FFTLength',nfft) 

s = stft(y,Fs,'Window',wind,'OverlapLength', olen,'FFTLength',nfft); 

smag = abs(s); 
sphs = angle(s); 

[x,tx,info] = stftmag2sig(smag,nfft,Fs,'Window',wind,'OverlapLength',olen); 

% To hear, type sound(x,Fs) 
figure
plot(ty,y,tx+500/Fs,x+1)

legend('Original','Reconstructed','Location','best') 
