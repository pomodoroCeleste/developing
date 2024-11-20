a=-0.95;
h=[1 a];
H=fft(h,1024);
Fs=10000;
N=length(H);
k=0:N-1; fk=k*Fs/N;
plot(fk,20*log10(abs(H)));