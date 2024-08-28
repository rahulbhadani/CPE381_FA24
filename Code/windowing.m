% Define the time vector
t = -1:0.001:1;

% Define the original signal x(t)
x = sin(2*pi*t);

% Define the window function w(t)
w = (t >= -0.5) & (t <= 0.5);

% Define the time-windowed signal x(t)w(t)
xw = x .* w;

% Create the figure
fig = figure;
fig.Position = [1000         356         850         882];

% Plot x(t)
subplot(3,1,1);
plot(t, x, 'LineWidth', 2);
hold on;
plot(t, w, 'LineWidth', 1, 'LineStyle', '--');
title('$x(t) = \sin(2\pi t)$', 'Interpreter', 'latex', 'FontSize', 24);
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 24);
%ylabel('$x(t)$', 'Interpreter', 'latex', 'FontSize', 24);
grid on;

% Plot w(t)
subplot(3,1,2);
plot(t, w, 'LineWidth', 2);
title('$w(t)$', 'Interpreter', 'latex', 'FontSize', 24);
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 24);
%ylabel('$w(t)$', 'Interpreter', 'latex', 'FontSize', 24);
grid on;

% Plot x(t)w(t)
subplot(3,1,3);
plot(t, xw, 'LineWidth', 2);
title('$x(t)w(t)$', 'Interpreter', 'latex', 'FontSize', 24);
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 24);
%ylabel('$x(t)w(t)$', 'Interpreter', 'latex', 'FontSize', 24);
grid on;

exportgraphics(fig, sprintf('../figures/signal_windowing.pdf'));