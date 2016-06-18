%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
%Calculate the evloution of an advection
%equation for a given number of iterations
%and the L2 norm of the error at each step
%using the lax-Friedrich Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function uf = lax_fried_bur(u0,x,t,h,k);

ui= [u0(end),u0,u0(1)];
uf = zeros(1,length(u0));

for i=2:length(t)
    uf = 0.5*(ui(3:end)+ui(1:end-2)) - (k)/(4*h)*(ui(3:end).^2-ui(1:end-2).^2);
    ui  = [uf(end),uf,uf(1)];
end

end