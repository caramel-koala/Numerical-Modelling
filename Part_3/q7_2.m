%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 3 Question 7 Part 2 
%Calculate the Leapfrog evloution of the wave equation with initial value: 
%e^(-x^2) and u_t(x,0 = 0 on the interval -10:10 comparing the change in
%spacing as a function of the error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N   = 2.^(6:12);
L2n = 0;
for i=1:length(N)
    %grid set up
    x   = linspace(-10,10,N(i));
    h   = get_h(x);
    k   = 0.001;
    tmax    = 5;
    t   = (0:k:tmax);
    
    %Initial data
    u0  = exp(-x.^2);
    
    %exact solution
    uex =@(x,t) 1/2*(exp(-(x-t).^2) + exp(-(x+t).^2));
    
    %use leapfrog to evolve to t=tmax
    [v, L2] = leapfrog_wave(u0,uex(x,k),uex,x,t,1,h,k);
    
    L2n = [L2n L2(end)];
end

%reduce L2n
L2n = L2n(2:end);
%plotting
loglog(N,L2n,'r',N,L2n,'*');
xlabel('Number of points');
ylabel('L2-norm of the error at t=5');