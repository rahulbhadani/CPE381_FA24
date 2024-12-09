plot_velocity_data('../Data/vel.csv');

smooth_velocity_data('../Data/vel.csv');

function plot_velocity_data(csv_file)
    % Read the velocity data from the CSV file
    data = readtable(csv_file);
    data.Time = data.Time - data.Time(1);
    % Convert the velocity data to m/s
    velocity_ms = data.Message * 1000 / 3600;
    
    % Compute the Power Spectral Density (PSD) of the velocity data
    [pxx, f] = pwelch(velocity_ms);
    
    % Plot the PSD
    figure;
    plot(f, log(pxx));
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density (m^2/s^2/Hz)');
    title('PSD of Velocity Data');

    % Plot the velocity data
    figure;
    plot(data.Time, velocity_ms);
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    title('Velocity Data');
    
    % Compute the Fourier transform of the velocity data
    fs = 1 / mean(diff(data.Time));  % sampling frequency
    velocity_fft = fft(velocity_ms);
    
    % Plot the magnitude spectrum
    figure;
    plot((0:length(velocity_fft)-1) * fs / length(velocity_fft), log(abs(velocity_fft)));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude Spectrum');
    
    % Plot the phase spectrum
    figure;
    plot((0:length(velocity_fft)-1) * fs / length(velocity_fft), angle(velocity_fft));
    xlabel('Frequency (Hz)');
    ylabel('Phase (rad)');
    title('Phase Spectrum');
    
    % Plot the energy spectrum
    figure;
    plot((0:length(velocity_fft)-1) * fs / length(velocity_fft), log(abs(velocity_fft).^2));
    xlabel('Frequency (Hz)');
    ylabel('Energy');
    title('Energy Spectrum');
end

function smooth_velocity_data(csv_file)
    % Read the velocity data from the CSV file
    data = readtable(csv_file);
    
    data.Time = data.Time - data.Time(1);

    % Convert the velocity data to m/s
    velocity_ms = data.Message * 1000 / 3600;
    
    % Define the filter parameters
    fs = 1 / mean(diff(data.Time));  % sampling frequency

    fs

    cutoff_freq = fs*0.9;  % Hz
    order = 4;
    
    % Normalize the cutoff frequency to the Nyquist frequency
    normalized_cutoff_freq = cutoff_freq / (fs / 2);

    normalized_cutoff_freq
    
    % Design the low-pass filter
    [b, a] = butter(order, normalized_cutoff_freq / (fs/2), 'low');
    
    % Apply the filter to the velocity data
    velocity_filtered = filter(b, a, velocity_ms);

     
    % Compute the Power Spectral Density (PSD) of the velocity data
    [pxx, f] = pwelch(velocity_filtered);
    
    % Plot the PSD
    figure;
    plot(f, log(pxx));
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density (m^2/s^2/Hz)');
    title('PSD of Filtered Velocity Data');
    
    % Plot the original and filtered velocity data
    figure;
    plot(data.Time, velocity_ms, data.Time, velocity_filtered);
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    legend('Original', 'Filtered');
    title('Velocity Data');
    
    % Compute the Fourier transform of the filtered velocity data
    velocity_fft = fft(velocity_filtered);
    
    % Plot the magnitude spectrum
    figure;
    plot((0:length(velocity_fft)-1) * fs / length(velocity_fft), log(abs(velocity_fft)));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude Spectrum');
    
    % Plot the phase spectrum
    figure;
    plot((0:length(velocity_fft)-1) * fs / length(velocity_fft), angle(velocity_fft));
    xlabel('Frequency (Hz)');
    ylabel('Phase (rad)');
    title('Phase Spectrum');
    
    % Plot the energy spectrum
    figure;
    plot((0:length(velocity_fft)-1) * fs / length(velocity_fft), log(abs(velocity_fft).^2));
    xlabel('Frequency (Hz)');
    ylabel('Energy');
    title('Energy Spectrum');
    
    % Compute the Mean Squared Error (MSE) between original and filtered velocity data
    mse = mean((velocity_ms - velocity_filtered).^2);
    
    % Print the MSE
    fprintf('Mean Squared Error (MSE): %f\n', mse);
end