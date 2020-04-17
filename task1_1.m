%
% Versin 0.9  (HS 06/03/2020)
%
function task1_1(X, Y)
% Input:
%  X : N-by-D data matrix (double)
%  Y : N-by-1 label vector (int32)
% Variables to save
%  S : D-by-D covariance matrix (double) to save as 't1_S.mat'
%  R : D-by-D correlation matrix (double) to save as 't1_R.mat'

% double check covariance and correlation.
% S1 = cov(X);  
% R1 = corr(X);
%Y = Y_species;

[rowNumber, columnNumber] = size(X);
meanColumn = sum(X)/rowNumber;
meanRow = sum(X,2)/columnNumber;


covResult = zeros(columnNumber,columnNumber);
corX = zeros(columnNumber,columnNumber);
corY = zeros(columnNumber,columnNumber); 
corrResult = zeros(columnNumber,columnNumber);
for i = 1: columnNumber
    for j = 1: columnNumber
       Ei = X(:,i)-meanColumn(i);
       Ej = X(:,j)-meanColumn(j);
       covResult(i,j) = sum(Ei .* Ej) / (rowNumber);
       covX(i,j) = sqrt(sum(Ei .* Ei) / (rowNumber));
       covY(i,j) = sqrt(sum(Ej .* Ej) / (rowNumber));
       corrResult(i,j) = covResult(i,j) / (covX(i,j)*covY(i,j));
    end
end
S = covResult;
R = corrResult;

  save('t1_S.mat', 'S');
  save('t1_R.mat', 'R');
end
