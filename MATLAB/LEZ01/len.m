clear;clc

x=[-1 -1000 1, 3, 5, 10];

% spiega cosa fa questo programma:

L=length(x);
for i=1:L
    if x(i) < 0
        x(i)=-1;
    end
end

%L(L<0)=-1;

%il programma ritorna -1 per ogni numero del vettore <0
