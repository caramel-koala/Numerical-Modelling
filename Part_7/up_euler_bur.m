function uf = up_euler_bur(u0,x,t,h,k)

ui= [u0(end),u0];
uf = zeros(1,length(u0));

for i=2:length(t)
    uf = ui(2:end) - (k)/(2*h)*(ui(2:end).^2 - ui(1:end-1).^2);
    ui  = [uf(end),uf];
end

end