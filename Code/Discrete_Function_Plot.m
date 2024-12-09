%%
f = figure(1);
f.Position =  [ 286 , 129, 1086 , 833];
n = -10:10;
% Define the unit-step function
u = @(n) (n >= 0);
% Calculate the discrete function
a = u(n) - u(n - 5);
stem(n, a,'Color','red', 'LineWidth', ...
    2, 'LineStyle','--');
hold on;
%x-axis
line([0 0], [-10, 10], 'Color', ...
    '#555555',  'LineWidth', 1);
%y-axis
line([-10, 10], [0 0], 'Color', ...
    '#555555',  'LineWidth', 1);
grid on;
grid minor;
ax = gca;
xlim([-0.5, 10]);
ylim([-0.5, 2.0]);
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 32);
set(gca, 'XColor', [0, 0, 0], ...
    'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
xlabel('Sample index [n]', 'Interpreter','latex');
ylabel('a [n]', 'Interpreter','latex');
title('a[n] = u[n] - u[n - 5]', 'Interpreter','latex');
exportgraphics(f, sprintf('../figures/Discrete_Function_Plot.pdf'));
