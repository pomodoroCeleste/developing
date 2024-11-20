clear;clc
cR=0.3;
disp('processing the speech signal...')
[x,fs] = audioread('DR1FDAC1SI844.wav');
% generate compressed DCT coefficients and indices
[DCTcoeffs, INDcoeffs] = dctCompress(x, 0.10, fs, cR);
% decompress using iDCT:
x2 = dctDecompress(DCTcoeffs, INDcoeffs, 0.10, fs); 
plot(x); hold on; plot(x2);
legend('original','dct-based decompression')
mean_abs_diff_speech = mean(abs(x(1:length(x2))-x2))
figure
disp('processing the music signal...')
[y,fs] = audioread('rock.00026.au');
% generate compressed DCT coefficients and indices
[DCTcoeffs, INDcoeffs] = dctCompress(y, 0.10, fs, cR);
% decompress using iDCT:
y2 = dctDecompress(DCTcoeffs, INDcoeffs, 0.10, fs); 
plot(y); hold on; plot(y2);
legend('original','dct-based decompression')
mean_abs_diff_music = mean(abs(y(1:length(y2))-y2))