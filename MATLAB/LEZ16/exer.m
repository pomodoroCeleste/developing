clear; clc
windowLength = 0.03;
stepLength = 0.01;
[Emusic, EEmusic, Zmusic] = timedomainFeats('LAwoman.mp3', windowLength, stepLength);

[Espeech, EEspeech, Zspeech] = timedomainFeats('speech.wav', windowLength, stepLength);

[Edog, EEdog, Zdog] = timedomainFeats('dog bark.ogg', windowLength, stepLength);

% plotting
subplot(3,1,1)
histogram(Edog); title('Edog')
subplot(3,1,2)
histogram(Espeech); title('Espeech')
subplot(3,1,3)
histogram(Emusic); title('Emusic')
figure
subplot(3,1,1)
histogram(EEdog); title('EEdog')
subplot(3,1,2)
histogram(EEspeech); title('EEspeech')
subplot(3,1,3)
histogram(EEmusic); title('EEmusic')
figure
subplot(3,1,1)
histogram(Zdog); title('Zdog')
subplot(3,1,2)
histogram(Zspeech); title('Zspeech')
subplot(3,1,3)
histogram(Zmusic); title('Zmusic')

