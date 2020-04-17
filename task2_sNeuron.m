%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_sNeuron(W, X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
%  W : (D+1)-by-1 vector of weights (double)
% Output:
%  Y : N-by-1 vector of output (double)
% Y is Y_species
% g(a) = 1/1+exp(?a)

[N,D] = size(X);
tempX = ones(N,D+1);
tempX(:,2:D+1) = X;
X = tempX;

Wtrans = W';
Xtrans = X';
Y = Wtrans * Xtrans;
Y = Y';
[N,~] = size(Y);

for i = 1:N
       a = Y(i,1);
       Y(i,1) = 1 / (1+exp(-a)) ;
end
end

