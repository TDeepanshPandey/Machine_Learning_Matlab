% Loading Data
data = load('ex1data1.txt');

% Saving first column in X
X = data(:,1);

% Saving second column in Y
y = data(:,2);

% Count the total number of rows in y
m = length(y);

% Plotting X, Y with a red cross of size 10
plot(X,y,'rx','MarkerSize',10);

% Setting y label
ylabel('Profit in $10,000s');

% Setting x label
xlabel('Population of City in 10,000s');

% Adding 1 for x0 column value
X = [ones(m,1), data(:,1)];

% Setting value of theta
theta = zeros(2, 1);

% Calculating Cost Funtion
computeCostFunc(X,y,theta);

% Trying for another theta value
computeCostFunc(X,y,[-1;2]);

% Updating theta
iterations = 1500;
alpha = 0.01;
theta = gradientDescentFunc(X, y, theta, alpha, iterations);

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCostFunc(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

    