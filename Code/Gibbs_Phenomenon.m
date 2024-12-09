% Define the parameters
T = 1;  % Period of the square wave
N = 100;  % Number of Fourier series terms
t = linspace(0, 2*T, 1000);  % Time array

% Define the square wave function
square_wave = @(t) (mod(t, T) < T/2);

% Calculate the Fourier series coefficients
a0 = 1/2;
an = @(n) (2/T) * integral(@(t) square_wave(t).*cos(2*pi*n*t/T), 0, T);
bn = @(n) (2/T) * integral(@(t) square_wave(t).*sin(2*pi*n*t/T), 0, T);

% Initialize the Fourier series approximation
f_approx = a0 * ones(size(t));

% Add the Fourier series terms
for n = 1:N
    f_approx = f_approx + an(n) * cos(2*pi*n*t/T) + bn(n) * sin(2*pi*n*t/T);
end

% Plot the results
f = figure;
f.Position = [517 687 1464 551];
plot(t, square_wave(t), 'k', t, f_approx, 'r');
hold on;
xlabel('Time (s)');
title('Gibb''s Phenomenon in Fourier Series Approximation','Interpreter', 'latex');
legend('Square Wave', 'Fourier Series Approximation');
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
xlabel('Time','Interpreter', 'latex');
ylabel('Amplitude','Interpreter', 'latex');
set(gca, 'FontSize', 18);
circle_x = 0.5;
circle_y = 1.0;
radius = 0.2;
theta = linspace(0, 2*pi, 100);
circle_x_coords = circle_x + radius * cos(theta);
circle_y_coords = circle_y + radius * sin(theta);
plot(circle_x_coords, circle_y_coords, 'b-', 'DisplayName','Gibss Phenomenon');
text(0.5, 0.85, 'Gibbs Phenomenon', 'Color', 'b', 'FontSize', 14);

grid on;
grid minor;
exportgraphics(f, '../figures/gibbs_phenomenon.pdf');
