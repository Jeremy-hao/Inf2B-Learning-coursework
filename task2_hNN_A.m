%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNN_A(X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
% Output:
%  Y : N-by-1 vector of output (double)

W110 = 1;
W111 = -0.0623;
W112 = -0.2084;

W120 = -1;
W121 = 0.2679;
W122 = 0.0534;

W130 = -1;
W131 = -0.0846;
W132 = 0.4069;

W140 = 1;
W141 = -0.3395;
W142 = 0.0427;

W1 = [W110;W111;W112];
W2 = [W120;W121;W122];
W3 = [W130;W131;W132];
W4 = [W140;W141;W142];

answ1 = task2_hNeuron(W1, X);
answ2 = task2_hNeuron(W2, X);
answ3 = task2_hNeuron(W3, X);
answ4 = task2_hNeuron(W4, X);

Weight = [answ1,answ2,answ3,answ4];
output = [-3.6;1;1;1;1];
Y = task2_hNeuron(output, Weight);

end
