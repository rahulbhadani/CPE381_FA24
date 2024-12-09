%%

% Define the time period
T = 1;

% Define the sampling frequency
fs = 100; % Hz
% Generate the time array
t = 0:1/fs:T;
% Generate the sine wave
x = sin(2*pi/T*t);
% Plot the sine wave

%

% Define the noise frequency and amplitude
noise_freq = 10;  % 10 times the sine wave frequency
noise_amp = 0.1;  % 10% of the sine wave amplitude

% Add high frequency noise to the sine wave
noisy_sine = add_high_freq_noise(t, x, noise_freq, noise_amp);
noisy_sine = noisy_sine';

% From Homework 5

% b_i coefficients
b = [0.0004166 0.0016664 0.0024996 0.0016664 0.0004166];
% a_j coefficients
a = [1 -3.1806 3.8612 -2.1122 0.43827];


filtered_sine = cpedigitalfilter(noisy_sine, b, a);
% Plot the original and filtered sine waves
fig = figure;
% Plot the original and noisy sine waves
plot(t, x,'LineWidth',2,'color', '#ff3453');
hold on;
plot(t, noisy_sine,'LineWidth',2,'color', '#559982');
plot(t, filtered_sine,'LineWidth',2,'color', '#0034f3')
legend('Original Sine Wave', 'Noisy Sine Wave', 'Filtered Sine Wave');
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
ylim([-1.5, 1.5]);

xlabel('Time (s)', 'Interpreter','latex');
ylabel('Amplitude', 'Interpreter','latex');
title('Sine Waves', 'Interpreter','latex');
set(gca, 'FontSize', 18);

exportgraphics(fig, ...
'../figures/CPE381_FA24_HW8_Q2_3.pdf');


mse = mean((noisy_sine - filtered_sine).^2);

fprintf('Mean Squared Error: %.5f\n', mse);


% Function to read x[n] from file
function x = read_x_from_file(filename, column)
    data = csvread(filename);
    x = data(:, column);
end

function noisy_sine = add_high_freq_noise(t, y, noise_freq, noise_amp)
    % Generate high frequency noise
    noise = noise_amp * sin(2*pi*noise_freq*t);
    
    % Add noise to the sine wave
    noisy_sine = y + noise;
end


