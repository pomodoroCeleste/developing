
function [x, t] = sin_NU(f0, fs, T)
    t = 0:1/fs:T;
    x = sin(2*pi*f0*t);


