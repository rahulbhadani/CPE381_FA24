% Define the time vector
a = 2.0; % You can choose any other value
t = -5:0.01:5;  
x = zeros(size(t));  % Initialize 'x' with zeros

% Apply the piecewise function
x(abs(t) <= abs(a)) = 1;

f= figure;
f.Position = [554, 456, 1300, 420];
plot(t,x, 'LineWidth',2);
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('x(t)', 'Interpreter','latex');
ylim([-1.5, 1.5]);
set(gca, 'FontSize', 18);
exportgraphics(f, '../figures/CPE381_FA24_HW5_Q1.pdf');

w = -10:0.01:10;
X = sin(w.*a)./w;

f= figure;
f.Position = [554, 456, 1300, 420];
plot(w,X, 'LineWidth',2);
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('$|X(\Omega)|$', 'Interpreter','latex');
ylim([-1.5, 2.5]);
set(gca, 'FontSize', 18);
exportgraphics(f, '../figures/CPE381_FA24_HW5_Q1_mag_spectrum.pdf');