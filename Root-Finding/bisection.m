%This program is used to find root of the function f(x)=x^3-x^2-x-1 by
%bisection method
%author:Bowen Cheng 
%date:2020.3.14
close all;clear all;clc;
diary on
a=1;    %lower bound
b=2;    %upper bound
tol=1e-6; %tolerance
maxit=20;%max iteration
re_bisection=[];
tic;     %count the running time
for it=1:maxit
    disp(it)
x=(a+b)/2;   %half the interval
if f(a)*f(x)<0  %check the sign of the mid point
    b=x;        %the mid point will be the upper bound 
else
    a=x;        %the mid point will be the lower bound  
end
re_bisection(it,1)=x;
re_bisection(it,2)=f(x);
    if abs(f(x))<tol  %check convergence
       fprintf('iteration = %d \n',it) 
       fprintf('the root is x=%f \n',x) 
       fprintf('the error is %f \n',f(x))         
        break
    end
end
toc; 
save re_bisection.mat  re_bisection
diary off








