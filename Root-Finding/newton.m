%This program is used to find root of the function f(x)=x^3-x^2-x-1 by
%newton-raphson method
%author:Bowen Cheng 
%date:2020.3.14
close all;clear all;clc;
diary on
x0=2;
tol=1e-6; %tolerance
x=x0;     %starting point
maxit=20; %max iteration number
re_newton=[];
tic;      %count running time
for it=1:maxit
    disp(it)
    [fval,fj]=f(x); %calculate the derivitive and function value.
    x=x-fval/fj;%iteration rule
    re_newton(it,1)=x;   %save the results for every iteration.
    re_newton(it,2)=f(x); 
    if abs(fval)<tol %check convergence
        fprintf('iteration = %d \n',it) 
        fprintf('the root is x=%f \n',x) 
        fprintf('the error is %f \n',f(x))
        break  
    end
end
toc;  
save re_newton.mat re_newton
diary off
   
    
    
    
    
    
    