%
% Versin 0.9  (HS 06/03/2020)
%
% template script for task2_plot_regions_hNN_A.m
Xrange = 2.5:0.001:4.0;
Yrange = 2.5:0.001:5.0;

[X,Y] = meshgrid(Xrange,Yrange);

grid = [X(:),Y(:)];
Y = task2_hNN_A(grid);

contourf(Xrange(:),Yrange(:),reshape(Y,size(X)));
