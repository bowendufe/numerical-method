%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function of compute the smolyak coefficients 
% author:bowen cheng
% date:2020.4.6
% INPUT
% s: s is the S3 grid point.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function c=smolyak_coefficient(s)
%% construct the smolyak grid using function makegrid.m
grid=makegrid(s);
%% specify the matrix
n=length(s);
fval=zeros(n*n,1);
p=zeros(n*n,n*n);
poly=zeros(1,n*n);
%% compute the coefficients
for i=1:size(grid,1) %loop for the grid
    x=grid(i,1);
    y=grid(i,2);
    % given the points x y, calculte the value of polynomials  
    s1=[1,x,2.*x.^2-1,4.*x.^3-3.*x,8.*x.^4-8.*x.^2+1];
    s2=[1,y,2.*y.^2-1,4.*y.^3-3.*y,8.*y.^4-8.*y.^2+1];
    k=0;
    for j=1:n
        for m=1:n
            poly(1,k+1)=s1(j)*s2(m); 
            k=k+1;
        end
    end
    % save the polynimials values in a matrix. p is a n^2 by n^2 matrix
    p(i,:)=poly;
    % compute the original function value. fval is a vector.
    fval(i)=g(grid(i,1),grid(i,2));
end
% the coefficient can be calculted by the fomula: fval=p*c. c is a n^2 by 1
% vector
c=inv(p)*fval;




    
    
