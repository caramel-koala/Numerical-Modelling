%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 7 Question 3
%Comparing the Upwind Euler, Lax-Friedrich,
%Lax-Wendroff, Mimnod, Superbee and MC
%Mod methods for evolving Burgers' Equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N   = 1000;
x   = linspace(0,12,N+1);
h   = get_h(x);
k   = h/2;
tmax= 1;
t   = (0:k:tmax);
c   = 1;

%set initial data
u0  = exp(-x.^2);

%exact solution
uex =@(x,t) exp(-(x-t).^2);

%use lax-wendroff to evolve
vlw     = lax_wen_adv(u0,uex,x,t,c,h,k);

%use lax-friedrich
vlf     = lax_fried_adv(u0,uex,x,t,c,h,k);

%using upwind euler
vue     = up_euler_adv(u0,uex,x,t,c,h,k);

%use minmod
vmm     = minmodlim(u0,uex,x,t,c,h,k);

%use superbee
vsb     = superbee(u0,uex,x,t,c,h,k);

%use mc mod
vmc     = mcmod(u0,uex,x,t,c,h,k);

%plot graphs
plot(x,vue,'b',x,uex(x,tmax),'k');
legend('Upwind Euler', 'Exact');
xlabel('x');
ylabel('u(x,1)');
figure;
plot(x,vlf,'b',x,uex(x,tmax),'k');
legend('Lax-Friedrich', 'Exact');
xlabel('x');
ylabel('u(x,1)');
figure;
plot(x,vlw,'b',x,uex(x,tmax),'k');
legend('Lax-Wendroff', 'Exact');
xlabel('x');
ylabel('u(x,1)');
figure;
plot(x,vmm,'b',x,uex(x,tmax),'k');
legend('Minmod', 'Exact');
xlabel('x');
ylabel('u(x,1)');
figure;
plot(x,vsb,'b',x,uex(x,tmax),'k');
legend('Superbee', 'Exact');
xlabel('x');
ylabel('u(x,1)');
figure;
plot(x,vmc,'b',x,uex(x,tmax),'k');
legend('MC Mod', 'Exact');
xlabel('x');
ylabel('u(x,1)');