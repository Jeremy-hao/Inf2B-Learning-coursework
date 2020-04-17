function [colMean] = MyMeanColumn(X)
[N, D] = size(X);
meanColumn = sum(X)/N;
colMean = meanColumn;
end
       