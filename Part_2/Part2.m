%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Finite Differencing Methods for sin(x)
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SETUP
close all;
clear all;

x   = grid_gen();
h   = get_h(x);

v   = sin(x);
%--------------------------------------------------------------------------
%FIRST DERIVATIVE
truedf1 = cos(x);

%a
df1 = df_1(h,v);
Ed1 = abs(truedf1-df1);

%b
df1c2   = df_centered_2(h,v);
Ed1c2   = abs(truedf1-df1c2);

%c
df1s2   = df_sided_2(h,v);
Ed1s2   = abs(truedf1-df1s2);

%d
df1c4   = df_centered_4(h,v);
Ed1c4   = abs(truedf1-df1c4);

save_to_file([x; truedf1; df1; df1c2; df1s2; df1c4],'df1.dat');
plot_file('df1.dat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%