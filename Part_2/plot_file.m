%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Numerical Modelling
%Plots a generic file in MATLAB
%Author: Antonio Peters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_file(datfile)

data    = load(datfile);

[~, p]  = size(data);

hold on

for i=2:p
   plot( data(:,1), data(:,i)); 
end

hold off

end