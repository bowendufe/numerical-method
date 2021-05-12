%This program is used to find root of the function f(x)=x^3-x^2-x-1 by
%brent dekker method
%author:Bowen Cheng 
%date:2020.3.14
close all;clear all;clc;
diary on
a=1; 
b=2;
tol=1e-6;
c=b;
d=1.5; 
maxit=20; 
re_brent=[];
tic;
for it=1:maxit
    disp(it)
    if abs(f(a))<abs(f(b))   %swap a and b
        [b,a]=deal(a,b);
    end
     mflag=true;
    if f(a)~=f(c) && f(b)~=f(c)    %the IQI method begins from the 2 iteration
        s=(f(b)*f(c))/((f(a)-f(b))*(f(a)-f(c)))*a...
          +(f(a)*f(c))/((f(b)-f(a))*(f(b)-f(c)))*b...   %iteration rule
          +(f(a)*f(b))/((f(c)-f(a))*(f(c)-f(b)))*c;
    else 
        s=b-f(b).*((b-a)/(f(b)-f(a))); %the first iteration uses secant method
    end
    if (3*a+b)/4<=s<=b ==0 || ...       %the five criterions to decide which methods to use
     mflag==true &&  abs(s-b)>=0.5*abs(b-c) ||...
     mflag==false &&  abs(s-b)>=0.5*abs(c-d)  ||...
     mflag==true &&  abs(b-c)<tol || mflag==false && abs(c-d)<tol  
        s=(a+b)/2;
        mflag=true;
        disp('bisection')
    else
        mflag=false;
        disp('no bisection')
    end
    d=c;
    c=b;
    if f(a)*f(s)<=0                %change the interval
        b=s;
    else
        a=s;
    end
     re_brent(it,1)=s;
     re_brent(it,2)=f(s);
    if abs(f(b))<tol || abs(f(s))<tol || abs(d)<tol   %convergence criterions.
        fprintf('iteration = %d \n',it) 
       fprintf('the root is x=%f \n',s) 
       fprintf('the error is %f \n',f(s))
        break
    end
end
toc;
save re_brent.mat re_brent
diary off
       
        
        
        
        
        
        
        
        
        