% Select step sizes
h_1 = 0.05;
h_2 = 0.01;
h = [h_1, h_2];
% Select theta
theta = 1.0;
% Select tolerance for the Newton iterator
tol = 1e-5;
% Select maximum number of Newton iterations to perform
max_its = 1e3;
% Select initial and final times
t_0 = 0;
t_f = 1;
% Select initial conditions
y_1 = 1.0;
y_2 = 2.0;
y_0 = transpose([y_1, y_2]);
% Evolve and plot solutions
for i = 1:numel(h)
    % The function evolve_ode returns the desired solution at all times 
    % given the initial condition, start time, end time and step size
    y = evolve_ode(h(i), t_0, t_f, y_0, theta, tol, max_its);
    t = 0:h(i):t_f;
    figure;
    % Plot and format plot
    plot(t, y(1,:));
    hold on;
    plot(t, y(2,:));
    legend({'$y_1$','$y_2$'},'Interpreter', 'latex');
    ylim([0, 2]);
    ax = gca;
    ax.FontSize = 20;
    xlabel('$t$', 'Interpreter', 'latex');
    ylabel('$y$', 'Interpreter', 'latex');
    % set(gca, 'YTick', [0.0 0.5 1.0 1.5 2.0]);
    title('Numerical Evolution of $y$', 'Interpreter', 'latex');
end