% Define the time vector
syms t w
% Define the Heaviside step function
u = @(t) heaviside(t);
x = u(t + 0.5) - u(t - 0.5);

f= figure;
f.Position = [1000         818        1130         420];
subplot(221)
fplot(x, [-3,3], 'LineWidth',2);
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('x(t) = u(t + 0.5) - u(t - 0.5)', 'Interpreter','latex');
ylim([-1.5, 1.5]);
set(gca, 'FontSize', 18);




% Perform Fourier transform
X = fourier(x, t, w);
% Plot magnitude and phase of Fourier transform
subplot(222)
fplot(X,[-50 50],'LineWidth',2);
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('$X(\Omega)$', 'Interpreter','latex');
ylim([-5.5, 5.5]);
set(gca, 'FontSize', 18);

%
% Define the time vector
syms t w
% Define the Heaviside step function
u = @(t) heaviside(t);
x = u(t + 2) - u(t - 2);

subplot(223)
fplot(x, [-3,3], 'LineWidth',2, 'Color', 'r');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('y(t) = u(t + 2) - u(t - 2)', 'Interpreter','latex');
ylim([-1.5, 1.5]);
set(gca, 'FontSize', 18);


% Perform Fourier transform
X = fourier(x, t, w);
% Plot magnitude and phase of Fourier transform
subplot(224)
fplot(X,[-50 50],'LineWidth',2, 'Color', 'r');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('$Y(\Omega)$', 'Interpreter','latex');
ylim([-5.5, 5.5]);
set(gca, 'FontSize', 18);
exportgraphics(f, '../figures/Fourier_Transform_Rect.pdf');

