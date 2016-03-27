%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Returns the min, max, L_infinity, L1 and L2 norms
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [xmax, xmin, linf, l1, l2] = get_info(x)

xmax = max(x);

xmin = min(x);

linf = abs(xmax);

l1 = sum(abs(x));

l2 = sum(x.*x);

end