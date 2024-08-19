% Define the function
f = @(x) x.^2;

% Define the range for x
x = linspace(-3, 3, 1000);

% Calculate the corresponding y values
y = f(x);

% Plot the function
fig = figure;
plot(x, y, 'b', 'LineWidth', 2);
hold on;

% Define the range for shading
x_shade = linspace(0, 1, 100);
y_shade = f(x_shade);

% Shade the area under the curve
fill([x_shade fliplr(x_shade)], [y_shade zeros(size(y_shade))], 'b', 'FaceAlpha', 0.3);

% Add labels and title with LaTeX interpretation
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('$f(x) = x^2$', 'Interpreter', 'latex', 'FontSize', 24);
%title('Geometric Interpretation of Integration', 'Interpreter', 'latex', 'FontSize', 24);

set(gca, 'FontSize', 24);


% Set the axis limits
xlim([-2 2]);
ylim([0 4]);

% Display the grid
grid on;

% Hold off to stop adding to the current plot
hold off;

exportgraphics(fig, sprintf('../figures/integration.pdf'));
