%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
%Calculate the evloution of an advection
%equation for a given number of itterations
%and the L2 norm of the error at each step
%using the Centered Euler Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [uf,L2] = centered_euler(u0,uex,x,t,c,h,k)

ui = [u0(end),u0,u0(1)];
uf = zeros(1,length(u0));
L2 = zeros(1,length(t));
for i=1:length(t)
    uf(1:end)   = ui(2:end-1) - (c*(k/(2*h)))*(ui(3:end) - ui(1:end-2));
    L2(i)   = sqrt(sum((uf-uex(x,t(i))).^2));
    ui  = [uf(end),uf,uf(1)];
end

end