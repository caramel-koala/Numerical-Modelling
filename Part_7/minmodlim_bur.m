%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
%Calculate the evloution of an advection
%equation for a given number of itterations
%and the L2 norm of the error at each step
%using the Minmod Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function uf = minmodlim_bur(u0,x,t,h,k)

ui= [u0(end),u0,u0(1)];
uf = zeros(1,length(u0));

for i=2:length(t)
    %get slopes
    us = (ui(2:end-1) - ui(1:end-2))/h;
    ds = (ui(3:end) - ui(2:end-1))/h;
    sigma = minmod(us,ds);
    sigma = [sigma(end),sigma];
    uf = ui(2:end-1) - (k)/(2*h)*((ui(2:end-1).^2 - ui(1:end-2).^2) - 1/2*(h-k)*(sigma(2:end)-sigma(1:end-1)));
    ui  = [uf(end),uf,uf(1)];
end

end