%{
1. write a program that will add all the numbers corresponding 
to the even indices of an array. for instance, the array x was 
x=[1, 3, 5, 10], then it should return 13 (=3+10). 
use that program to find the sum of all even integers from 1 to 1000.
write your program so that it is flexible. that is, you should be 
able to invoke your program from the program window as follows:
>> y=addeven(x)
where x is the input vector, and y is the sum of all the numbers 
corresponding to the even indices of x.
%}

clear;clc

x=1:1000;
z=1:2:length(x);

for i=z
    x=x+1;  %(?)
end