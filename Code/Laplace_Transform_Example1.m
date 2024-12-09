syms a t s
f = exp(-a*t);
F = laplace(f, t, s);

% Display the Laplace transform
disp('Laplace Transform:');
disp(F);

% Extract the pole from the Laplace transform
[~, poles] = numden(F);
poles = solve(poles, s)


%%
syms t s
syms a positive
F = laplace(dirac(t-a),t,s)
G = laplace(heaviside(t-a),t,s)

%%
syms f1(x) f2(x) a b
f1(x) = exp(x);
f2(x) = x;
F = laplace([f1 f2],x,[a b])

%%
syms s
F = 1/s^2;
f = ilaplace(F)

%%
syms s t
f1 = ilaplace(1,s,t)

F = exp(-2*s)/(s^2+1);
f2 = ilaplace(F,s,t)

%%
syms t positive % t >= 0
f(t) = heaviside(t);
g(t) = exp(-t);
F = laplace(f);
G = laplace(g);
h = ilaplace(F*G)


%%
numerator = 1;
denominator = [2,3,4];
sys = tf(numerator,denominator)


%%
numerator = [1 6 7];
denominator = [1 3 2];
sys = tf(numerator,denominator)
z = roots(numerator) % zeros
p = roots(denominator) % poles
f = figure(1);
plot(real(z), imag(z), 'b.', 'MarkerSize',90);
hold on;
plot(real(p), imag(p), 'rx', 'MarkerSize',15);
grid on;
grid minor;
set(gca, 'FontSize', 16);
set(gca, 'XColor', [0, 0, 0], 'YColor', [0, 0, 0], 'TickDir', 'out');
xaxis = get(gca, 'XAxis');
xaxis.TickLabelInterpreter = 'latex';
yaxis = get(gca, 'YAxis');
yaxis.TickLabelInterpreter = 'latex';
exportgraphics(f, '../figures/ch3_laplace.png');







