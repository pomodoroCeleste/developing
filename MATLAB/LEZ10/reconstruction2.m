xz = circshift([x; zeros(n,1)],n/2);
Sz = stft(xz);
xr = stftmag2sig(abs(Sz),size(Sz,1));
xz = xz(n/2+(1:n));
xr = xr(n/2+(1:n));
plot(xz)
hold on
plot(xr,'--','LineWidth',2)
hold off
legend('Original','Reconstructed')