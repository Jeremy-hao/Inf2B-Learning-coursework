%
% Versin 0.9  (HS 06/03/2020)
%
function task1_3(Cov)
% Input:
%  Cov : D-by-D covariance matrix (double)
% Variales to save:
%  EVecs : D-by-D matrix of column vectors of eigen vectors (double)  
%  EVals : D-by-1 vector of eigen values (double)  
%  Cumvar : D-by-1 vector of cumulative variance (double)  
%  MinDims : 4-by-1 vector (int32)  

[V,D] = eig(Cov);
[EigenValues,ind] = sort(diag(D),'descend');
EVals = EigenValues;
save('t1_EVals.mat', 'EVals');


SizeOfCov = size(Cov);
EVecs = V(:,ind);
for i = 1:SizeOfCov(2)
    if EVecs(1,i) < 0
        EVecs(1,i) = (-1) * EVecs(1,i);
    end
end      
save('t1_EVecs.mat', 'EVecs');        
        
Cumvar = cumsum(EigenValues);
CumVar = zeros(SizeOfCov(2),1);
for i = 1:SizeOfCov(2)
    CumVar(i,1) = Cumvar(i,1)/Cumvar(SizeOfCov(2),1);
end
save('t1_Cumvar.mat', 'Cumvar');


for i = 1:SizeOfCov(2)
    result = CumVar(i,1);
    if result >= 0.7 
        MinDimsFor70 = i;
    break
    end
end

for i = 1:SizeOfCov(2)
    result = CumVar(i,1);
    if result >= 0.8 
        MinDimsFor80 = i;
        break
    end
end

for i = 1:SizeOfCov(2)
    result = CumVar(i,1);
    if result >= 0.9 
        MinDimsFor90 = i;
    break
    end
end

for i = 1:SizeOfCov(2)
    result = CumVar(i,1);
    if result >= 0.95 
        MinDimsFor95 = i;
    break
    end
end
MinDims = [MinDimsFor70,MinDimsFor80,MinDimsFor90,MinDimsFor95];
MinDims = MinDims';
save('t1_MinDims.mat', 'MinDims');
  
end
