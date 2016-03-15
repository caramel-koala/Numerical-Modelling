%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Infrastructure
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;

x = grid_gen();

h = get_h(x);

v = sin(x);

[vmax, vmin, vlinf, vl1, vl2] = get_info(v);

save_to_file([x;v], 'v.dat');

plot_file('v.dat');