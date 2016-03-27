%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Error finding for approximations of sin(x)
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SETUP
close all;
clear all;

N   = [ 50  100 200 400 800];
E   = zeros(4,length(N));
h   = zeros(1,length(N));

for i=1:length(N)
    
    x   = linspace(-pi,pi,N(i));
    h(i)   = get_h(x);
    v   = ones( size(x) ) .* (x >= 0) ;
    truedf1 = cos(x);
    %a
    df1 = df_1(h(i),v);
    E(1,i)    = sum((truedf1-df1).^2);

    %b
    df1c2   = df_centered_2(h(i),v);
    E(2,i)    = sum((truedf1-df1c2).^2);

    %c
    df1s2   = df_sided_2(h(i),v);
    E(3,i)    = sum((truedf1-df1s2).^2);

    %d
    df1c4   = df_centered_4(h(i),v);
    E(4,i)    = sum((truedf1-df1c4).^2);
end
save_to_file([h; E],'Error1.dat');
loglog(h,E);
legend('1st-order in h','centred, 2nd-order in h','one-sided, 2nd-order in h','centred, 4th-order in h');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%