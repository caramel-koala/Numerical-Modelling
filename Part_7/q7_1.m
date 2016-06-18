%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 7 Question 1
%Comparing the Upwind Euler, Lax-Friedrich
%and Lax-Wendroff evloution of
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

%use lax-wendroff to evolve
[vlw, L2lw]     = lax_wen_adv(u0,uex,x,t,c,h,k);

%use lax-friedrich
[vlf, L2lf] = lax_fried_adv(u0,uex,x,t,c,h,k);

%using upwind euler
[vue, L2ue]     = up_euler_adv(u0,uex,x,t,c,h,k);

%plot graphs
plot(x,vlw,'r',x,vlf,'b',x,vue,'g',x,uex(x,tmax),'k');
legend('Lax-Wendroff','Lax-Friedrich','Upwind Euler', 'Exact');
xlabel('x');
ylabel('u(x,1)');
figure;
plot(x,uex(x,tmax)-vlw,'r',x,uex(x,tmax)-vlf,'b',x,uex(x,tmax)-vue,'g');
legend('Lax-Wendroff','Lax-Friedrich','Upwind Euler', 'Exact');
xlabel('x');
ylabel('u(x,1)');