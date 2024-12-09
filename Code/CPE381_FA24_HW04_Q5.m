close all;
% Define the parameters
T = 2;  % Period of the square wave
N = 100;  % Number of Fourier series terms
t = linspace(-2*T, 2*T, 1000);  % Time array
Amplitude = 3.0;

% Define the square wave function
squarewave = @(t) Amplitude.*(mod(t, T) < T/2);

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
exportgraphics(f, '../figures/CPE381_FA24_HW04_Q5_Square_Wave.pdf');


Omega  = (2.*pi)./T;


k_end = 10;
x_t_10 = zeros(size(t));
for t_index = 1:length(t)
    for k = -k_end/2:1:k_end/2
      x_t_10(t_index) = x_t_10(t_index) + X_k(k).*exp(1j.*k.*Omega.*t(t_index));
    end
end

k_end = 20;
x_t_20 = zeros(size(t));
for t_index = 1:length(t)
    for k = -k_end/2:1:k_end/2
      x_t_20(t_index) = x_t_20(t_index) + X_k(k).*exp(1j.*k.*Omega.*t(t_index));
    end
end
k_end = 50;
x_t_50 = zeros(size(t));
for t_index = 1:length(t)
    for k = -k_end/2:1:k_end/2
      x_t_50(t_index) = x_t_50(t_index) + X_k(k).*exp(1j.*k.*Omega.*t(t_index));
    end
end


f = figure;
f.Position = [517 687 1464 551];
plot(t, squarewave(t), 'b', 'LineWidth',2, ...
    'DisplayName', 'Original Signal');
hold on;
plot(t, x_t_10, 'r', 'LineWidth',2, 'DisplayName','10 Harmonics');
plot(t, x_t_20, 'g', 'LineWidth',2, 'DisplayName','20 Harmonics');
plot(t, x_t_50, 'k', 'LineWidth',2, 'DisplayName','50 Harmonics');
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
legend;
grid minor;

exportgraphics(f, '../figures/CPE381_FA24_HW04_Q5_Harmonics.pdf');


% Magnitude Spectrum
k = -50:1:50;
Xk = X_k(k);

f = figure;
f.Position = [517 687 1464 551];
subplot(2,1,1)
stem(k, abs(Xk), 'b', 'LineWidth',2);
hold on;
xlabel('Time (s)');
title('Magnitude Spectrum','Interpreter', 'latex');
%legend('Square Wave', 'Fourier Series Approximation');
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
xlabel('k','Interpreter', 'latex');
ylabel('$|X_k|$','Interpreter', 'latex');
set(gca, 'FontSize', 18);
ylim([-1.5,1.5])
grid on;
grid minor;

% Phase spectrum 

subplot(2,1,2)
stem(k, angle(Xk), 'b', 'LineWidth',2);
hold on;
xlabel('Time (s)');
title('Phase Spectrum','Interpreter', 'latex');
%legend('Square Wave', 'Fourier Series Approximation');
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
xlabel('k','Interpreter', 'latex');
ylabel('$\angle X_k$','Interpreter', 'latex');
set(gca, 'FontSize', 18);
ylim([-2.5,2.5])
grid on;
grid minor;

exportgraphics(f, '../figures/CPE381_FA24_HW04_Q5_Spectrum.pdf');

function result = X_k(k)
    Amplitude = 3.0;
    result = zeros(size(k));
    
    % Handle k == 0 separately
    idx = (k == 0);
    result(idx) = Amplitude/2;
    
    % Calculate for non-zero k
    idx = (k ~= 0);
    result(idx) = (Amplitude/2) .* (1 - (-1).^k(idx)) ./ (1j .* k(idx) .* pi);
end