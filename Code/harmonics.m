
%(C) Rahul Bhadani
L = 5;

% Define the time vector
t = 0:0.01:10*L;

% Define the sine wave
x = sin(2*pi*t/L);

% Define the fundamental and harmonics
fundamental = sin(2*pi*t/L);
harmonics_2 = fundamental + (1/3)*sin(6*pi*t/L);
harmonics_5 = fundamental + (1/3)*sin(6*pi*t/L) + (1/5)*sin(10*pi*t/L) + (1/7)*sin(14*pi*t/L) + (1/9)*sin(18*pi*t/L);
harmonics_20 = 0;
for i = 1:20
    harmonics_20 = harmonics_20 + (4/pi)*(1/(2*i-1))*sin((2*i-1)*2*pi*t/L);
end

% Create the figure
f = figure(2);
f.Position =[ 895         762        1324         452];

plot(t/L, x, 'b-', 'LineWidth', 2);
hold on;
plot(t/L, fundamental, 'r-', 'LineWidth', 2);
plot(t/L, harmonics_2, 'g-', 'LineWidth', 2);
plot(t/L, harmonics_5, 'c-', 'LineWidth', 2);
plot(t/L, harmonics_20, 'm-', 'LineWidth', 2);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
ylim([-1.5, 1.5]);
xlim([0, 10]);
yaxis.TickLabelInterpreter = 'latex';
xlabel('Time','Interpreter', 'latex');
title('Sine wave with period $L$ and harmonics', 'Interpreter', 'latex');
legend('Sine wave', 'Fundamental', 'Fundamental + 2 harmonics', 'Fundamental + 5 harmonics', 'Fundamental + 20 harmonics', 'Interpreter', 'latex');
set(gca, 'FontSize', 25);
grid on;
grid minor;
exportgraphics(f, '../figures/sine_wave_with_harmonics.pdf');

%%

% Define the number of harmonics
n_harmonics = 20;

% Define the amplitudes of the harmonics
amplitudes = zeros(1, n_harmonics);
for i = 1:n_harmonics
    amplitudes(i) = (4/pi)*(1/(2*i-1));
end

% Calculate the power of each harmonic
powers = abs(amplitudes).^2;

% Create the figure
f = figure(2);
stem(1:n_harmonics, powers, 'b-', 'LineWidth', 2);
grid on;
grid minor;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
ylim([0, 1]);
xlim([1, n_harmonics]);
yaxis.TickLabelInterpreter = 'latex';
xlabel('Harmonic Index ($k$)','Interpreter', 'latex');
ylabel('Power ($|X_k|^2$)','Interpreter', 'latex');
title('Power Distribution over Harmonics', 'Interpreter', 'latex');
exportgraphics(f, '../figures/harmonic_power.pdf');