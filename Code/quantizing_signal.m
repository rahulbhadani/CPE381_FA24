% Define parameters
t = linspace(0, 2*pi, 1000); % Time vector for one period
x = sin(t); % Sine wave

% Quantization parameters
num_bits = 4; % Number of bits
num_levels = 2^num_bits; % Number of quantization levels
quantized_levels = linspace(-1, 1, num_levels); % Quantization levels
x_quantized = quantize_signal(x, quantized_levels); % Quantized signal


% Plot the original and quantized signals
f = figure;
f.Position = [265         377        1290         849];

plot(t, x, 'b', 'LineWidth', 1.5); hold on;
plot(t, x_quantized, 'r', 'LineWidth', 1.5);
grid on;
title('Sine Wave and Quantized Signal (4 bits)', 'Interpreter','latex');
xlabel('Time','Interpreter', 'latex');
ylabel('Amplitude','Interpreter', 'latex');
legend('Original Sine Wave', 'Quantized Signal','Interpreter','latex');

% Set y-ticks to show bit values
% Set y-ticks to show bit values in binary
yticks = quantized_levels;
yticklabels = arrayfun(@(y) dec2bin(find(quantized_levels == y)-1, num_bits), yticks, 'UniformOutput', false);
set(gca, 'YTick', yticks, 'YTickLabel', yticklabels);
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
ylim([-1.1, 1.1])

set(gca, 'FontSize', 18);


exportgraphics(f, '../figures/Quantized_Sine.pdf');


% Function to quantize signal
function quantized_signal = quantize_signal(signal, quantized_levels)
    quantized_signal = arrayfun(@(x) find_closest_level(x, quantized_levels), signal);
end

% Function to find the closest quantization level
function closest_level = find_closest_level(value, quantized_levels)
    [~, idx] = min(abs(quantized_levels - value));
    closest_level = quantized_levels(idx);
end