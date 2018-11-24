% Loading the data
data = load('ex1data2.txt');

% Assigning Data values to X and Y variable
X = data(:, 1:2);
y = data(:,3);
m = length(y);

% Printing X anad Y first 5 values
fprintf('X = [%.0f, %.0f], y = %.0f \n',[X(1:5,:) y(1:5,:)]);

% Normalize X
[X mu sigma] = normalizeX(X);


% Printing X, mean and Standard Deviation Values
fprintf('Normalized X \n');
fprintf('X = [%.0f, %.0f] \n',X(1:5,:));
fprintf('Mean is %.0f and Standard Deviation is %0.f \n',[mu sigma]);

% Add intercept term to X
X = [ones(m, 1) X];

% Choose some alpha value
alpha = 0.01;
num_iters = 50;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
computeCostMulti(X, y, theta);
[theta, J_history] = gradientDescentMultiVariable(X, y, theta, alpha, num_iters);

% Plot the convergence graph for different learning rates
figure;

% for less number of iterations
hold on;
theta1 = zeros(3, 1);
[theta1, J_history1] = gradientDescentMultiVariable(X, y, theta1, 0.1, 50);
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
plot(1:numel(J_history1), J_history1, '-r', 'LineWidth', 2);
xlabel('Number of iterations');
xticks(0:5:50);
ylabel('Cost J');
legend('Learning Rate (0..01)','Learning Rate (0.1)');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

fprintf('Theta1 computed from gradient descent: \n');
fprintf(' %f \n', theta1);
fprintf('\n');

% checking for house 1650 ft and 3 bedroom
house = [1650 3];
house =  (house - mu)./sigma;
normalized_house = [1 house];
%predicting price
price = normalized_house * theta1;
fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);
     
% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = pinv(X'*X)*X'*y;

% Display normal equation's result
fprintf('\n Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house using normal equation
house_normal_equation = [1 1650 3];
price = house_normal_equation * theta;
fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

