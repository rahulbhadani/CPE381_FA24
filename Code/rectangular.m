% Define the time vector
t = linspace(-1, 1, 1000);

% Define the rectangular pulse
p = 2 * (t >= -0.5 & t <= 0.5);

% Plot the rectangular pulse
fig = figure;
plot(t, p, 'LineWidth', 2);
grid minor;

% Set labels and title
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('$p(t)$', 'Interpreter', 'latex', 'FontSize', 24);
%title('Rectangular Pulse', 'Interpreter', 'latex', 'FontSize', 24);

% Set the axes limits
ylim([-0.5 2.5]);
set(gca,"FontSize",20);
ax = gca;

% Manually plot the thicker x and y axes
ax = gca;
line([-1 1], [0 0], 'Color', [0.5 0.5 0.5], 'LineWidth', 1); % Thicker x-axis
line([0 0], [-0.5 2.5], 'Color',[0.5 0.5 0.5], 'LineWidth', 1); % Thicker y-axis
exportgraphics(fig, sprintf('../figures/rectangular.png'));
