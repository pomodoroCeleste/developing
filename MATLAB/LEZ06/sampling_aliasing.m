clear;clc

T = 2;        % 2 seconds
f0 = 1000;    % 1 kHz
fs1 = 20000;  % 20 kHz
fs2 = 1500;   % 1.5 kHz

[x1, t1] = sin_NU(f0, fs1, T);
[x2, t2] = sin_NU(f0, fs2, T);

figure;
plot(t1,x1, t2,x2, 'LineWidth',3.0) % multiple pairs of x and y in the same set of axis
axis([0,0.005, -1.1,1.1]) %putting the focus on a specific part of the figure
legend('High frequency', 'Low frequency')
xlabel('Time')
ylabel('Signals')
title('Audio aliasing');

soundsc(x1,fs1)
soundsc(x2,fs2)