clear; clc
fs = 20000;
intlv = 1/fs;
secs = 2;
tim = intlv:intlv:secs;

freq = 2;
wav = sin(tim*2*pi*freq);
plot(tim, wav);

