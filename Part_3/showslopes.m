x   = linspace(-1,1,5);
t   = [.5.*x;   x;  2.*x] ;
h   = get_h(x);
c   = (1:5)*h;
p   = zeros(5,5);
q   = p;
for i=1:5
    p(:,i) = x - c(i);
    q(:,i) = x + c(i);
end
hold on
contour(x,t(1,:),p)
contour(x,t(1,:),q)
xlabel('x');
ylabel('t');
grid on