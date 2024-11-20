clear
clc
[Cs, Ss, Es, Rs, Fs, MFCCSs] = freqFeatures('speech.wav', 0.03, 0.01);
[Cm, Sm, Em, Rm, Fm, MFCCSm] = freqFeatures('LAwoman.mp3', 0.03, 0.01);
[Cd, Sd, Ed, Rd, Fd, MFCCSd] = freqFeatures('dog bark.ogg', 0.03, 0.01);

% plotting
subplot(3,1,1); imagesc(MFCCSs); title('speech'); colorbar
subplot(3,1,2); imagesc(MFCCSm); title('music'); colorbar
subplot(3,1,3); imagesc(MFCCSd); title('dog'); colorbar