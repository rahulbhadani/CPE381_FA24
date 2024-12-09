%%
csv_file = '../Data/accel.csv';

% Read the acceleration data from the CSV file
data = readtable(csv_file);
acceleration = data.Message;

% From Homework 5

% b_i coefficients
b = [0.00046901 0.001876 0.002814 0.001876 0.00046901];
% a_j coefficients
a = [1 -3.1537 3.8011 -2.0663 0.42636];


filtered_accel = cpedigitalfilter(acceleration, b, a);
% Plot the original and filtered sine waves
fig = figure;
fig.Position = [995 331  1382  895];
% Plot the original and noisy sine waves
plot(data.Time, acceleration,'LineWidth',2,'color', '#ff3453');
hold on;
plot(data.Time, filtered_accel,'LineWidth',2,'color', '#0034f3')
legend('Original Acceleration', 'Filtered Acceleration');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('Time (s)', 'Interpreter','latex');
xlim([100, 135]);
ylabel('Acceleration $m/s^2$', 'Interpreter','latex');
title('Acceleration Data', 'Interpreter','latex');
set(gca, 'FontSize', 18);

exportgraphics(fig, ...
'../figures/CPE381_FA24_HW8_Q2_4.pdf');


mse = mean((acceleration - filtered_accel).^2);

fprintf('Mean Squared Error: %.5f\n', mse);


