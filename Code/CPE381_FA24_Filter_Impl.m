% Example usage
% Define coefficients c and d
c = [1 2 3];  % c_i coefficients
d = [4 5];    % d_j coefficients
N = length(c) - 1;  % order of c
M = length(d);      % order of d

% % Read x[n] from file
% filename = 'data.csv';
% column = 2;  % column number of x[n] in file
% x = read_x_from_file(filename, column);
% 
% % Calculate y[n]
% y = calculate_y(x, c, d, N, M);

%%

% Alternatively, read x[n] from a vector
x_vector = [1 2 3 4 5 6 7 8 9];
y_vector = calculate_y(x_vector, c, d);

% Plot y[n]
plot(y_vector);
xlabel('n');
ylabel('y[n]');
title('Calculated y[n]');

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

c = [0.0004166 0.0016664 0.0024996 0.0016664 0.0004166];  % c_i coefficients
d = [1 -3.1806 3.8612 -2.1122 0.43827];    % d_j coefficients


filtered_sine = calculate_y(noisy_sine, c, d);
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



function y = calculate_y(x, c, d)
    N = length(c);  % order of c
    M = length(d);      % order of d
    % Initialize y vector with zeros
    y = zeros(size(x));
    
    % Calculate y[n]
    for n = 1:length(x)
        sum_c = 0;
        sum_d = 0;
        
        % Calculate sum of c_i * x[n-i]
        for i = 1:N
            if n - i > 0
                % n-i+1
                sum_c = sum_c + c(i) * x(n-i+1);
            end
        end
        
        % Calculate sum of d_j * y[n-j]
        for j = 1:M
             if n - j > 0
                sum_d = sum_d + d(j) * y(n-j+1);
             end
        end
        
        % Calculate y[n]
        y(n) = sum_c - sum_d;
    end
end

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

