%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Finite Differencing: First Derivative, one-sided stencil, 2nd-order in h
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dfc = df_sided_2(h,f)

f   = [f, f(2), f(3)];

dfc = (4*f(2:end -1) - f(3:end) - 3*f(1:end-2))/(2*h);

end