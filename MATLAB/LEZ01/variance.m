clear;clc

% 3. Calcola la varianza di un array x

function v = var(x)
mn = mean(x);
temp = 0;
for i=1:length(x)
    temp = temp + (x(i)-mn)^2;
end
v = temp/length(x);
end