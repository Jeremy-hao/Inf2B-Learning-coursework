function [S] =  MyCov(X)
[rowNumber, columnNumber] = size(X);
meanColumn = sum(X)/rowNumber;
meanRow = sum(X,2)/columnNumber;

covResult = zeros(columnNumber,columnNumber);
corX = zeros(columnNumber,columnNumber);
corY = zeros(columnNumber,columnNumber); 

for i = 1: columnNumber
    for j = 1: columnNumber
       Ei = X(:,i)-meanColumn(i);
       Ej = X(:,j)-meanColumn(j);
       covResult(i,j) = sum(Ei .* Ej) / (rowNumber);
    end
end
S = covResult;
end
