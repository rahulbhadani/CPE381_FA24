%(C) Rahul Bhadani
close all;
t = 0:0.001:3;
x = 2*cos(2.*pi.*t + pi./4);
f = figure(1);
f.Position = [265, 377, 1290, 849];

plot(t, x,'LineWidth', 1.5);
grid on;
xlabel('Time','Interpreter', 'latex');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', ...
    [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('x(t)', 'Interpreter','latex');
set(gca, 'FontSize', 18);
exportgraphics(f, '../figures/HW06_Q2_FA24_CPE381_FIG1.pdf');

%%

f = figure(2);
f.Position = [265, 377, 1290, 849];

subplot(2, 2,1)
T_s = 0.1;
[ts1, xs1] = sampled_cosine(T_s);
plot(t, x,'LineWidth', 1.5, 'DisplayName','x(t)');
hold on;
stem(ts1, xs1,'LineWidth', 1.5, ...
    'DisplayName','$x_s(t)$, $T_s = 0.1$');
grid on;
xlabel('Time','Interpreter', 'latex');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', ...
    [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('x(t)', 'Interpreter','latex');
set(gca, 'FontSize', 18);
legend('Interpreter','latex');

subplot(2, 2,2)
T_s = 0.2;
[ts1, xs1] = sampled_cosine(T_s);
plot(t, x,'LineWidth', 1.5, 'DisplayName','x(t)');
hold on;
stem(ts1, xs1,'LineWidth', 1.5, ...
    'DisplayName','$x_s(t)$, $T_s = 0.2$');
grid on;
xlabel('Time','Interpreter', 'latex');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], ...
    'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('x(t)', 'Interpreter','latex');
set(gca, 'FontSize', 18);
legend('Interpreter','latex');

subplot(2, 2,3)
T_s = 0.3;
[ts1, xs1] = sampled_cosine(T_s);
plot(t, x,'LineWidth', 1.5, 'DisplayName','x(t)');
hold on;
stem(ts1, xs1,'LineWidth', 1.5, ...
    'DisplayName','$x_s(t)$, $T_s = 0.3$');
grid on;
xlabel('Time','Interpreter', 'latex');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], ...
    'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('x(t)', 'Interpreter','latex');
set(gca, 'FontSize', 18);
legend('Interpreter','latex');

subplot(2, 2,4)
T_s = 2.0;
[ts1, xs1] = sampled_cosine(T_s);
plot(t, x,'LineWidth', 1.5, 'DisplayName','x(t)');
hold on;
stem(ts1, xs1,'LineWidth', 1.5, ...
    'DisplayName','$x_s(t)$, $T_s = 2.0$');
grid on;
xlabel('Time','Interpreter', 'latex');
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], ...
    'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
title('x(t)', 'Interpreter','latex');
set(gca, 'FontSize', 18);
legend('Interpreter','latex');
exportgraphics(f, '../figures/HW06_Q2_FA24_CPE381_FIG2.pdf');

% Function to quantize signal
function [t, x] = sampled_cosine(T_s)
    t = 0:T_s:3.0;
    x = 2*cos(2.*pi.*t + pi./4);
end