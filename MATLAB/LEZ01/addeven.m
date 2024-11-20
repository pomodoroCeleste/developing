
%{
1. Scrivi un programma che sommi tutti i numeri corrispondenti agli 
indici pari di un array. Ad esempio, se l'array x fosse:
x = [1, 3, 5, 10]
il programma dovrebbe restituire 13 (cioè 3 + 10, poiché 3 si 
trova all'indice 2 e 10 all'indice 4).

Usa questo programma per trovare la somma di tutti i numeri interi 
pari compresi tra 1 e 1000.

Scrivi il programma in modo che sia flessibile. In altre parole, 
dovresti essere in grado di richiamare il programma dalla finestra 
del programma nel seguente modo:
>> y = addeven(x)
dove x è il vettore di input e y è la somma di tutti i numeri 
corrispondenti agli indici pari di x.
%}


function y=addeven(x)
y=0;
for i=1:length(x)
    if mod(i,2)==0
        y=y+x(i);
    end
end