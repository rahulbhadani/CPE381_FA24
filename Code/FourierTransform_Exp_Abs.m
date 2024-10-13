% Define the time vector
syms t w

a = 3;
x = exp(-a*abs(t));

f= figure;
f.Position = [1000         463        1130         775];
subplot(221)
fplot(x, [-3,3], 'LineWidth',2, 'DisplayName','x(t)');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('$x(t) = e^{-3|t|}$', 'Interpreter','latex');
ylim([-1.5, 1.5]);
set(gca, 'FontSize', 18);
legend('Interpreter','latex');
xlabel('Time, $t$','Interpreter', 'latex');
ylabel('Amplitude','Interpreter', 'latex');

% Perform Fourier transform
X = fourier(x, t, w);
% Plot magnitude and phase of Fourier transform
subplot(222)
fplot(abs(X),[-50 50],'LineWidth',2);
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('$|X(\Omega)|$', 'Interpreter','latex');
ylim([-0.1, 1.5]);
xlabel('$\Omega$','Interpreter', 'latex');
set(gca, 'FontSize', 18);

% Perform Fourier transform
X = fourier(x, t, w);
% Plot magnitude and phase of Fourier transform
subplot(224)
fplot(phase(X),[-50 50],'LineWidth',2, 'Color', 'r');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('$\angle X(\Omega)$', 'Interpreter','latex');
xlabel('$\Omega$','Interpreter', 'latex');
ylim([-5.5, 5.5]);
set(gca, 'FontSize', 18);

exportgraphics(f, '../figures/Fourier_Transform_ExpAbs.pdf');
