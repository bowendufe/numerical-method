%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gibbs sampling code
%author:bowen cheng
%date:2020 3.30
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;clear all;clc;
diary on
N=100;  %sample size
Nb=50;  %burn in
mu=[1 4]; %mean 
sig=[4,1;1,9]; %variance
x0=mvnrnd(zeros(1,2),eye(2),1); %initial value
x(1)=x0(1);  
y(1)=x0(2);  
i=0;
while i<N+Nb
    i=i+1;
    %condition distribution 
    x(i+1)=normrnd(mu(1)+sig(1,2)./sig(2,2).*(y(i)-mu(2)),(sig(1,1)-sig(1,2).^2./sig(2,2)).^0.5);
    y(i+1)=normrnd(mu(2)+sig(1,2)./sig(1,1).*(x(i)-mu(1)),(sig(2,2)-sig(1,2).^2./sig(1,1)).^0.5);
end
z=[x;y];
z=z(:,Nb:end); %delte the burn in sample
%start to plot graph
nBins = 20; 
bins1 = linspace(-20, 20, nBins);
bins2 = linspace(-20, 20, nBins);
 
% DISPLAY SAMPLED DISTRIBUTION
ax = subplot(121);
hist3(z', 'Edges', {bins1, bins2});  
title('sampled distribution')
ax = subplot(122);
%DISPLAY ANALYTICAL DISTRIBUTION
x=-20:0.5:20;
y=-20:0.5:20;
mu=[1,4];
sigma=[4 1; 1 9]; 
[X,Y]=meshgrid(x,y); 
p=mvnpdf([X(:),Y(:)],mu,sigma);
P=reshape(p,size(X));
figure(1)
surf(X,Y,P)
shading interp
colorbar
title('analytical distribution');
diary off
    
    
    
    
    
    
    
    
    
    
    
