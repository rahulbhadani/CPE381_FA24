% Define the time period
T = 2*pi;
% Define the sampling frequency
fs = 100;
% Generate the time array
t = 0:1/fs:T;
% Generate the sine wave
x = sin(2*pi/T*t);
% Plot the sine wave
figure;
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave with Time Period 2\pi');
X = fft(x);
% Plot the magnitude spectrum
f = (0:length(X)-1) * fs / length(X);  % frequency axis
figure;
subplot(211)
plot(f, abs(X));
xlabel('Frequency (Hz)');
xlim([-200, 200])
ylabel('Magnitude');
title('Magnitude Spectrum of Sine Wave');
subplot(212)
stem(f, angle(X));
xlabel('phase (radian)');
xlim([-200, 200])
ylabel('Phase');
title('Phase Spectrum of Sine Wave');