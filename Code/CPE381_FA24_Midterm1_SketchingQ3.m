
% Define the time vector
t = -6:0.01:6;

% Define the Heaviside step function
u = @(t) heaviside(t);

% Define the function y(t)
y = u(t)-u(-t);

% Create the plot
fig = figure;
fig.Position =[995         779        1219         447];

         
plot(t, y, 'LineWidth', 2);
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$y(t)$', 'Interpreter', 'latex');
ylim([-2,2]);
title('Q4.2 (1)', 'Interpreter', 'latex');

% Set the font size of the axes
set(gca, 'FontSize', 24);

grid on;
grid minor;
% Save the figure as a PDF
exportgraphics(fig, '../figures/CPE381_FA24_Midterm1_SketchingQ3.pdf');