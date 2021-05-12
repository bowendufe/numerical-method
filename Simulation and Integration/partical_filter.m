%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Partical filter sampling code
%author:bowen cheng
%date:2020 3.30
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear all;clc;
diary on
N=100; %sample size
mu=[1,4]; %mean 
sig=[4 1;1 9];%variance
mu_p=[-1,2]; %proposal mean
sig_p=[4 1;1 9];  %proposal variance
M=50;  %iteration times
t=0;
while t<M  
    t=t+1;
    disp(t)
    for i=1:N
        if t==1 %set initial value
            x(i,:,t)=mvnrnd(mu_p,sig_p,1);
            w(i,t)=1/N; 
        else
            x(i,:,t)=mvnrnd(mean(x(:,:,t-1)),sig,1); %draw sample from the proposal distribution
            w(i,t)=mvnpdf(x(i,:,t),mu,sig)./mvnpdf(x(i,:,t),mean(x(:,:,t-1)),sig_p); %calculte weight
        end
    end
%nomalize the weight to probability
w(:,t)=w(:,t)/sum(w(:,t));
%resample 
    if ESS(w(:,t))<0.75*N  
        disp('Resampling ...')
        edges = min([0 cumsum(w(:,t))'],1);
        edges(end) = 1;                
        u1 = rand/N;      
        [~, idx] = histc(u1:1/N:1,edges);
        x(:,:,t) = x(idx,:,t);                   
        w(:,t) = repmat(1/N, 1, N);
    end
end
fprintf('the effective sample size is %d', ESS(w(:,t)))
%start to plot graph
nBins = 20;
bins1 = linspace(-20, 20, nBins);
bins2 = linspace(-20, 20, nBins);
 
% DISPLAY SAMPLED DISTRIBUTION
ax = subplot(121);
hist3(x(:,:,end), 'Edges', {bins1, bins2});  
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
        
        

