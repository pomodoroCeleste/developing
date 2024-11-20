
clear; clc
[x, t] = sin_NU(10, 1000, 0.5);    

plot (t,x);
    xlabel('time');
    ylabel('amplitude');
    title('sine signal');