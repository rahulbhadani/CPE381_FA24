%% (C) Rahul Bhadani
close all;
% Define the coordinates of the triangle vertices
A = [0, 0]; % Origin
theta = pi/4; % Angle for the right triangle
p = sin(theta); % Perpendicular
b = cos(theta); % Base
C = [b, p]; % Hypotenuse endpoint

% Create a figure
f = figure(1);
f.Position = [440, 276, 947, 647];

% Plot the unit circle
theta_vec = linspace(0, 2*pi, 100);
x = cos(theta_vec);
y = sin(theta_vec);
plot(x, y, 'b', 'LineWidth', 2);
hold on;

% Plot the right triangle
plot([A(1), C(1)], [A(2), C(2)], 'r', 'LineWidth', 2); % Hypotenuse
plot([A(1), C(1)], [A(2), A(2)], 'r', 'LineWidth', 2); % Base
plot([C(1), C(1)], [A(2), C(2)], 'r', 'LineWidth', 2); % Perpendicular

% Plot the points
plot(A(1), A(2), 'ro', 'MarkerFaceColor', 'r');
plot(C(1), C(2), 'ro', 'MarkerFaceColor', 'r');

% Label the points
text(1.3, 0.2, '(1,0)', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'center');
text(0, 1.1, '(0,1)', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'left');
text(0, -1.15, '(0,-1)', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'left');
text(-1.1, 0.2, '(-1,0)', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'right');
text(C(1), C(2), '(b, p)', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'left');

% Label the sides
text(b/2, -0.15, 'b', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'center'); % Base
text(b+0.05, p/2, 'p', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'left'); % Perpendicular
text(b/2, p/2+0.1, 'h', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'center'); % Hypotenuse
text(0.3, 0.1, '$\theta$', 'FontSize', 24, 'Interpreter', 'latex', 'HorizontalAlignment', 'center');

 % Define the angle range for the arc
theta_arc = linspace(0, theta, 100);
arc_x = 0.2 * cos(theta_arc); % Adjust the 0.2 to change the size of the arc
arc_y = 0.2 * sin(theta_arc);

% Plot the arc
plot(arc_x, arc_y, 'k', 'LineWidth', 1.5);



% Draw horizontal and vertical lines for axes
plot([-1.5, 1.5], [0, 0], 'k--', 'LineWidth', 1); % x-axis
plot([0, 0], [-1.5, 1.5], 'k--', 'LineWidth', 1); % y-axis

% Set axes properties
axis equal;
xlim([-1.75, 1.75]);
ylim([-1.75, 1.75]);
% xlabel('x-axis', 'FontSize', 24, 'Interpreter', 'latex');
% ylabel('y-axis', 'FontSize', 24, 'Interpreter', 'latex');
%title('Unit Circle with Right Triangle', 'FontSize', 24, 'Interpreter', 'latex');
grid on;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 24);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

%% Save figure
exportgraphics(f, sprintf('../figures/unit_circle_right_triangle.png'));

