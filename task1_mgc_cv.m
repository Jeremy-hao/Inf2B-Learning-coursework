%
% Versin 0.9  (HS 06/03/2020)
%
function task1_mgc_cv(X, Y, CovKind, epsilon, Kfolds)
% Input:
%  X : N-by-D matrix of feature vectors (double)
%  Y : N-by-1 label vector (int32)
%  CovKind : scalar (int32)
%  epsilon : scalar (double)
%  Kfolds  : scalar (int32)
%
% Variables to save
%  PMap   : N-by-1 vector of partition numbers (int32)
%  Ms     : C-by-D matrix of mean vectors (double)
%  Covs   : C-by-D-by-D array of covariance matrices (double)
%  CM     : C-by-C confusion matrix (double)

% Y = Y_species;
[N, D] = size(X);
meanColumn = sum(X)/N;
meanRow = sum(X,2)/D;

% PMap   : N-by-1 vector of partition numbers (np.int32)
PMap = zeros(N,1);
fold = 1;
duration = ceil(N/Kfolds);
for i = 1: Kfolds
    PMap(fold:fold+duration) = i;
    fold = fold+duration;
end
while size(PMap,1) ~= size(X,1)
    PMap(size(PMap,1),:) = [];
end
% save it to a file named 't1 mgc <Kfolds>cv PMap.mat'
save(sprintf('t1_mgc_%dcv_PMap.mat', Kfolds),'PMap');


% Ms     : C-by-D matrix of mean vectors (np.double)
C = max(Y);
class = C;
Ms = zeros(C,D);
for i = 1:Kfolds
    for c = 1:C
             subX = X(and(PMap~=i,Y == c),:);
             Ms(c,:) = MyMeanColumn(subX);
    end
    % save the mean vectors (Ms) to 't1 mgc <Kfolds>cv<p> Ms.mat'
    save(sprintf('t1_mgc_%dcv%d_Ms.mat', Kfolds, i), 'Ms');
end
 

%  Covs   : C-by-D-by-D array of covariance matrices (double)
finalCov = zeros(C,D,D);
for i = 1:Kfolds
    for c = 1:C
            subX = X(and(PMap~=i,Y == c),:);
            if (CovKind == 1 || CovKind == 3)
                % full covariance matrix
                Cov = MyCov(subX);
                finalCov(c,:,:) = Cov + (epsilon * eye(D));
            elseif (CovKind == 2)
                % diagonal covariance matrix
                Cov = MyCov(subX);
                finalCov(c,:,:) = diag(diag(Cov + (epsilon * eye(D))));
            end
    end     
    if (CovKind == 3)
           sums = sum(finalCov);
           for c = 1:C
               finalCov(c, :, :) = reshape(sums(1, :, :), [D, D]) ./ double(C);
           end
    end
   % save the regularised covariance matrices (Covs) to 't1 mgc <Kfolds>cv<p> ck<CovKind> Covs.mat
   save(sprintf('t1_mgc_%dcv%d_ck%d_Covs.mat', Kfolds, i, CovKind), 'finalCov');
end


 % Confusion matrix
 % train_label = PMap  
  % Nc && prior
Nc = zeros(1,C);
for i = 1:N
    for c = 1:C
       if Y(i,1) == c
            Nc(1,c) = Nc(1,c) + 1;
        end
    end
end
prior = double(Nc) / sum(Nc);
% Confusion matrix
totalCM = zeros(class);
for k = 1:Kfolds
    TotalP = X(PMap == k, :);
    TP = Y(PMap == k, :);
    testProb = zeros(length(TotalP), class);
    for i = 1:class
        mu = Ms(i, :);
        covariance = reshape(finalCov(i,:,:), [D, D]);
        % xxx = TotalP;
        % prob = myMultivariateGaussian(mu,covariance,xxx);
        % test_prob(:, i) = prob;
        xxx = TotalP - ones(size(TotalP,1), 1) * mu;
        final = sum(((xxx * inv(covariance)) .* xxx), 2);
        y = exp(-0.5 * final);
        testProb(:, i) = 1./sqrt((2*pi)^D*det(covariance))*y*prior(1,i);       
    end
    [~, testPred] = max(testProb, [], 2);
    CM = ConfusionMatrix(TP, int32(testPred),C);
    % save theconfusion matrix (CM) to 't1 mgc <Kfolds>cv<p> ck<CovKind> CM.mat',
    save(sprintf('t1_mgc_%dcv%d_ck%d_CM.mat',Kfolds,k,CovKind), 'CM');
    totalCM = totalCM + CM;
end
  CM = totalCM ./ size(X,1);
  L = Kfolds + 1;
  % save it to 't1 mgc <Kfolds>cv<L> ck<CovKind> CM.mat', where L = Kfolds + 1.
  save(sprintf('t1_mgc_%dcv%d_ck%d_CM.mat',Kfolds,L,CovKind), 'CM');
end