function [theta, J_history] = gradientDescentFunc(X, y, theta, alpha, num_iters)
m = length(y);
J_history = zeros(num_iters,1);
for iter = 1 : num_iters
    temp = theta' - (sum((sum(theta' .* X,2) - y).* X)/m)* alpha;
    theta = temp';
    J_history(iter) = computeCostFunc(X, y, theta);
end
end