%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 5 Question 3
%Calculate the Lax-Wendroff evloution of
%the advection equation with initial
% vaule: e^(-x^2) on the interval -10:10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x   = linspace(-10,10,101);
x2  = linspace(-10,10,1001);
h   = get_h(x);
h2  = get_h(x2);
k   = h;
k2  = h2;
tmax= 4;
t   = (0:k:tmax);
t2  = (0:k2:tmax);
c   = 1;

%set initial data
u0  = exp(-x.^2);
u02 = exp(-x2.^2);

%exact solution
uex =@(x,t) exp(-(x-t).^2);% + exp(-((x+20)-t).^2);

%use lax-wnedroff to evolve 100 itterations
[v, L2]   = lax_wen_adv(u0,uex,x,t,c,h,k);
[v2, L22] = lax_wen_adv(u02,uex,x2,t2,c,h2,k2);

%plot graphs
semilogy(t,L2,'r',t2,L22,'b');
legend('N=100','N=1000');
xlabel('time');
ylabel('L2-norm of the Error');
figure;
plot(x,v,'r',x2,v2,'b',x2,uex(x2,tmax),'g');
legend('N=100','N=1000','Exact');
xlabel('x');
ylabel('u(x,4)');