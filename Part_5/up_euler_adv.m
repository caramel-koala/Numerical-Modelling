%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
%Calculate the evloution of an advection
%equation for a given number of iterations
%and the L2 norm of the error at each step
%using the Upwind Euler Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [uf, L2] = up_euler_adv(u0,uex,x,t,c,h,k);

ui= [u0(end),u0];
uf = zeros(1,length(u0));
L2 = zeros(1,length(t));

for i=2:length(t)
    uf = ui(2:end) - (c*k)/(h)*(ui(2:end) - ui(1:end-1));
    L2(i)   = sqrt(sum((uf-uex(x,t(i))).^2)/length(uf));
    ui  = [uf(end),uf];
end

end