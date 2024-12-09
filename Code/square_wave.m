% Define the parameters
T = 2;  % Period of the square wave
N = 100;  % Number of Fourier series terms
t = linspace(-2*T, 2*T, 1000);  % Time array
Amplitude = 3.0;

% Define the square wave function
squarewave = @(t) Amplitude.*(mod(t, T) < T/2);

% Calculate the Fourier series coefficients
a0 = 1/2;
an = @(n) (2/T) * integral(@(t) squarewave(t).*cos(2*pi*n*t/T), 0, T);
bn = @(n) (2/T) * integral(@(t) squarewave(t).*sin(2*pi*n*t/T), 0, T);


% Initialize the Fourier series approximation
f_approx = a0 * ones(size(t));

% Add the Fourier series terms
for n = 1:N
    f_approx = f_approx + an(n) * cos(2*pi*n*t/T) + bn(n) * sin(2*pi*n*t/T);
end

% Plot the results
f = figure;
f.Position = [517 687 1464 551];
plot(t, squarewave(t), 'b', 'LineWidth',2);
hold on;
xlabel('Time (s)');
title('Square Wave','Interpreter', 'latex');
%legend('Square Wave', 'Fourier Series Approximation');
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
xlabel('Time','Interpreter', 'latex');
ylabel('Amplitude','Interpreter', 'latex');
set(gca, 'FontSize', 18);
ylim([-4,4])
grid on;
grid minor;
exportgraphics(f, '../figures/squarewave.pdf');


%%

% Plot the results
f = figure;
f.Position = [517 687 1464 551];
plot(an(1:T), bn(1:T), 'b', 'LineWidth',2);
hold on;
xlabel('Time (s)');
title('Square Wave','Interpreter', 'latex');
%legend('Square Wave', 'Fourier Series Approximation');
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
xlabel('Time','Interpreter', 'latex');
ylabel('Amplitude','Interpreter', 'latex');
set(gca, 'FontSize', 18);
ylim([-4,4])
grid on;
grid minor;