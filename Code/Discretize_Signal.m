Tend = 2*pi;
DeltaT = 0.001;
t = 0:DeltaT:Tend;
x = sin(t);
f= figure;
f.Position = [ 810         819        1320         419];
subplot(121)
plot(t, x, 'LineWidth',2)
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
set(gca, 'FontSize', 18);
DeltaT = 0.5;
t2 = 0:DeltaT:Tend;
x2 = sin(t2);
subplot(122)
stem(t2, x2, 'LineWidth',2);
hold on;
plot(t, x, 'LineWidth',2, 'LineStyle',':')
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

set(gca, 'FontSize', 18);

exportgraphics(f, '../figures/Discretize_Siganl.pdf');


f= figure;
f.Position = [ 810         819        458         419];
plot(t, x, 'LineWidth',2)
hold on;
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
set(gca, 'FontSize', 18);
exportgraphics(f, '../figures/Sine.pdf');


f= figure;
f.Position = [ 810         819        458         419];
stem(t2, x2, 'LineWidth',2);
hold on;
plot(t, x, 'LineWidth',2, 'LineStyle',':')
grid on;
grid minor;
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';

set(gca, 'FontSize', 18);

exportgraphics(f, '../figures/Discretize_Sine.pdf');