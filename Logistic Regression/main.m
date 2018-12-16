% loading the data
data = load('ex2data1.txt');
% X variable
X = data(:,[1,2]);
% Y variable
y = data(:,3);
fprintf('Plotting the Data Points');
% Function to plot data
visualizeData(X,y);
% Setting labels and legend
hold on;
xlabel('Exam 1 Score');
ylabel('Exam 2 Score');
legend('Admitted', 'Not Admitted');
hold off;

% Adding one column and calcating cost and gradient
[m, n] = size(X);
X = [ones(m,1) X];
initial_theta = zeros(n+1, 1);
[cost, grad] = costFunctionLogisticRegression(initial_theta, X, y);
fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);
test_theta = [-24; 0.2; 0.2];
[cost, grad] = costFunctionLogisticRegression(test_theta, X, y);
fprintf('\nCost at test theta: %f\n', cost);
fprintf('Gradient at test theta: \n');
fprintf(' %f \n', grad);

% Using fminunc function for calculating optimum value of theta
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(costFunctionLogisticRegression(t, X, y)), initial_theta, options);
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Plot Boundary
plotDecisionBoundary(theta, X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;

prob = sigmoid([1 45 85] * theta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n'], prob);

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (approx): 89.0\n');


