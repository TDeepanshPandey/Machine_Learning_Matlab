% loading the data
data = load('ex2data2.txt');
% X variable
X = data(:,[1,2]);
% Y variable
y = data(:,3);
fprintf('Plotting the Data Points');
% Function to plot data
visualizeData(X,y);
% Setting labels and legend
hold on;
xlabel('Microship Test 1');
ylabel('Microship Test 2');
legend('y = 1', 'y = 0');
hold off;

% Set regularization parameter lambda to 1
lambda = 1;
% Adding one column and calcating cost and gradient
X = mapFeature(X(:,1), X(:,2));
initial_theta = zeros(size(X, 2), 1);
[cost, grad] = costFunctionLogisticRegressionReg(initial_theta, X, y,lambda);
fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros) - first five values only:\n');
fprintf(' %f \n', grad(1:5));
test_theta = ones(size(X,2),1);
[cost, grad] = costFunctionLogisticRegressionReg(test_theta, X, y,lambda);
fprintf('\nCost at test theta: %f\n', cost);
fprintf('Gradient at test theta - first five values only:\n');
fprintf(' %f \n', grad(1:5));

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionLogisticRegressionReg(t, X, y, lambda)), initial_theta, options);

% Plot Boundary
plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

% Labels and Legend
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

