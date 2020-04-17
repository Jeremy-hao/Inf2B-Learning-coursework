%
% Versin 0.9  (HS 06/03/2020)
%
% template script for task2_plot_regions_sNN_AB

Xrange = -3.0:0.01:6.0;
Yrange = -3.0:0.01:6.0;

[X,Y] = meshgrid(Xrange,Yrange);

grid = [X(:),Y(:)];
Y = task2_sNN_AB(grid);

Y(Y>0.5) = 1;
Y(Y<=0.5) = 0;

contourf(Xrange(:),Yrange(:),reshape(Y,size(X)));

