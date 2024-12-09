% Define the time vector
%%
syms t w
n = 0;
% Define the Heaviside step function
u = @(t) heaviside(t);
x = @(t) u(t-2*n) - u(t - 2*n - 1);

x0 = x(t);
x1 = x(2*t);


f= figure;
f.Position = [1000         818        1130         420];
subplot(121)
fplot(x0, [-9,9], 'LineWidth',2, 'DisplayName','x(t)');
hold on;
fplot(x1, [-9,9], 'LineWidth',2, 'Color', 'r', 'LineStyle','--', 'DisplayName','x(2t)');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('x(t) = u(t) - u(t - 1)', 'Interpreter','latex');
ylim([-1.5, 1.5]);
set(gca, 'FontSize', 18);
legend('Interpreter','latex');


%%

% Perform Fourier transform
X0 = fourier(x0, t, w);
X1 = fourier(x1, t, w);
% Plot magnitude and phase of Fourier transform
subplot(122)
fplot(abs(X0),[-50 50],'LineWidth',2, 'DisplayName','$|\mathcal{F}[x(t)]|=|X(\Omega)|$');

hold on;
fplot(abs(X1),[-50 50],'LineWidth',2, 'Color', 'r', 'LineStyle','--', 'DisplayName','$|\mathcal{F}[x(2t)]|=|X(\Omega/2)|$');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('$X(\Omega)$', 'Interpreter','latex');
ylim([-2.5, 2.5]);
set(gca, 'FontSize', 18);
legend('Interpreter','latex', 'Location','southeast');

exportgraphics(f, '../figures/Fourier_Transform_Expanded.pdf');

