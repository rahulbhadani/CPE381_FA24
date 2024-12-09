% Define the time array
t = -10:0.1:10;

% Define the unit-step signal u(t) using heaviside function
u = @(t) heaviside(t);

% Define the signal z(t)
z = @(t) u(-t) - u(t);

% Evaluate the signals
u_values = u(t);
z_values = z(t);

% Plot the signals
f= figure;
plot(t, z_values, 'LineWidth',3);
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('z(t)', 'Interpreter','latex');
ylim([-1.5, 1.5]);
set(gca, 'FontSize', 18);
exportgraphics(f, '../figures/CPE381_FA24_HW02_Q2_3.pdf');