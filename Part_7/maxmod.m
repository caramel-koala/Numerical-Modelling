%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION maxmod.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function sigma = maxmod(a,b)

for i=1:length(a)
    if a(i)*b(i) < 0
        sigma(i) = 0;
    elseif abs(a(i)) > abs(b(i))
        sigma(i) = a(i);
    else
        sigma(i) = b(i);
    end
end
end