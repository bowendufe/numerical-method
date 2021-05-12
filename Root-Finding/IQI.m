%This program is used to find root of the function f(x)=x^3-x^2-x-1 by
%bisection method
%author:Bowen Cheng 
%date:2020.3.14
close all;clear all;clc;
diary on 
a=1;    %initial point 1
b=2;    %initial point 2
tol=1e-6; %tolerance
maxit=20; %max iteration
c=b-f(b).*((b-a)/(f(b)-f(a))); %the third point is selected by secant method 
re_IQI=[];
tic; % counting running time
for it=1:maxit
    disp(it)
    x=(f(b)*f(c))/((f(a)-f(b))*(f(a)-f(c)))*a...
     +(f(a)*f(c))/((f(b)-f(a))*(f(b)-f(c)))*b...   %iteration rule
     +(f(a)*f(b))/((f(c)-f(a))*(f(c)-f(b)))*c;
 %change point
 a=b;   
 b=c;    
 c=x;    
 re_IQI(it,1)=x;
 re_IQI(it,2)=f(x);
 if abs(f(x))<tol  %check convergence
       fprintf('iteration = %d \n',it) 
       fprintf('the root is x=%f \n',x) 
       fprintf('the error is %f \n',f(x))         
     break
 end
end
toc; 
save re_IQI.mat re_IQI
diary off








