
% Define the time vector
t = -16:0.01:4;

% Define the Heaviside step function
r = @(t) t.*heaviside(t);

% Define the function y(t)
y = r(-t);

% Create the plot
fig = figure;
fig.Position =[995         779        1219         447];

         
plot(t, y, 'LineWidth', 2);
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$y(t)$', 'Interpreter', 'latex');
ylim([-2,20]);
xlim([-16,4]);
title('Q4.2 (2)', 'Interpreter', 'latex');

% Set the font size of the axes
set(gca, 'FontSize', 24);

grid on;
grid minor;

% Save the figure as a PDF
exportgraphics(fig, '../figures/CPE381_FA24_Midterm1_SketchingQ4.pdf');