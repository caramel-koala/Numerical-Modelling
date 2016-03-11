%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Generates and even spaced grid with user input.
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x = grid_gen()

mi = input('Minimum x value:');
ma = input('Maximum x value:');
N   = input('Number of elements:') + 1;

x = linspace(mi,ma,N);
end