function plotQuadrants()
    % Create a new figure
    fig= figure;
    fig.Position = [1000 554 800 684];
    % Plot the axes
    plot([-1 1], [0 0], 'k', 'LineWidth', 2); % x-axis
    hold on;
    plot([0 0], [-1 1], 'k', 'LineWidth', 2); % y-axis

    % Set the axis limits
    axis([-1 1 -1 1]);

    % Label the quadrants
    text(0.35, 0.5, {'++', 'Qudrant I'}, 'FontSize', 24, 'Interpreter', 'latex');
    text(-0.75, 0.5, {'-- + ','Qudrant II'}, 'FontSize', 24, 'Interpreter', 'latex');
    text(0.35, -0.5, {'+ --', 'Qudrant IV'}, 'FontSize', 24, 'Interpreter', 'latex');
    text(-0.75, -0.5, {'-- --', 'Qudrant III'}, 'FontSize', 24, 'Interpreter', 'latex');

    % Set the axis labels
    xlabel('X-axis', 'FontSize', 24, 'Interpreter', 'latex');
    ylabel('Y-axis', 'FontSize', 24, 'Interpreter', 'latex');

    % Save the figure
    axis off;
    
    exportgraphics(fig, sprintf('../figures/quadrants_plot.pdf'));

end
