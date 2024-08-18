%% (C) Rahul Bhadani

f = figure(1);
f.Position =  [ 440   276   947   647];

%% Continuous Sine wave
% time points
t = 0:0.001:50; %fine-grained time points to represent continuous nature of the sinewave
x = sin(t);


subplot(3,1,1);
plot(t, x, '-', 'Color','#333333', 'LineWidth', 2, 'DisplayName', 'Continuous Sine Wave');
grid on;
grid minor;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
%legend('Location','northeast', 'Interpreter','latex');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Continuous representation of a sine wave', 'Interpreter','latex');

%% Discrete representation
t = 0:1.0:50;
x= sin(t);
subplot(3,1,2);
plot(t, x, '-', 'Color','#da627d', 'LineWidth', 2, 'DisplayName', 'Discrete Sine Wave');
grid on;
grid minor;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
%legend('Location','northeast', 'Interpreter','latex');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Discrete representation of a sine wave', 'Interpreter','latex');

subplot(3,1,3);
stem(t, x, '-', 'Color','#9b5de5', 'LineWidth', 2, 'DisplayName', 'Discrete Sine Wave (stemp plot)');
grid on;
grid minor;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
%legend('Location','northeast', 'Interpreter','latex');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Discrete representation of a sine wave (stem plot)', 'Interpreter','latex');

%% save figure
exportgraphics(f, sprintf('../figures/sampled_sine_wave.png'));