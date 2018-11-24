function [theta, J_history] = gradientDescentMultiVariable(X, y, theta, alpha, num_iters)
% calculating number of training examples
m = length(y); 
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
    temp = theta' - alpha * (1/m) * (sum((sum(theta' .* X,2) - y).* X));
    theta = temp';
    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);
end
end