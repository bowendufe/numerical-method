%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function of compute the approximated value given interploted points. 
% author:bowen cheng
% date:2020.4.6
% INPUT
% c: c is the smolyak coefficients 
% xx: is the x points 
% yy: is the y points
% OUTPUT
% app is the approximated value of point(x,y).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function app=smolyak_app(c,xx,yy)
% construct the meshgrid
poly=zeros(1,length(c));
[xxx,yyy]=meshgrid(xx,yy);
n=length(xx);
%% loop to set the points
for i=1:n
    for j=1:n 
        k=0;
        x=xxx(i,j);
        y=yyy(i,j);
        %% calculate the polynomial value 
        s1=[1,x,2.*x.^2-1,4.*x.^3-3.*x,8.*x.^4-8.*x.^2+1];
        s2=[1,y,2.*y.^2-1,4.*y.^3-3.*y,8.*y.^4-8.*y.^2+1];
        for m=1:length(s1)
            for h=1:length(s2)
                poly(1,k+1)=s1(m)*s2(h); 
                k=k+1;
            end
        end
        %% given the coefficients and polynomials, calculte the approximation
        app(i,j)=poly*c;  
    end
end