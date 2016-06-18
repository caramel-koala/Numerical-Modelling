%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
%Calculate the evloution of an advection
%equation for a given number of itterations
%and the L2 norm of the error at each step
%using the Minmod Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [uf,L2] = minmodlim(u0,uex,x,t,c,h,k)

ui= [u0(end),u0,u0(1)];
uf = zeros(1,length(u0));
L2 = zeros(1,length(t));

for i=2:length(t)
    %get slopes
    us = (ui(2:end-1) - ui(1:end-2))/h;
    ds = (ui(3:end) - ui(2:end-1))/h;
    sigma = minmod(us,ds);
    sigma = [sigma(end),sigma];
    uf = ui(2:end-1) - (c*k)/h*((ui(2:end-1) - ui(1:end-2)) - 1/2*(h-c*k)*(sigma(2:end)-sigma(1:end-1)));
    L2(i)   = sqrt(sum((uf-uex(x,t(i))).^2)/length(uf));
    ui  = [uf(end),uf,uf(1)];
end

end