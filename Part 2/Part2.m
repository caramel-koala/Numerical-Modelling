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
Ed1 = sum(abs(truedf1-df1))/length(x);

%b
df1c2   = df_centered_2(h,v);
Ed1c2   = sum(abs(truedf1-df1c2))/length(x);

%c
df1s2   = df_sided_2(h,v);
Ed1s2   = sum(abs(truedf1-df1s2))/length(x);

%d
df1c4   = df_centered_4(h,v);
Ed1c4   = sum(abs(truedf1-df1c4))/length(x);

save_to_file([x; truedf1; df1; df1c2; df1s2; df1c4],'df1.dat');
plot_file('df1.dat');
%--------------------------------------------------------------------------
%SECOND DERIVATIVE
truedf2 = -sin(x);

%e
df2c2   = df2_centered_2h(h,v);
Ed2c2   = sum(abs(truedf2-df2c2))/length(x);

%f
df2c4    = df2_centered_4h(h,v);
Ed2c4   = sum(abs(truedf2-df2c4))/length(x);

save_to_file([x; truedf2; df2c2; df2c4],'df2.dat');
plot_file('df2.dat');
%--------------------------------------------------------------------------
