% Define the time period
T = 2*pi;

% Define the sampling frequency
fs = 100;

% Generate the time array
t = 0:1/fs:T;

% Generate the sine wave
y = sin(2*pi/T*t);

% Plot the sine wave
figure;
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave with Time Period 2\pi');

Y = fft(y);
% Plot the magnitude spectrum
f = (0:length(Y)-1) * fs / length(Y);  % frequency axis
figure;
plot(f, abs(Y));
xlabel('Frequency (Hz)');
xlim([-200, 200])
ylabel('Magnitude');
title('Magnitude Spectrum of Noisy Sine Wave');

% Define the noise frequency and amplitude
noise_freq = 10;  % 10 times the sine wave frequency
noise_amp = 0.1;  % 10% of the sine wave amplitude

% Add high frequency noise to the sine wave
noisy_sine = add_high_freq_noise(t, y, noise_freq, noise_amp);


figure;
% Plot the original and noisy sine waves
plot(t, y, t, noisy_sine);
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Sine Wave', 'Noisy Sine Wave');

Z = fft(noisy_sine);
% Plot the magnitude spectrum
f = (0:length(Z)-1) * fs / length(Z);  % frequency axis
figure;
plot(f, abs(Z));
xlabel('Frequency (Hz)');
xlim([-200, 200])
ylabel('Magnitude');
title('Magnitude Spectrum of Noisy Sine Wave');


% Define the filter order and cutoff frequency
order = 4;
cutoff_freq = 5;  % Hz

% Design the low-pass filter
[b, a] = butter(order, cutoff_freq / (fs/2), 'low');

% Print the filter coefficients
fprintf('Filter coefficients: b = [%s], a = [%s]\n', num2str(b), num2str(a));

filtered_sine = filter(b, a, noisy_sine);

% Plot the original and filtered sine waves
figure;
plot(t, noisy_sine, t, filtered_sine);
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Noisy Sine Wave', 'Filtered Sine Wave');

function noisy_sine = add_high_freq_noise(t, y, noise_freq, noise_amp)
    % Generate high frequency noise
    noise = noise_amp * sin(2*pi*noise_freq*t);
    
    % Add noise to the sine wave
    noisy_sine = y + noise;
end

