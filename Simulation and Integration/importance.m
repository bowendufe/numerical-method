%function of importance sampling method to calculate integration
%input 
%f: integrand  g: proposal density function ; a,b :interval; n:nodes
%output : integration
function I=importance(f,g,n)
x=sample(n);
I=1/n.*sum(f(x)./g(x)); 
end