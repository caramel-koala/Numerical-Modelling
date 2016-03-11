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

fid = fopen('v.dat', 'w+');
fprintf(fid, '%f \t %f \n', [x; v]);
fclose(fid);

plot_file('v.dat');