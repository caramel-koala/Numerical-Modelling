%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 7 Question 2
%Comparing the Minmod, SuperBee
%and MC Mod evloution of
%the advection equation with initial
%value: u(x,0) = {0, x<=0; 1, x>0}
%on the interval -10:10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N   = 1000;
x   = linspace(0,12,N+1);
h   = get_h(x);
k   = h/2;
tmax= 1;
t   = (0:k:tmax);
c   = 1;

%set initial data
u0  = exp(-(x-4).^2) + (8<=x & x<=10);

%exact solution
uex =@(x,t) exp(-(x-t-4).^2) + (8<=(x-t) & (x-t)<=10);

%use minmod
[vmm, L2mm]     = minmodlim(u0,uex,x,t,c,h,k);

%use minmod
[vsb, L2sb]     = superbee(u0,uex,x,t,c,h,k);

%use minmod
[vmc, L2mc]     = mcmod(u0,uex,x,t,c,h,k);

%plot graphs
plot(x,vmm,'r',x,vsb,'b',x,vmc,'g',x,uex(x,tmax),'k');
legend('Minmod','Superbee', 'MC Mod', 'Exact');
xlabel('x');
ylabel('u(x,1)');
figure;
plot(x,uex(x,tmax)-vmm,'r',x,uex(x,tmax)-vsb,'b',x,uex(x,tmax)-vmc,'g');
legend('Minmod','Superbee', 'MC Mod');
xlabel('x');
ylabel('u(x,1)');