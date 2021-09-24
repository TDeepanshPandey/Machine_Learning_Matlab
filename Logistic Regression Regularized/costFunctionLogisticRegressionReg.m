% Function to calculate Cost and Gradient
function [J, grad] = costFunctionLogisticRegressionReg(theta, X, y, lambda)
% Number of Training Examples
m = length(y)
% Defining initial cost
J = 0;
% Defining initial gradient value
grad = zeros(size(theta));
% calculating sigmoid function
hthetax = sigmoid(X*theta);
% Calculation cost
J = sum((-1.*y.*log(hthetax))-((1-y).*log(1-hthetax)))*(1/m) + ((lambda / (2*m))* sum(theta(2:end).^2)) ;
% Calculating gradient
temp = X'*(hthetax-y);
  for i=1:size(theta)
    if i == 1,
       grad(i) = (1/m)*temp(i);     
    else  
      grad(i) =  (1/m)*(temp(i) + (lambda*theta(i)));
    end
  end
end
