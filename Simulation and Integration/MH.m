%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MH sampling code
%author:bowen cheng
%date:2020 3.30
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;clear all;clc;
diary on
N=100; %sample size
Nb=50; %burn-in sample 
mu=[1;4]; %mean 
sigma=[4,1;1,9];%variance
mu_p=[1;1];  %proposal mean
sig_p=[1,0;0,1];%proposal variance
x(:,1)=mvnrnd(mu_p,sig_p,1)'; %initial value
num_reject=0;
for i=1:N+Nb
    xstar=mvnrnd(x(:,i),sig_p,1); %draw sample from proposal
    c=mvnpdf(x(:,i),xstar',sig_p)./mvnpdf(xstar',x(:,i),sig_p); %correction factor
    alpha=min(1,c.*mvnpdf(xstar',mu,sigma)./mvnpdf(x(:,i),mu,sigma)); %acceptance ratio
    %disp(c)
    if rand<alpha
        x(:,i+1)=xstar;%accept the sample
    else
        x(:,i+1)=x(:,i); %reject the sample
        str='rejected'
        num_reject=num_reject+1;
    end
    i=i+1;
end
fprintf('total number of rejected = %d',num_reject)

%start to plot graph
x=x(:,Nb:end); %delete the burn-in sample 
nBins = 20;
bins1 = linspace(-20, 20, nBins);
bins2 = linspace(-20, 20, nBins);
% Display sampled distribution
ax = subplot(121);
hist3(x', 'Edges', {bins1, bins2});
title('sampled distribution')
%display the anylatical distribution
ax = subplot(122);
x=-20:0.5:20;
y=-20:0.5:20;
mu=[1,4];
sigma=[4 1; 1 9]; 
[X,Y]=meshgrid(x,y); 
p=mvnpdf([X(:),Y(:)],mu,sigma);
P=reshape(p,size(X)); 
surf(X,Y,P)
shading interp
colorbar
title('analytical distribution');    
diary off
    
    
    
    
    