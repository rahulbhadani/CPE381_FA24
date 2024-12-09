% Parameters
T = 1;              % Time period (s)
duty_cycle = 0.25;  % Duty cycle (25%)
total_time = 10;    % Total simulation time (s)
amplitude = 1;      % Signal amplitude

% Time vector
t = 0:0.001:total_time;

% Generate PWM signal
pwm_signal = amplitude * (mod(t, T) < duty_cycle * T);

% Create figure
figure('Position', [100, 100, 800, 400]);

% Plot PWM signal
plot(t, pwm_signal, 'LineWidth', 2);

% Set axis limits
xlim([0, total_time]);
ylim([-0.1, 1.1]);

% Configure x-axis
xticks(0:0.25:total_time);
xticklabels(cellstr(num2str((0:0.25:total_time)', '%.2f')));

% Labels and title
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('Amplitude', 'Interpreter', 'latex', 'FontSize', 24);
title('Pulse Width Modulation Signal', 'Interpreter', 'latex', 'FontSize', 24);

% Adjust font size for axis ticks
ax = gca;
ax.FontSize = 16;
ax.XAxis.FontSize = 16;  % Explicitly set x-axis tick font size
ax.YAxis.FontSize = 16;  % Explicitly set y-axis tick font size

% Add grid
grid on;

% Adjust figure properties
set(gcf, 'Color', 'w');

% Save figure as PNG
saveas(gcf, '../figures/pwm_signal.png');