plot_acceleration_data('../Data/accel.csv');

smooth_acceleration_data('../Data/accel.csv');

function plot_acceleration_data(csv_file)
    % Read the acceleration data from the CSV file
    data = readtable(csv_file);
    acceleration = data.Message;

    % Compute the Power Spectral Density (PSD) of the velocity data
    [pxx, f] = pwelch(acceleration);
    
    % Plot the PSD
    figure;
    plot(f, pxx);
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density (m^2/s^2/Hz)');
    title('PSD of Acceleration Data');

    
    % Plot the acceleration data
    figure;
    plot(data.Time, acceleration);
    xlabel('Time (s)');
    ylabel('acceleration (m/s)');
    title('acceleration Data');
    
    % Compute the Fourier transform of the acceleration data
    fs = 1 / mean(diff(data.Time));  % sampling frequency
    acceleration_fft = fft(acceleration);
    
    % Plot the magnitude spectrum
    figure;
    plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), log(abs(acceleration_fft)));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude Spectrum');
    
    % Plot the phase spectrum
    figure;
    plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), angle(acceleration_fft));
    xlabel('Frequency (Hz)');
    ylabel('Phase (rad)');
    title('Phase Spectrum');
    
    % Plot the energy spectrum
    figure;
    plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), log(abs(acceleration_fft).^2));
    xlabel('Frequency (Hz)');
    ylabel('Energy');
    title('Energy Spectrum');
end

function smooth_acceleration_data(csv_file)
    % Read the acceleration data from the CSV file
    data = readtable(csv_file);
    
    acceleration = data.Message;
    
    % Define the filter parameters
    fs = 1 / mean(diff(data.Time));  % sampling frequency
    cutoff_freq = 2;
    order = 4;


    % Design the low-pass filter
    [b, a] = butter(order, cutoff_freq / (fs/2), 'low');
    
    % Apply the filter to the acceleration data
    acceleration_filtered = filter(b, a, acceleration);
    
    % Plot the original and filtered acceleration data
    figure;
    plot(data.Time, acceleration, data.Time, acceleration_filtered);
    xlabel('Time (s)');
    ylabel('acceleration (m/s)');
    legend('Original', 'Filtered');
    title('acceleration Data');
    
    % Compute the Fourier transform of the filtered acceleration data
    acceleration_fft = fft(acceleration_filtered);
    
    % Plot the magnitude spectrum
    figure;
    plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), log(abs(acceleration_fft)));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude Spectrum');
    
    % Plot the phase spectrum
    figure;
    plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), angle(acceleration_fft));
    xlabel('Frequency (Hz)');
    ylabel('Phase (rad)');
    title('Phase Spectrum');
    
    % Plot the energy spectrum
    figure;
    plot((0:length(acceleration_fft)-1) * fs / length(acceleration_fft), log(abs(acceleration_fft).^2));
    xlabel('Frequency (Hz)');
    ylabel('Energy');
    title('Energy Spectrum');
    
    % Compute the Mean Squared Error (MSE) between original and filtered acceleration data
    mse = mean((acceleration - acceleration_filtered).^2);
    
    % Print the MSE
    fprintf('Mean Squared Error (MSE): %f\n', mse);
end