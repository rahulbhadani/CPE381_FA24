
% Define the time vector with a step of 0.01
t = 0:0.01:20;

% Initialize the function values
f = zeros(size(t));

% Define the piecewise function
for i = 1:length(t)
    if t(i) > 0 && t(i) <= 4
        f(i) = 2;
    elseif t(i) > 4 && t(i) <= 6
        f(i) = t(i);
    elseif t(i) > 6
        f(i) = -4;
    end
end

% Create the plot
fig = figure;
fig.Position= [421         632        1139         606];
plot(t, f, 'LineWidth', 2);
xlabel('t', 'FontSize', 24, 'Interpreter', 'latex');
ylabel('f(t)', 'FontSize', 24, 'Interpreter', 'latex');
title('HW02 Q6 CPE381 FA24', 'FontSize', 24, 'Interpreter', 'latex');
grid on;
 axis equal
set(gca, 'FontSize', 16);
% Save the figure
exportgraphics(fig, '../figures/HW02_Q6_CPE381_FA24.pdf');

%% Alternatively

% Define the time vector with a step of 0.01
t = 0:0.01:20;

% Define the piecewise function using Heaviside and ramp functions
f = 2 * (heaviside(t) - heaviside(t - 4)) + (t) .* (heaviside(t - 4) - heaviside(t - 6)) - 4 * heaviside(t - 6);

% Create the plot
fig = figure;
fig.Position = [421, 632, 1139, 606];
plot(t, f, 'LineWidth', 2);
xlabel('t', 'FontSize', 24, 'Interpreter', 'latex');
ylabel('f(t)', 'FontSize', 24, 'Interpreter', 'latex');
title('HW02 Q6 CPE381 FA24', 'FontSize', 24, 'Interpreter', 'latex');
grid on;
axis equal;
set(gca, 'FontSize', 16);

% Save the figure
exportgraphics(fig, '../figures/HW02_Q6_CPE381_FA24.pdf');


