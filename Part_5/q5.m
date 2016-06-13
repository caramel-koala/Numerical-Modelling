%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 5 Question 4
%Comparing the Upwind Euler, Centered
%Leapfrog and Lax-Wendroff evloution of
%the advection equation with initial
%value: u(x,0) = {0, x<=0; 1, x>0}
%on the interval -10:10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N   = 400;
x   = linspace(-10,10,N+1);
h   = get_h(x);
k   = h;
tmax= 4;
t   = (0:k:tmax);
c   = 1;

%set initial data
u0  = x>=0;

%exact solution
uex =@(x,t) mod((((x+10)-t>=0) - (x-t>=0) +1), 2);

%use lax-wendroff to evolve
[vlw, L2lw]     = lax_wen_adv(u0,uex,x,t,c,h,k);

%use centered leapfrog
u1  = uex(x,k);
[vcl, L2cl]     = leapfrog_adv(u0,u1,uex,x,t,c,h,k);

%using upwind euler
[vue, L2ue]     = up_euler_adv(u0,uex,x,t,c,h,k);

%plot graphs
semilogy(t,L2lw,'r',t,L2cl,'b',t,L2ue,'g');
xlabel('time');
ylabel('L2-norm of the Error for N=100');
legend('Lax-Wendroff','Centered Leapfrog','Upwind Euler');