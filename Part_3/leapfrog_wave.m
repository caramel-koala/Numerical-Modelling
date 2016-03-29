%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
%Calculate the evloution of a wave equation
%and the L2 norm of the error at each step
%using the leapfrog Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [uf,L2] = leapfrog_wave(u0,u1,uex,x,t,c,h,k)

ui = u0;
uii= [u1(end),u1,u1(1)];
uf = zeros(1,length(u0));
L2 = zeros(1,length(t));
for i=2:length(t)
    uf(1:end)   = 2*uii(2:end-1) - ui(1:end) + ((c^2)*(k^2)/(h^2))*(uii(3:end) - 2*uii(2:end-1) + uii(1:end-2));
    L2(i)   = sqrt(sum((uf-uex(x,t(i))).^2));
    ui  = uii(2:end-1);
    uii  = [uf(end),uf,uf(1)];
end

end