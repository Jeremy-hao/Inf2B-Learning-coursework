%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNeuron(W, X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
%  W : (D+1)-by-1 vector of weights (double)
% Output:
%  Y : N-by-1 vector of output (double)
% function [Y] = task2 hNeuron(W, X)
% y(x) = h(wT x)
% h(a) = 1 if a > 0, and h(a) = 0 otherwise


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
        if Y(i,1) > 0 
            Y(i,1) = 1;
        else
            Y(i,1) = 0;
        end
end
end
