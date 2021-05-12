close all; clear all; clc;
x=-3:0.1:3;
y=-3:0.1:3;
[xx,yy]=meshgrid(x,y);
z=3.*(1-xx).^2.*exp(-xx.^2-(yy+1).^2)-10.*(1/5.*xx-xx.^3-yy.^5).*exp(-xx.^2-yy.^2)-1/3.*exp(-(xx+1).^2-yy.^2);
surf(xx,yy,z)
xlabel('x')
ylabel('y')
zlabel('z')
diary on 
tic;
x0=-1.5;
y0=0;
error=exp(-10);   %tollerance 
J=zeros(2,1); %jacobian matrix
H=zeros(2,2); %Hessian matrix
maxit=20;
x=x0;
y=y0;
scale=1;
i=1;
for i=1:maxit
    disp(['i=',num2str(i)])
    J(1,1)=(exp(- (x + 1)^2 - y^2)*(2*x + 2))/3 + 3*exp(- (y + 1)^2 - x^2)*(2*x - 2) + exp(- x^2 - y^2)*(30*x^2 - 2) - 6*x*exp(- (y + 1)^2 - x^2)*(x - 1)^2 - 2*x*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5);
    
    J(2,1)=(2*y*exp(- (x + 1)^2 - y^2))/3 + 50*y^4*exp(- x^2 - y^2) - 3*exp(- (y + 1)^2 - x^2)*(2*y + 2)*(x - 1)^2 - 2*y*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5);
   
    H(1,1)=(2*exp(- (x + 1)^2 - y^2))/3 - 6*exp(- (y + 1)^2 - x^2) + 60*x*exp(- x^2 - y^2) - 2*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) - (exp(- (x + 1)^2 - y^2)*(2*x + 2)^2)/3 + 2*exp(- (y + 1)^2 - x^2)*(3*x^2 - 3) + 24*x^2*exp(- (y + 1)^2 - x^2) + 4*x^2*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) - 4*x^2*exp(- (y + 1)^2 - x^2)*(3*x^2 - 3) - 4*x*exp(- x^2 - y^2)*(30*x^2 - 2);
    
    H(1,2)=4*x*y*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) - (2*y*exp(- (x + 1)^2 - y^2)*(2*x + 2))/3 - 2*y*exp(- x^2 - y^2)*(30*x^2 - 2) - 100*x*y^4*exp(- x^2 - y^2) - 3*exp(- (y + 1)^2 - x^2)*(2*x - 2)*(2*y + 2) + 6*x*exp(- (y + 1)^2 - x^2)*(2*y + 2)*(x - 1)^2;
    
    H(2,1)=H(1,2);
    
    H(2,2)=(2*exp(- (x + 1)^2 - y^2))/3 - 6*exp(- (y + 1)^2 - x^2)*(x - 1)^2 - 2*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) + 200*y^3*exp(- x^2 - y^2) - 200*y^5*exp(- x^2 - y^2) - (4*y^2*exp(- (x + 1)^2 - y^2))/3 + 4*y^2*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) + 3*exp(- (y + 1)^2 - x^2)*(2*y + 2)^2*(x - 1)^2;
    
    Hf=inv(H);
    delta_x=-Hf*J;
    decrement=1/2.*(J'*Hf*J);
    if decrement<error
        fprintf('iteration= %d \n',i)
        fprintf('optimal points :x= %f ,y=%f \n',x,y)
        fprintf('the minimal value is %f',3.*(1-x).^2.*exp(-x.^2-(y+1).^2)-10.*(1/5.*x-x.^3-y.^5).*exp(-x.^2-y.^2)-1/3.*exp(-(x+1).^2-y.^2))
        break
    end
    x=x+scale.*delta_x(1,1);
    y=y+scale.*delta_x(2,1);
    i=i+1;
end 
toc;
diary off   
       
    













