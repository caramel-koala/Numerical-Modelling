function vf = lax_wen_adv(vi,h,k,c,tf)

%start time
t = 0;

%set ghost points
vi = [vi(end), vi, vi(1)];

while t <= tf
    vf = vi(2:end-1) - (c*k)/(2*h)*(vi(3:end) - vi(1:end-2)) + (c^2*k^2)/(2*h^2)*(vi(3:end) - 2*vi(2:end-1) + vi(1:end-2));
    vi = [vf(end), vf, vf(1)];
end

end