function [X_norm, mu, sigma] =  normalizeX(X)
% putting values of X in X_norm
X_norm = X;
% initliazing mean to zero
mu = zeros(1, size(X, 2));
% initializing standard deviation to zero
sigma = zeros(1, size(X, 2));
% calculating mean
mu = mean(X);
% calculating standard deviation
sigma = std(X);
% Calculating Normalized X feature
X_norm = (X - mu)./sigma
end




