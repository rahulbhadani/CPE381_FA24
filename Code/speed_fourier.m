% Read the velocity data from the CSV file
close all
csv_file = '../Data/vel.csv';
data = readtable(csv_file);
data.Time = data.Time - data.Time(1);
% Convert the velocity data to m/s
velocity_ms = data.Message * 1000 / 3600;
% Plot the velocity data
f= figure;
f.Position = [ 810         819        1320         419];
subplot(121)
plot(data.Time, velocity_ms, 'LineWidth',2, 'DisplayName','Speed');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('speed', 'Interpreter','latex');
set(gca, 'FontSize', 18);
legend('Interpreter','latex');
xlabel('Time (s), $t$','Interpreter', 'latex');
ylabel('Speed m/s','Interpreter', 'latex');

subplot(122)
plot(data.Time, velocity_ms, 'LineWidth',2, 'DisplayName','Speed');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
xlim([130, 134])
yaxis.TickLabelInterpreter = 'latex';
title('speed', 'Interpreter','latex');
set(gca, 'FontSize', 18);
legend('Interpreter','latex');
xlabel('Time (s), $t$','Interpreter', 'latex');
ylabel('Speed m/s','Interpreter', 'latex');
exportgraphics(f, '../figures/Speed.pdf');

% Compute the Fourier transform of the velocity data
fs = 1 / mean(diff(data.Time));  % sampling frequency
velocity_fft = fft(velocity_ms);

% Plot the magnitude spectrum
f = figure;
f.Position = [ 810         819        1320         419];
plot((0:length(velocity_fft)-1) * fs / length(velocity_fft), 20*log10(abs(velocity_fft)));
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Magnitude Spectrum in Decibel', 'Interpreter','latex');
set(gca, 'FontSize', 18);
xlabel('$\Omega$','Interpreter', 'latex');
ylabel('Magnitude in dB','Interpreter', 'latex');
exportgraphics(f, '../figures/Speed_MagnitudeSpectrum.pdf');

% Plot the phase spectrum
f = figure;
f.Position = [ 810         819        1320         419];
plot((0:length(velocity_fft)-1) * fs / length(velocity_fft), angle(velocity_fft));
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Phase Spectrum', 'Interpreter','latex');
set(gca, 'FontSize', 18);
xlabel('$\Omega$','Interpreter', 'latex');
ylabel('Phase (rad)','Interpreter', 'latex');
exportgraphics(f, '../figures/Phase_Spectrum.pdf');


cutoff_freq = 5;  % Hz
order = 4;

% % Normalize the cutoff frequency to the Nyquist frequency
% Design the low-pass filter
[b, a] = butter(order, cutoff_freq / (fs/2), 'low')

% Apply the filter to the velocity data
velocity_filtered = filter(b, a, velocity_ms);

% Plot the velocity data
f= figure;
f.Position = [ 810         819        1320         419];
subplot(121)
plot(data.Time, velocity_ms, 'LineWidth',2, 'DisplayName','Speed');
hold on;
plot(data.Time, velocity_filtered, 'LineWidth',2, 'DisplayName','Filtered Speed');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('speed', 'Interpreter','latex');
set(gca, 'FontSize', 18);
legend('Interpreter','latex');
xlabel('Time (s), $t$','Interpreter', 'latex');
ylabel('Speed m/s','Interpreter', 'latex');

subplot(122)
plot(data.Time, velocity_ms, 'LineWidth',2, 'DisplayName','Speed');
hold on;
plot(data.Time, velocity_filtered, 'LineWidth',2, 'DisplayName','Filtered Speed');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
xlim([130, 134])
yaxis.TickLabelInterpreter = 'latex';
title('speed', 'Interpreter','latex');
set(gca, 'FontSize', 18);
legend('Interpreter','latex');
xlabel('Time (s), $t$','Interpreter', 'latex');
ylabel('Speed m/s','Interpreter', 'latex');
exportgraphics(f, '../figures/SpeedFiltered.pdf');


%%
filteredvelocity_fft = fft(velocity_filtered);

% Plot the magnitude spectrum
f = figure;
f.Position = [ 810         819        1320         419];
plot((0:length(filteredvelocity_fft)-1) * fs / length(filteredvelocity_fft), 20*log10(abs(filteredvelocity_fft)),  'Color', 'red');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Magnitude Spectrum of Filtered Speed in Decibel', 'Interpreter','latex');
set(gca, 'FontSize', 18);
xlabel('$\Omega$','Interpreter', 'latex');
ylabel('Magnitude in dB','Interpreter', 'latex');
exportgraphics(f, '../figures/FilteredSpeed_MagnitudeSpectrum.pdf');

% Plot the phase spectrum
f = figure;
f.Position = [ 810         819        1320         419];
plot((0:length(filteredvelocity_fft)-1) * fs / length(filteredvelocity_fft), angle(filteredvelocity_fft), 'Color', 'red');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Phase Spectrum of Filtered Speed', 'Interpreter','latex');
set(gca, 'FontSize', 18);
xlabel('$\Omega$','Interpreter', 'latex');
ylabel('Phase (rad)','Interpreter', 'latex');
exportgraphics(f, '../figures/FilteredSpeed_Phase_Spectrum.pdf');