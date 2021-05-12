%This program is used to find root of the function f(x)=x^3-x^2-x-1 by
%secant method
%author:Bowen Cheng 
%date:2020.3.14
close all;clear all;clc;
diary on 
maxit=20; %max iteration number
x1=1; %starting point 1
x2=2; %starting point 2
tol=1e-6; %tolerance
re_secant=[];
tic; %count running time
for it=1:maxit
    disp(it)
    x=x2-f(x2).*((x2-x1)/(f(x2)-f(x1))); %secant method iteration rule
    x1=x2; %change starting point
    x2=x;  %change starting point
    re_secant(it,1)=x;
    re_secant(it,2)=f(x);
    if abs(f(x))<tol   %check convergence 
       fprintf('iteration = %d \n',it) 
       fprintf('the root is x=%f \n',x) 
       fprintf('the error is %f \n',f(x)) 
        break
    end
end
toc; 
save re_secant.mat re_secant
diary off
