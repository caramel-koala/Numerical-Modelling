%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Finite Differencing Methods for sin(x)
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;

x   = grid_gen();
h   = get_h(x);

v   = sin(x);
truedf1     = cos(x);
truedf2     = -sin(x);

df1 = df_1(h, v);
Ed1 = sum(abs(truedf1-df1))/length(x);

df1c    = df_centered_1(h,v);
Ed2 = sum(abs(truedf1-df1c))/length(x);

save_to_file([x; truedf1; df1; df1c],'df1.dat');
plot_file('df1.dat');
