%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
%Calculate the evloution of an advection
%equation for a given number of itterations
%and the L2 norm of the error at each step
%using the Lax-Wendroff Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function uf = lax_wen_bur(u0,x,t,h,k)

ui= [u0(end),u0,u0(1)];
uf = zeros(1,length(u0));

for i=2:length(t)
    uf = ui(2:end-1) - (k)/(4*h)*(ui(3:end).^2 - ui(1:end-2).^2) + (k^2)/(4*h^2)*(ui(3:end).^2 - 2*ui(2:end-1).^2 + ui(1:end-2).^2);
    ui  = [uf(end),uf,uf(1)];
end

end