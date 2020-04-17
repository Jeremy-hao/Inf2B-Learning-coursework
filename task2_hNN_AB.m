%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNN_AB(X)
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


W210 = 1;
W211 = -0.2249;
W212 = 0.02161;
W220 = -1;
W221 = 0.3104;
W222 = 0.1093;
W230 = -1;
W231 = 0.1462;
W232 = 0.2402;
W240 = 1;
W241 = 0.04962;
W242 = -0.2280;

Wb1 = [W210;W211;W212];
Wb2 = [W220;W221;W222];
Wb3 = [W230;W231;W232];
Wb4 = [W240;W241;W242];


answ1 = task2_hNeuron(W1, X);
answ2 = task2_hNeuron(W2, X);
answ3 = task2_hNeuron(W3, X);
answ4 = task2_hNeuron(W4, X);

answb1 = task2_hNeuron(Wb1, X);
answb2 = task2_hNeuron(Wb2, X);
answb3 = task2_hNeuron(Wb3, X);
answb4 = task2_hNeuron(Wb4, X);

weightsA = [4.0;-1.0;-1.0;-1.0;-1.0;0.0;0.0;0.0;0.0];
weightsB = [-2.1;0.0;0.0;0.0;0.0;1.0;0.3;0.3;1.0];
finalAnswers = [answ1,answ2,answ3,answ4,answb1,answb2,answb3,answb4];
answerA = task2_hNeuron(weightsA, finalAnswers);
answerB = task2_hNeuron(weightsB, finalAnswers);
final = [answerA,answerB];
weights = [-1;1;1];
Y = task2_hNeuron(weights, final);

end
