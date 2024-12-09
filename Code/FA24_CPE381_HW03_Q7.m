%% (C) Rahul Bhadani
t = -0.5:0.01:5;

%% Signal plotting without symbolic function

x1 = 5.*exp(-2.*t).*cos(8.*t).*heaviside(t);
fig = figure(1);
fig.Position =[995         779        1219         447];
plot(t, x1, "Color", "red", "LineStyle","-", "LineWidth", 3);
grid on;
grid minor;
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$x_1(t)$', 'Interpreter', 'latex');
title('HW03 Q7, Part 1: x_1(t) = 5e^{-2t}cos(8t)u(t)', 'Interpreter', 'latex');
% Set the font size of the axes
ylim([-7, 7])
set(gca, 'FontSize', 24);

%% We can also make a plot using symbolic function
syms t s
x1 = 5*exp(-2*t)*cos(8*t)*heaviside(t);
x2 = 5*exp(-4*t)*cos(8*t)*heaviside(t);

% Compute the Laplace transform
X1 = laplace(x1, t, s);

% Extract numerator and denominator polynomial
[num, den] = numden(X1);
num_coeffs = fliplr(coeffs(num, s)); % coeffs returns lowest order coefficient
denom_coeff = fliplr(coeffs(den, s));
z1=roots(num_coeffs); p1=roots(denom_coeff);

% Compute the Laplace transform
X2 = laplace(x2, t, s);
[num, den] = numden(X2);
num_coeffs = fliplr(coeffs(num, s)); % coeffs returns lowest order coefficient
denom_coeff = fliplr(coeffs(den, s));
z2=roots(num_coeffs); p2=roots(denom_coeff);

% Plot the signals
fig = figure(1);
fig.Position =[995         347        1219         879];

subplot(2,1,1);
ezplot(x1, [-0.5, 5]);
grid on;
grid minor;
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$x_1(t)$', 'Interpreter', 'latex');
title('HW03 Q7: $x_1(t) = 5e^{-2t}cos(8t)u(t)$', 'Interpreter', 'latex');
ylim([-7, 7]);
set(gca, 'FontSize', 24);

subplot(2,1,2);
ezplot(x2, [-0.5, 5]);
grid on;
grid minor;
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$x_2(t)$', 'Interpreter', 'latex');
title('HW03 Q7: $x_2(t) = 5e^{-4t}cos(8t)u(t)$', 'Interpreter', 'latex');
ylim([-7, 7]);
set(gca, 'FontSize', 24);
exportgraphics(fig, '../figures/HW03_Q7_Signal.pdf');


%%

% Plot the poles and zeros of the Laplace transform
f = figure(2);
plot(real(z1), imag(z1), 'b.', 'MarkerSize',90);
hold on;
plot(real(p1), imag(p1), 'bx', 'MarkerSize',15);
plot(real(z2), imag(z2), 'r.', 'MarkerSize',90);
plot(real(p2), imag(p2), 'rx', 'MarkerSize',15);
grid on;
grid minor;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
ylim([-10, 10]);
xlim([-6, 2]);
yaxis.TickLabelInterpreter = 'latex';
title('Poles and Zeros: blue for $x_1$, red for $x_2$', 'Interpreter', 'latex');
exportgraphics(f, '../figures/HW03_Q7_PZ.pdf');