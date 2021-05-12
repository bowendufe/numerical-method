%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function Lagrange compute lagrange polynomial function approxiamation 
% author:bowen cheng
% date:2020.4.5
% reference: mathwork website.
% USAGE app=Lagrange(f,x,d,lb,ub)

%INPUT
% f: function to be approximated
% x: nodes
% d: degree of polynomials
% lb: lower bound of domain; ub: upper bound of domain,
function app=Lagrange(f,x,d,lb,ub)
a=linspace(lb,ub,d+1);  
y=f(a); 
l=ones(1,d+1);
for i=1:d+1
    for j=1:d+1
        if j~=i
            l(i)=l(i)*(x-a(j))/(a(i)-a(j)); %calculte base 
        end
    end
end
app=y*l'; % sum up the value 