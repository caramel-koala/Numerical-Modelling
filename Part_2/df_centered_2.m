%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Finite Differencing: First Derivative, centered stencil, 2nd-order in h
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dfc = df_centered_2(h,f)

f   = [f(end -1), f, f(2)];

dfc = (f(3:end)-f(1:end-2))/(2*h);

end