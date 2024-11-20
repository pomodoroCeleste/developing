n = 512;
x = cos(pi/60*(0:n-1)')+1;
S = stft(x);

xr = stftmag2sig(abs(S),size(S,1));
plot(x)
hold on
plot(xr,'--','LineWidth',2)
hold off
legend('Original','Reconstructed')
