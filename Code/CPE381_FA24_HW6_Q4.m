% Define the signal x[n] using an anonymous function
delta = @(n) (n==0);
u = @(n) (n>=0);

h = @(n)  (-1).^n.*0.5.^n .*u(n);

y = @(n) h(n) + h(n-1) + h(n-2);

% Evaluate the signal at specific values of n
n = 0:1:20;
y_values = y(n);

% Plot the acceleration data
fig = figure;
fig.Position = [549          66        1310         798];
subplot(2,1,1)
stem(n(2:20), y_values(2:20), 'LineWidth',2,'color', '#ff3453');
title('y[n] analytically', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('n', 'Interpreter','latex');
ylabel('y[n]', 'Interpreter','latex');
set(gca, 'FontSize', 18);
% Display all ticks on the x-axis
set(gca, 'XTick', n);

%%

% Define input x[n]
n = 0:1:20;  % Time index
x = zeros(size(n));
x(n >= 0 & n <= 2) = 1;

% Initialize output y[n]
y_recur = zeros(size(n));

% Set initial condition (y[-1] = 0)
y0 = 0;

% Implement difference equation using for loop
for i = 1:length(n)
    if i == 1
        y_recur(i) = x(i);  % y[0] = x[0]
    else
        y_recur(i) = -0.5*y_recur(i-1) + x(i);
    end
end

subplot(2,1,2)
stem(n(2:20), y_recur(2:20), 'LineWidth',2,'color', '#346753');
title('y[n] numerically from recursive equation', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('n', 'Interpreter','latex');
ylabel('y[n]', 'Interpreter','latex');
set(gca, 'FontSize', 18);
% Display all ticks on the x-axis
set(gca, 'XTick', n);

exportgraphics(fig, ...
'../figures/CPE381_FA24_HW6_Q4.pdf');