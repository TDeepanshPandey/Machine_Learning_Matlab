% Function to calculate Cost and Gradient
function [J, grad] = costFunctionLogisticRegression(theta, X, y)
% Number of Training Examples
m = length(y)
% Defining initial cost
J = 0;
% Defining initial gradient value
grad = zeros(size(theta));
% calculating sigmoid function
hthetax = sigmoid(X*theta);
% Calculation cost
J = sum((-1.*y.*log(hthetax))-((1-y).*log(1-hthetax)))*(1/m);
% Calculating gradient
grad = sum((hthetax-y).*X)*(1/m);
end