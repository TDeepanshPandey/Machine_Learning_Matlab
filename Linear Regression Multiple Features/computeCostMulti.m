function J = computeCost(X, y, theta)
% calculating number of training examples
m = length(y);
% initializing cost function to 0
J = 0;
% Calculating cost
J = sum((sum(theta' .* X,2) - y).^2)/(2*m)
end
