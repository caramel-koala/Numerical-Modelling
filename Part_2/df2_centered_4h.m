%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Finite Differencing: Second Derivative, centred stencil, 4th-order in h
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dfc = df2_centered_4h(h,f)

f   = [f(end -2), f(end -1), f, f(2), f(3)];

dfc = (-f(5:end) + 16*f(4:end-1) - 30*f(3:end-2) + 16*f(2:end-3) - f(1:end-4))/(12*h^2);

end