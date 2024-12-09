% Define the time vector
t = 0:0.01:5;

% Define the unit step function
u = @(t) double(t >= 0);

% Define the function r(t)[ u(t-2) - u(t-3)]
r = @(t) t; % Assuming r(t) = t
y = r(t) .* (u(t-2) - u(t-3));

% Plot the function
figure;
plot(t, y, 'LineWidth', 2);
xlabel('t', 'FontSize', 24, 'Interpreter', 'latex');
ylabel('r(t)[ u(t-2) - u(t-3)]', 'FontSize', 24, 'Interpreter', 'latex');
title('Plot of r(t)[ u(t-2) - u(t-3)]', 'FontSize', 24, 'Interpreter', 'latex');
set(gca, 'FontSize', 24);
axis equal;
grid on;
