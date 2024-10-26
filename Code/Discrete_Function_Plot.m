%%
f = figure(1);
f.Position =  [ 286         129        1086         833];

t = 0:1:10;
x = heaviside(t)  - heaviside(t-5) ;
x(1) = x(1) + 0.5;
x(6) = x(6) - 0.5;

stem(t, x,'Color','red', 'LineWidth', 2, 'LineStyle','--');
hold on;
t = -1:0.01:0;
x = zeros(1, length(t));
hold on;
line([0 0], [-10, 10], 'Color', '#555555',  'LineWidth', 1);  %x-axis
line([-10, 10], [0 0], 'Color', '#555555',  'LineWidth', 1);  %y-axis

grid on;
grid minor;
ax = gca;
xlim([-0.5, 10]);
ylim([-0.5, 2.0]);
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 32);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
xlabel('Sample index [n]', 'Interpreter','latex');
ylabel('a [n]', 'Interpreter','latex');
title('a[n] = u[n] - u[n - 5]', 'Interpreter','latex');
exportgraphics(f, sprintf('../figures/Discrete_Function_Plot.pdf'));
