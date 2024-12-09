%% Define the time period
T = 1;

% Define the sampling frequency
fs = 100; % Hz
% Generate the time array
t = 0:1/fs:T;
% Generate the sine wave
x = sin(2*pi/T*t);
% Plot the sine wave
fig = figure;
plot(t, x,'LineWidth',2,'color', '#ff3453')
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
title('$sin(2\pi t)$', 'Interpreter','latex');
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
    '../figures/CPE381_FA24_HW5_Q3_Sin.pdf');

%%
%X = fft(x);
X = fftshift(fft(x));
% Plot the magnitude spectrum
N = length(X); % number of points in fft
f = (-N/2:N/2-1)*(fs/N); % frequency vector

fig = figure;
plot(f, abs(X) ,'LineWidth',2, 'color', '#ff0053')
xlabel('Frequency (Hz)', 'Interpreter','latex');

ylabel('Magnitude', 'Interpreter','latex');
title('Magnitude Spectrum $|X(\Omega)|$',  'Interpreter','latex');

grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
    '../figures/CPE381_FA24_HW5_Q3_Sin_Fourier_Magnitude_FFTShift.pdf');


fig = figure;
plot(f, angle(X) ,'LineWidth',2, 'color', '#ff0053')
xlabel('Frequency (Hz)', 'Interpreter','latex');

ylabel('Phase', 'Interpreter','latex');
title('Phase Spectrum $|X(\Omega)|$',  'Interpreter','latex');

grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
    '../figures/CPE381_FA24_HW5_Q3_Sin_Fourier_Phase_FFTShift.pdf');


%%

% Define the noise frequency and amplitude
noise_freq = 10;  % 10 times the sine wave frequency
noise_amp = 0.1;  % 10% of the sine wave amplitude

% Add high frequency noise to the sine wave
noisy_sine = add_high_freq_noise(t, x, noise_freq, noise_amp);


fig = figure;
% Plot the original and noisy sine waves
plot(t, x,'LineWidth',2,'color', '#ff3453');
hold on;
plot(t, noisy_sine,'LineWidth',2,'color', '#0034f3')
legend('Original Sine Wave', 'Noisy Sine Wave');
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
exportgraphics(fig, '../figures/CPE381_FA24_HW5_Q3_NoisySin.pdf');

%%
%Y = fft(noisy_sine);
Y = fftshift(fft(noisy_sine));
% Plot the magnitude spectrum
N = length(Y); % number of points in fft
f = (-N/2:N/2-1)*(fs/N); % frequency vector

fig = figure;
plot(f, abs(Y) ,'LineWidth',2, 'color', '#ff0053')
xlabel('Frequency (Hz)', 'Interpreter','latex');

ylabel('Magnitude', 'Interpreter','latex');
title('Magnitude Spectrum of Noisy Sine Wave',  'Interpreter','latex');

grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
    '../figures/CPE381_FA24_HW5_Q3_NoisySin_Fourier_Magnitude_FFTShift.pdf');


fig = figure;
plot(f, angle(X) ,'LineWidth',2, 'color', '#ff0053')
xlabel('Frequency (Hz)', 'Interpreter','latex');

ylabel('Phase', 'Interpreter','latex');
title('Phase Spectrum of Noisy Sine Wave',  'Interpreter','latex');

grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
set(gca, 'FontSize', 18);
exportgraphics(fig, ...
    '../figures/CPE381_FA24_HW5_Q3_NoisySin_Fourier_Phase_FFTShift.pdf');


%%

% Define the filter order and cutoff frequency
order = 4;
cutoff_freq = 5;  % Hz

% Design the low-pass filter
[b, a] = butter(order, cutoff_freq / (fs/2), 'low');

% Print the filter coefficients
fprintf('Filter coefficients: b = [%s], a = [%s]\n', num2str(b), num2str(a));

filtered_sine = filter(b, a, noisy_sine);

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
    '../figures/CPE381_FA24_HW5_Q3_FilteredSin.pdf');

% MSE
MSE = mean((x - filtered_sine).^2);
fprintf('Mean Squared Error: %.5f\n', MSE);

function noisy_sine = add_high_freq_noise(t, y, noise_freq, noise_amp)
    % Generate high frequency noise
    noise = noise_amp * sin(2*pi*noise_freq*t);
    
    % Add noise to the sine wave
    noisy_sine = y + noise;
end

