% Define the ramp function
r = @(t) max(0, t);

% Define the piecewise function Lambda(t)

Lambda_0 = @(t) r(t-2);

Lambda_1 = @(t) r(t-1);

Lambda_2 = @(t) -r(t-1) + r(t-2);

% Define the time vector
t = linspace(-3, 3, 1000);

% Evaluate Lambda(t) over the time vector
Lambda_t0 = arrayfun(Lambda_0, t);

% Plot the function
figure;
plot(t, Lambda_t0, 'LineWidth', 2);
hold on;

% Evaluate Lambda(t) over the time vector
Lambda_t1 = arrayfun(Lambda_1, t);

% Evaluate Lambda(t) over the time vector
Lambda_t2 = arrayfun(Lambda_2, t);

% Plot the function
plot(t, Lambda_t1, 'LineWidth', 2);

plot(t, Lambda_t0 - Lambda_t1, 'LineWidth', 2);

plot(t, Lambda_t2, 'LineWidth', 4);

xlabel('t');
ylabel('\Lambda(t)');
title('\Lambda(t) = r(t) - r(t-1)');
grid on;


%%
% Define the ramp function
r = @(t) max(0, t);

% Define the piecewise function Lambda(t)
Lambda = @(t) r(t) - r(t-1) ;

% Define the time vector
t = linspace(-6, 7, 1000);

% Evaluate Lambda(t) over the time vector
Lambda_t = arrayfun(Lambda, t);

% Plot the function
fig = figure;
fig.Position = [ 995   579   763   647];
plot(t, Lambda_t, 'LineWidth', 6, 'DisplayName','r(t) - r(t-1)');
xlabel('t');
ylabel('\Lambda(t)');
hold on;
% Define the piecewise function Lambda(t)
Lambda = @(t) r(t-2) - r(t-1) ;

% Define the time vector
t = linspace(-6, 7, 1000);

% Evaluate Lambda(t) over the time vector
Lambda_t = arrayfun(Lambda, t);

plot(t, Lambda_t, 'LineWidth', 2, 'DisplayName','r(t-2) - r(t-1)');
grid on;
%title('\Lambda(t) = r(t-2) - r(t-1)');
legend;
set(gca,"FontSize",20);
ylim([-2,2])
xlim([-3,3])
exportgraphics(fig, sprintf('../figures/lambda_1_2.png'));
