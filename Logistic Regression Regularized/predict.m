function p = predict(theta, X)
% Number of training examples
m = size(X, 1); 
% You need to return the following variables correctly
p = zeros(m, 1);
% if probability is 0.5 then set p as 1 otherwise 0
p = sigmoid(X*theta);
for i=1:size(p,1)
if p(i) >= 0.5
  p(i) = 1;
else
  p(i) = 0;
end
end
