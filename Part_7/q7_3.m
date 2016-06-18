%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 7 Question 3
%Comparing the Upwind Euler, Lax-Friedrich,
%Lax-Wendroff, Mimnod, Superbee and MC
%Mod methods for evolving Burgers' Equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N   = 1000;
x   = linspace(-10,10,N+1);
h   = get_h(x);
k   = h/2;
tmax= 1;
t   = (0:k:tmax);
c   = 1;

%set initial data
u0  = exp(-x.^2);

%using upwind euler
vue     = up_euler_bur(u0,x,t,h,k);

%use lax-friedrich
vlf     = lax_fried_bur(u0,x,t,h,k);

%use lax-wendroff to evolve
vlw     = lax_wen_bur(u0,x,t,h,k);

%use minmod
vmm     = minmodlim_bur(u0,x,t,h,k);

%use superbee
vsb     = superbee_bur(u0,x,t,h,k);

%use mc mod
vmc     = mcmod_bur(u0,x,t,h,k);

%plot graphs
plot(x,vue,'b',x,vlf,'r',x,vlw,'g');
legend('Upwind Euler', 'Lax-Friedrich','Lax-Wendroff');
xlabel('x');
ylabel('u(x,1)');
figure;
plot(x,vmm,'b',x,vsb,'r',x,vmc,'g');
legend('Minmod','Superbee','MC Mod');
xlabel('x');
ylabel('u(x,1)');