%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Finite Differencing: Second Derivative, centred stencil, 2nd-order in h
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dfc = df2_centered_2h(h,f)

f   = [f(end -1), f, f(2)];

dfc = (f(3:end) - 2*f(2:end-1) + f(1:end-2))/(h^2);

end