clear;clc

% 4. Hard-limiting function:

function f=lim(x)
f=zeros(1,length(x));
for i=1:length(x)
    if x(i)>=0.2, f(i) = 0.2; end
    if x(i)<0.2, f(i) = -0.2; end
end
end

x=rand(1,1000);
f=lim(x);
subplot(2,1,1)
plot(x)
subplot(2,1,2)
plot(f)

%La funzione lim(x) prende un vettore di input e crea un nuovo 
% vettore dove i valori di x sono sostituiti da 0.2 se sono 
% maggiori o uguali a 0.2, oppure da -0.2 se sono inferiori a 0.2.