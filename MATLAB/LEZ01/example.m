clear; clc

a = 0.1; b = 1;
t = 0:0.1:20;
y = exp(-a*t).*cos(b*t);
plot(t,y)

grid on;
xlabel('Time (s)')
ylabel('Response in mm')
title('Damped oscillation')
legend('a = 0.1, b = 1')