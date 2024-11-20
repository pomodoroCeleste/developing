xx = cos(pi/60*(-n/2:n/2+n-1)')+1;
Sx = stft(xx);
xr = stftmag2sig(abs(Sx),size(Sx,1));
xx = xx(n/2+(1:n));
xr = xr(n/2+(1:n));
plot(xx)
hold on
plot(xr,'--','LineWidth',2)
hold off
legend('Original','Reconstructed')
