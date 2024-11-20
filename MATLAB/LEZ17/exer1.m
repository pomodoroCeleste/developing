clear
clc
[Cs, Ss, Es, Rs, Fs] = freqFeatures('speech.wav', 0.03, 0.01);
[Cm, Sm, Em, Rm, Fm] = freqFeatures('LAwoman.mp3', 0.03, 0.01);
[Cd, Sd, Ed, Rd, Fd] = freqFeatures('dog bark.ogg', 0.03, 0.01);

subplot(3,5,1); histogram(Cs); title('Centroid speech')
subplot(3,5,2); histogram(Ss); title('Spread speech')
subplot(3,5,3); histogram(Es); title('Entropy speech')
subplot(3,5,4); histogram(Fs); title('Flux speech')
subplot(3,5,5); histogram(Rs); title('Roll off speech')

subplot(3,5,6); histogram(Cm); title('Centroid music')
subplot(3,5,7); histogram(Sm); title('Spread music')
subplot(3,5,8); histogram(Em); title('Entropy music')
subplot(3,5,9); histogram(Fm); title('Flux music')
subplot(3,5,10); histogram(Rm); title('Roll off music')

subplot(3,5,11); histogram(Cd); title('Centroid dog')
subplot(3,5,12); histogram(Sd); title('Spread dog')
subplot(3,5,13); histogram(Ed); title('Entropy dog')
subplot(3,5,14); histogram(Fd); title('Flux dog')
subplot(3,5,15); histogram(Rd); title('Roll off dog')



