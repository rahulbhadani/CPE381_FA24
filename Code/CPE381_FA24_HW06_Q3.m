% Define the signal x[n] using an anonymous function
x = @(n) (n == -1 | n == 0 | n == 1) + 0.5 * (n == 2);

% Evaluate the signal at specific values of n
n = -5:1:5;
x_values = x(n);

% Plot the acceleration data
fig = figure;
fig.Position = [554, 456, 1300, 420];
subplot(2,2,1)
stem(n, x_values, 'LineWidth',2,'color', '#ff3453');
title('x[n]', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('n', 'Interpreter','latex');
ylabel('x[n]', 'Interpreter','latex');
set(gca, 'FontSize', 18);
% Display all ticks on the x-axis
set(gca, 'XTick', n);

x_values = x(n-1);
subplot(2,2,2)
stem(n, x_values, 'LineWidth',2,'color', '#ff3453');
title('x[n-1]', 'Interpreter','latex');
grid on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('n', 'Interpreter','latex');
ylabel('x[n-1]', 'Interpreter','latex');
set(gca, 'FontSize', 18);
% Display all ticks on the x-axis
set(gca, 'XTick', n);

x_values = x(-n);
subplot(2,2,3)
stem(n, x_values, 'LineWidth',2,'color', '#ff3453');
title('x[-n]', 'Interpreter','latex');
grid on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('n', 'Interpreter','latex');
ylabel('x[-n]', 'Interpreter','latex');
set(gca, 'FontSize', 18);
% Display all ticks on the x-axis
set(gca, 'XTick', n);

x_values = x(2-n);
subplot(2,2,4)
stem(n, x_values, 'LineWidth',2,'color', '#ff3453');
title('x[2-n]', 'Interpreter','latex');
grid on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('n', 'Interpreter','latex');
ylabel('x[2-n]', 'Interpreter','latex');
set(gca, 'FontSize', 18);
% Display all ticks on the x-axis
set(gca, 'XTick', n);

exportgraphics(fig, ...
'../figures/CPE381_FA24_HW6_Q3_xn.pdf');

fig = figure;
fig.Position = [206   190   969   706];
subplot(2,1,1)

x_values = 0.5.*( x(n) + x(-n) );

stem(n, x_values, 'LineWidth',2,'color', '#ff3453');
title('$x_e[n]$', 'Interpreter','latex');
grid on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('n', 'Interpreter','latex');
ylabel('$x_e[n]$', 'Interpreter','latex');
set(gca, 'FontSize', 18);
% Display all ticks on the x-axis
set(gca, 'XTick', n);

subplot(2,1,2)


x_values = 0.5.*( x(n) - x(-n) );


stem(n, x_values, 'LineWidth',2,'color', '#ff3453');
title('$x_o[n]$', 'Interpreter','latex');
grid on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('n', 'Interpreter','latex');
ylabel('$x_o[n]$', 'Interpreter','latex');
set(gca, 'FontSize', 18);
% Display all ticks on the x-axis
set(gca, 'XTick', n);


exportgraphics(fig, ...
'../figures/CPE381_FA24_HW6_Q3_xn_even_odd.pdf');
