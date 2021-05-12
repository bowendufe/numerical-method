clear all; clc;
diary on 
tic;
x0=-1.5;
y0=0;
T0=100;
rho=0.95;
x=x0;
y=y0;
T=T0;
i=0;
diff=1;
xn=1;
yn=1;
while diff>exp(-10)
    if func(xn,yn)<func(x,y) 
        x=xn;
        y=yn;

    else
        T=rho*T;
        p= -exp(-(func(xn,yn)-func(x,y))./T);
         if rand<=min(p,1)
             
         x=xn;
         y=yn;

         end
    end
    xn=unifrnd(-3,3);
    yn=unifrnd(-3,3);
    diff=abs(func(xn,yn)-func(x,y));    

    
end
toc;
 fprintf('optimal points :x= %f ,y=%f \n',x,y)
 fprintf('the minimal value is %f',func(x,y))
diary off
function f=func(x,y)
f=3.*(1-x).^2.*exp(-x.^2-(y+1).^2)-10.*(1/5.*x-x.^3-y.^5).*exp(-x.^2-y.^2)-1/3.*exp(-(x+1).^2-y.^2);
end       
    
    
    
    
    
    
    
    
    