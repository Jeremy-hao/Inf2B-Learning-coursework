%
% Versin 0.9  (HS 06/03/2020)
%
% template script for task2_plot_regions_hNN_AB.m

Xrange = -3.0:0.01:6.0;
Yrange = -3.0:0.01:6.0;

[X,Y] = meshgrid(Xrange,Yrange);

grid = [X(:),Y(:)];
Y = task2_hNN_AB(grid);

contourf(Xrange(:),Yrange(:),reshape(Y,size(X)));




