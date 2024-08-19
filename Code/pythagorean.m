%% (C) Rahul Bhadani

f = figure(1);
f.Position = [440, 276, 947, 647];

%% Right Triangle for Trigonometric Identities
% Define the coordinates of the triangle vertices
A = [0, 0]; % Origin
B = [4, 0]; % Base
C = [4, 3]; % Perpendicular

% Plot the triangle
subplot(1, 1, 1);
hold on;
plot([A(1), B(1)], [A(2), B(2)], 'b', 'LineWidth', 2); % Base
plot([B(1), C(1)], [B(2), C(2)], 'b', 'LineWidth', 2); % Perpendicular
plot([C(1), A(1)], [C(2), A(2)], 'b', 'LineWidth', 2); % Hypotenuse

% Plot the points
plot(A(1), A(2), 'ro', 'MarkerFaceColor', 'r');
plot(B(1), B(2), 'ro', 'MarkerFaceColor', 'r');
plot(C(1), C(2), 'ro', 'MarkerFaceColor', 'r');

% Label the sides
text(2, -0.5, 'b', 'FontSize', 24, 'Color', 'k', 'Interpreter','latex'); % Base
text(4.5, 1.5, 'p', 'FontSize', 24, 'Color', 'k', 'Interpreter','latex'); % Perpendicular
text(1.5, 1.5, 'h', 'FontSize', 24, 'Color', 'k', 'Interpreter','latex'); % Hypotenuse

% Label the vertices
% text(A(1)-0.3, A(2)-0.3, 'A', 'FontSize', 24, 'Color', 'k', 'Interpreter','latex');
% text(B(1)+0.3, B(2)-0.3, 'B', 'FontSize', 24, 'Color', 'k', 'Interpreter','latex');
% text(C(1)+0.3, C(2)+0.3, 'C', 'FontSize', 24, 'Color', 'k', 'Interpreter','latex');

% Set axes properties
axis equal;
xlim([-1, 5]);
ylim([-1, 3.5]);
% xlabel('x-axis');
% ylabel('y-axis');

grid on;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';


exportgraphics(f, sprintf('../figures/pythogoreas.png'));
