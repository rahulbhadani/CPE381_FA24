

csv_file = '../Data/accel.csv';


% Read the acceleration data from the CSV file
data = readtable(csv_file);
acceleration = data.Message;

% Plot the acceleration data
fig = figure;
fig.Position = [554, 456, 1300, 420];
plot(data.Time, acceleration, 'LineWidth',2,'color', '#ff3453');
title('Acceleration Data', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('Time (s)', 'Interpreter','latex');
ylabel('$m/s^2$', 'Interpreter','latex');
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
'../figures/CPE381_FA24_HW5_Q4_Acceleration.pdf');

% Compute the Fourier transform of the acceleration data
fs = 1 / mean(diff(data.Time));  % sampling frequency
acceleration_fft = fft(acceleration);


fig = figure;
fig.Position = [554, 456, 1300, 420];
plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), ...
    20.*log(abs(acceleration_fft)), 'LineWidth',2,'color', '#118853');
title('Acceleration Data', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('Frequency (Hz)', 'Interpreter','latex');
ylabel('Magnitude', 'Interpreter','latex');
title('Magnitude Spectrum',  'Interpreter','latex');
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
'../figures/CPE381_FA24_HW5_Q4_Acceleration_Magnitude_Spectrum.pdf');


fig = figure;
fig.Position = [554, 456, 1300, 420];
plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), ...
    angle(acceleration_fft), 'LineWidth',2,'color', '#111399');
title('Acceleration Data', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('Frequency (Hz)', 'Interpreter','latex');
ylabel('Phase', 'Interpreter','latex');
title('Phase Spectrum',  'Interpreter','latex');
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
'../figures/CPE381_FA24_HW5_Q4_Acceleration_Phase_Spectrum.pdf');


acceleration = data.Message;

% Define the filter parameters
fs = 1 / mean(diff(data.Time));  % sampling frequency
cutoff_freq = 2;
order = 4;


% Design the low-pass filter
[b, a] = butter(order, cutoff_freq / (fs/2), 'low');

% Apply the filter to the acceleration data
acceleration_filtered = filter(b, a, acceleration);

 % Plot the acceleration data
fig = figure;
fig.Position = [554, 456, 1300, 420];
plot(data.Time, acceleration, 'LineWidth',2,'color', ...
    '#ff3453','DisplayName', 'Original Acceleration');
hold on;
plot(data.Time, acceleration_filtered, 'LineWidth',2, ...
    'color', '#118853', 'DisplayName','Filtered Acceleration');
title('Acceleration Data', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
legend;

xlabel('Time (s)', 'Interpreter','latex');
ylabel('$m/s^2$', 'Interpreter','latex');
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
'../figures/CPE381_FA24_HW5_Q4_Filtered_Acceleration.pdf');


 % Plot the acceleration data
fig = figure;
fig.Position = [554, 456, 1300, 420];
plot(data.Time, acceleration, 'LineWidth',2,'color', ...
    '#ff3453','DisplayName', 'Original Acceleration');
hold on;
plot(data.Time, acceleration_filtered, 'LineWidth',2, ...
    'color', '#118853', 'DisplayName','Filtered Acceleration');
title('Acceleration Data', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
legend;
xlim([130, 134]);

xlabel('Time (s)', 'Interpreter','latex');
ylabel('$m/s^2$', 'Interpreter','latex');
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
'../figures/CPE381_FA24_HW5_Q4_Filtered_Acceleration_zoomed.pdf');

% Compute the Fourier transform of the acceleration data
fs = 1 / mean(diff(data.Time));  % sampling frequency
filtered_acceleration_fft = fft(acceleration_filtered);


fig = figure;
fig.Position = [554, 456, 1300, 420];
plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), ...
    20.*log(abs(acceleration_fft)), 'LineWidth',2,'color', '#118853', ...
    'DisplayName', 'Original Acceleration');
hold on;
plot((0:length(filtered_acceleration_fft)-1) * fs / length(filtered_acceleration_fft), ...
    20.*log(abs(filtered_acceleration_fft)), 'LineWidth',2,'color', '#881153', ...
    'DisplayName', 'Filtered Acceleration');
alpha(.5);
title('Acceleration Data (Unfiltered and Filtered)', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('Frequency (Hz)', 'Interpreter','latex');
ylabel('Magnitude', 'Interpreter','latex');
title('Magnitude Spectrum',  'Interpreter','latex');
set(gca, 'FontSize', 18);
legend;
exportgraphics(fig, ...
'../figures/CPE381_FA24_HW5_Q4_FilteredAcceleration_Magnitude_Spectrum.pdf');


fig = figure;
fig.Position = [554, 456, 1300, 420];
plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), ...
    angle(acceleration_fft), 'LineWidth',2,'Color',[0.9 0.1 0.2 0.3],...
    'DisplayName', 'Original Acceleration');
hold on;
plot((0:length(filtered_acceleration_fft)-1) * fs / length(filtered_acceleration_fft), ...
    angle(filtered_acceleration_fft), 'LineWidth',2,'Color',[0.2 0.5 0.9 0.4], ...
    'DisplayName', 'Filtered Acceleration');
title('Acceleration Data', 'Interpreter','latex');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

xlabel('Frequency (Hz)', 'Interpreter','latex');
ylabel('Phase', 'Interpreter','latex');
title('Phase Spectrum',  'Interpreter','latex');
set(gca, 'FontSize', 18);
legend;
exportgraphics(fig, ...
'../figures/CPE381_FA24_HW5_Q4_Filtered Acceleration_Phase_Spectrum.pdf');


% Compute the Mean Squared Error (MSE) 
% between original and filtered acceleration data
mse = mean((acceleration - acceleration_filtered).^2);

% Print the MSE
fprintf('Mean Squared Error (MSE): %f\n', mse);
