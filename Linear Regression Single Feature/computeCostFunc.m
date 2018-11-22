% Calculate Cost Function
function J = computeCostFunc(X,y,theta)

    % Initialize J
    J = 0;

    % Initialize m 
    m = length(y);
    
    J = sum((sum(theta' .* X,2) - y).^2)/(2*m)
end