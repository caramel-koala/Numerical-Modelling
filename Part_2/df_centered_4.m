%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Finite Differencing: First Derivative, centered stencil, 4th-order in h
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dfc = df_centered_4(h,f)

f   = [f(end -2), f(end -1), f, f(2), f(3)];

dfc = (-f(5:end) + 8*f(4:end-1) - 8*f(2:end-3) + f(1:end-4))/(12*h);

end