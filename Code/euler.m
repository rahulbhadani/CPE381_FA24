% Define the function f(x, y)
f = @(x, y) 2*x;

% Define the initial condition
x0 = 0;
y0 = 1;

% Define the step size
h = 0.1;

% Define the number of steps
n_steps = 10;

% Initialize arrays to store x_n and y_n
x_n = zeros(n_steps+1, 1);
y_n = zeros(n_steps+1, 1);

% Set the initial values
x_n(1) = x0;
y_n(1) = y0;

% Implement Euler's method
for i = 1:n_steps
    % Compute the next value of y_n using Euler's method
    y_n(i+1) = y_n(i) + h * f(x_n(i), y_n(i));
    
    % Compute the next value of x_n
    x_n(i+1) = x_n(i) + h;
end

% Print the values of x_n and y_n
fprintf('  x_n        y_n\n');
for i = 1:n_steps+1
    fprintf('%6.2f  %10.6f\n', x_n(i), y_n(i));
end