%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
%Calculate the evloution of an advection
%equation for a given number of itterations
%and the L2 norm of the error at each step
%using the leapfrog Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [uf,L2] = leapfrog_adv(u0,u1,uex,x,t,c,h,k)

ui = u0;
uii= [u1(end),u1,u1(1)];
uf = zeros(1,length(u0));
L2 = zeros(1,length(t));
for i=2:length(t)
    uf(1:end)   = ui(1:end) - (c*k/h)*(uii(3:end) - uii(1:end-2));
    L2(i)   = sqrt(sum((uf-uex(x,t(i))).^2));
    ui  = uii(2:end-1);
    uii  = [uf(end),uf,uf(1)];
end

end