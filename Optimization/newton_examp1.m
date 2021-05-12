close all;
clear all;
clc;
figure;
fp=fplot(@(x) x-log(x),[0,10],'linewidth',2)
fp.Color='k'
title('f(x)=x-lnx','fontsize',16)
xlabel('x')
ylabel('y')
diary on
tic;
error=5e-2;
maxit=100;
x=zeros(maxit,1);
x(1)=9;
a=0.1;

for i=1:maxit
    disp(i)
    delta_x=x(i)-x(i)^2;
    decrement=(1/2)*(1-1/x(i))^2*x(i)^2;
    if abs(decrement)<error 
        disp('optimization complete ,iteration=')
        disp(i)
        disp('the value is')
        disp(x(i))
        break
    end
    x(i+1)=x(i)+a*delta_x;
end
 toc;   
 diary off
    
    
    
    