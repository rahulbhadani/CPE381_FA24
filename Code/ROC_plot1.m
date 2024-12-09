% MATLAB script to depict ROC of X(s)

% Define the s-plane grid
sigma = -10:0.1:10; % Real part
omega = -10:0.1:10; % Imaginary part
[Sigma, Omega] = meshgrid(sigma, omega);

% Define the ROC strips (example: ROC between -5 < sigma < -2 and 2 < sigma < 5)
roc1 = (Sigma > -5) & (Sigma < -2);
roc2 = (Sigma > 2) & (Sigma < 5);

% Combine the ROC strips
ROC = roc1 | roc2;

% Plot the ROC
figure;
hold on;
imagesc(sigma, omega, ROC);
colormap([1 1 1; 0 0 1]); % White for outside ROC, Blue for inside ROC
xlabel('Real Part (\sigma)');
ylabel('Imaginary Part (j\Omega)');
title('Region of Convergence (ROC) of X(s)');
axis xy;
grid on;

% Plot the poles (example: no poles in the ROC)
poles = [-7 + 3i, -1 + 4i, 6 - 2i]; % Example poles
plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

legend('ROC', 'Poles');
hold off;
