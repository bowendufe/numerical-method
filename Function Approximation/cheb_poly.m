%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function cheb_poly compute chebychev polynomial function approxiamation 
% author:bowen cheng
% date:2020.4.5
% USAGE app=Lagrange(f,x,d,lb,ub)

% INPUT
% f: function to be approximated
% x: nodes
% d: degree of polynomials
% lb: lower bound of domain; ub: upper bound of domain,
% OUTPUT
% app: approximated value
%   c: chebychev coeffecients
function [app,c]=cheb_poly(f,x,d,lb,ub)
x=2/(ub-lb)*(x-(ub+lb)/2); % transform the domain to [-1,1]
J=length(x);
y=f(x); 
M=ones(J,d+1);
%% calculte the chebychev coeffecient
for i=1:d+1
    for j=1:J
        if i==1
            M(j,1)=1;
        elseif i==2
            M(j,2)=x(j);
        else
            M(j,i)=2*x(j)*M(j,i-1)-M(j,i-2);
        end
    end
end
c=M\y';
T=ones(d+1,J);
for i=1:d+1
    if i==1
        T(1,:)=1;
    elseif i==2
        T(2,:)=x;
    else
        T(i,:)=2.*x.*T(i-1,:)-T(i-2,:); 
    end
end    
app=c'*T;