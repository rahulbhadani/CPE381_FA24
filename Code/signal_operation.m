close all;
f = figure(1);
f.Position =  [ 435         124        1304         787];

%% Continuous cosine wave
% time points
t = -5:0.001:5; %fine-grained time points to represent continuous nature of the sinewave
subplot(3, 2, 1);
x = 6.*t.^2 + 4.*t +70; %
plot(t, x, '-', 'Color','#333333', 'LineWidth', 2, 'DisplayName', 'x(t)');
hold on;
tau = 1.0;
x = 6.*(t-tau).^2 + 4.*(t-tau) +70; %
plot(t, x, '-', 'Color','red', 'LineWidth', 2, 'DisplayName', 'x(t - tau)');
x = 6.*(t+tau).^2 + 4.*(t+tau) +70; %
plot(t, x, '-', 'Color','blue', 'LineWidth', 2, 'DisplayName', 'x(t + tau)');
grid on;
grid minor;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
legend('Location','northeast', 'Interpreter','latex');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Signal Operation', 'Interpreter','latex');
xlim([-20, 20]);

%%
subplot(3, 2, 2);
tau = 0.25;
x = 6.*(t-tau).^2 + 4.*(t-tau) +70; %
plot(t, x, '-', 'Color','#333333', 'LineWidth', 2, 'DisplayName', 'x(t - tau)');
grid on;
grid minor;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
legend('Location','northeast', 'Interpreter','latex');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Signal Operation', 'Interpreter','latex');
xlim([-20, 20]);

%%
subplot(3, 2, 3);
tau = 0.25;
x = 6.*(t+tau).^2 + 4.*(t+tau) +70; %
plot(t, x, '-', 'Color','#333333', 'LineWidth', 2, 'DisplayName', 'x(t + tau)');
grid on;
grid minor;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
legend('Location','northeast', 'Interpreter','latex');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Signal Operation', 'Interpreter','latex');
xlim([-20, 20]);

%%
subplot(3, 2, 4);
x = 6.*(-t).^2 + 4.*(-t) +70; %
plot(t, x, '-', 'Color','#333333', 'LineWidth', 2, 'DisplayName', 'x(-t)');
grid on;
grid minor;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
legend('Location','northeast', 'Interpreter','latex');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Signal Operation', 'Interpreter','latex');
xlim([-20, 20]);


%%
subplot(3, 2, 5);
x = -(6.*(t).^2 + 4.*(t) +70); %
plot(t, x, '-', 'Color','#333333', 'LineWidth', 2, 'DisplayName', '-x(t)');
grid on;
grid minor;
ax = gca;
ax.GridColor = [130, 130, 130]/255;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
legend('Location','northeast', 'Interpreter','latex');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('Signal Operation', 'Interpreter','latex');
xlim([-20, 20]);

sgtitle('x(t) = $6t^2 + 4t +70$',  'Interpreter','latex');
exportgraphics(f, sprintf('../figures/signal_operations.pdf'));