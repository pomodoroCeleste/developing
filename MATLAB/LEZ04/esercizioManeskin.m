
% Caricare un file .wav
%  [signal, Fs] = audioread('ManeskinZittiEBuoni.wav');

% Scrivere lo stesso file in un altro file .wav (o un nuovo nome)
%  filename = 'ManeskinZittiEBuoni_output.wav';
%  audiowrite(filename, signal, Fs);

% Pulizia delle variabili
%  clear signal Fs 

% Recupera le informazioni sul file appena scritto
%  info = audioinfo(filename);
%  disp(info);


% PUNTI 2, 3 E 4?
% CORREZIONE FATTA IN AULA:

clear; clc

[y, fs] = audioread('ManeskinZittiEBuoni.wav');

durINsamples = length(y);
durInseconds = durINsamples/fs;
durINminutes = durInseconds/60;

numberOFframes = durInseconds/0.3; % /0.5

% 1st block: 1:blockDuration
% 2nd: blockDuration+1:2*blockDuration
% 3rd: 2*blockDuration+1:3*blockDuration
% ...
% 100th:130th: 99*blockDuration+1:130*blockDuration

blockDuration01 = 0.1*fs;
content01 = y(99*blockDuration01+1:130*blockDuration01);

blockDuration03 = 0.3*fs;
content03 = y(99*blockDuration03+1:130*blockDuration03);

blockDuration05 = 0.5*fs;
content05 = y(99*blockDuration05+1:130*blockDuration05);

subplot(3,1,1)
plot(content01); 
title('blockDuration : 0.1')

subplot(3,1,2)
plot(content03); 
title('blockDuration : 0.3')

subplot(3,1,3)
plot(content05); 
title('blockDuration : 0.5')

% >> sound(content01, fs)
% >> sound(content01, fs/2) //posso modificare artificialmente ma il suono
% è distorto
% >> sound(content01, 2*fs)

% >> added = [content01 content05]