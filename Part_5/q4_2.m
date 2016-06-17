%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 5 Question 4 Part 2
%Comparing the Upwind Euler, Centered
%Leapfrog and Lax-Wendroff evloution of
%the advection equation with initial
%value: u(x,0) = {0, x<=0; 1, x>0}
%on the interval -10:10 with different
%values of N.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N   = [100, 200, 400];

x1   = linspace(-10,10,N(1)+1);
x2   = linspace(-10,10,N(2)+1);
x3   = linspace(-10,10,N(3)+1);

h1   = get_h(x1);
h2   = get_h(x2);
h3   = get_h(x3);

k1   = h1/2;
k2   = h2/2;
k3   = h3/2;

tmax= 4;

t1   = (0:k1:tmax);
t2   = (0:k2:tmax);
t3   = (0:k3:tmax);

c   = 1;

%set initial data
u01  = x1>=0;
u02  = x2>=0;
u03  = x3>=0;

%exact solution
uex =@(x,t) mod((((x+10)-t>=0) - (x-t>=0) +1), 2);

%use lax-wendroff to evolve
[v1, L2]     = lax_wen_adv(u01,uex,x1,t1,c,h1,k1);
[v2, L2]     = lax_wen_adv(u02,uex,x2,t2,c,h2,k2);
[v3, L2]     = lax_wen_adv(u03,uex,x3,t3,c,h3,k3);

%use centered leapfrog
% u11  = uex(x1,k1);
% [v1, L2]     = leapfrog_adv(u01,u11,uex,x1,t1,c,h1,k1);
% u12  = uex(x2,k2);
% [v2, L2]     = leapfrog_adv(u02,u12,uex,x2,t2,c,h2,k2);
% u13  = uex(x3,k3);
% [v3, L2]     = leapfrog_adv(u03,u13,uex,x3,t3,c,h3,k3);

%using upwind euler
% [v1, L2]     = up_euler_adv(u01,uex,x1,t1,c,h1,k1);
% [v2, L2]     = up_euler_adv(u02,uex,x2,t2,c,h2,k2);
% [v3, L2]     = up_euler_adv(u03,uex,x3,t3,c,h3,k3);

vd1 = abs(uex(x1,tmax)-v1);
vd2 = abs(uex(x2,tmax)-v2);
vd3 = abs(uex(x3,tmax)-v3);

%plot graphs
plot(x1,vd1,'r',x2,vd2,'b',x3,vd3,'g');
legend('N=100','N=200','N=400');
xlabel('x');
ylabel('|u(x,4)-v(x,4)|');