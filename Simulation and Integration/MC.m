%function of monte carlo method for calculating numerical integration
%input
%f: function 
%a,b interva;
%n number of nodes.
function I=MC(f,a,b,n)
   I=((b-a)/n).*sum(f(rand(1,n)));
end