[y,fs]=audioread('diarizationExample.wav',[280000 281023]);
[ca,cd]=dwt(y,'db1');
clf; figure(1)
subplot(211);plot(ca);title('Approximation coefficients')
subplot(212);plot(cd);title('Detail coefficients')

[caa,cad]=dwt(ca,'db1');
figure(2)
subplot(311);plot(caa);title('2nd level approximation coefficients')
subplot(312);plot(cad);title('2nd level detail coefficients')
subplot(313);plot(cd)

x1=idwt(caa,cad,'db1');
y_hat=idwt(x1,cd,'db1');
y_hat2=idwt(x1,zeros(length(cd),1),'db1');

figure(3)
subplot(311);plot(y);title('Original signal');axis tight
subplot(312);plot(y_hat);title('Reconstructed signal');axis tight
subplot(313);plot(y_hat2);title('Reconstructed signal - No detail coefficient');
axis tight