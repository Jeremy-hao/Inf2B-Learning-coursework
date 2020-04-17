%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_sNN_AB(X)
% Input:
%  X : N-by-D matrix of input vectors (double)
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

weights = [-1;1;1];
bigvalue = 1000;
answ1a = task2_sNeuron(W1 * bigvalue, X);
answ2a = task2_sNeuron(W2 * bigvalue, X);
answ3a = task2_sNeuron(W3 * bigvalue, X);
answ4a = task2_sNeuron(W4 * bigvalue, X);
answ1b = task2_sNeuron(Wb1 * bigvalue, X);
answ2b = task2_sNeuron(Wb2 * bigvalue, X);
answ3b = task2_sNeuron(Wb3 * bigvalue, X);
answ4b = task2_sNeuron(Wb4 * bigvalue, X);

weightsA = [2.5;-1.0;-1.0;-0.5;-0.5;0.0;0.0;0.0;0.0];
weightsB = [-2.2;0.0;0.0;0.0;0.0;1.0;0.4;0.4;1.0];
finalAnswers = [answ1a,answ2a,answ3a,answ4a,answ1b,answ2b,answ3b,answ4b];

answa = task2_sNeuron(weightsA * bigvalue, finalAnswers);
answb = task2_sNeuron(weightsB * bigvalue, finalAnswers);
final = [answa,answb];

Y = task2_sNeuron(weights * bigvalue, final);
end
