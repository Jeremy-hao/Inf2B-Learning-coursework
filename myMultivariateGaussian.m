function [p] = myMultivariateGaussian(mean,cov,X)
% Evauate a multivariate Gaussian pdf
% Get dimensions of covariance matrix
[N D] = size(cov);
% Check that the covariance matrix is square
if (N ~= D)
error('Covariance matrix should be square');
end
[j, k] = size(cov);

% force MU and X into column vectors
mean = reshape(mean, N, 1);
X = reshape(X, N, 1);

p = 1/sqrt((2*pi)^N*det(cov)) * ... 
    exp(-0.5*(X-mean)'*inv(cov)*(X-mean));
end

