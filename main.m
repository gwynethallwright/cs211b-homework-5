% Select initial step sizes
h = 0.01;
% Select tolerance
tol = 1e-5;
% Select initial and final times
t_0 = 0;
t_f = 1;
% Select initial condition
y_0 = transpose([1.0, 2.0]);
% Use FEM to get second initial condition
y_1 = forward_euler_step(y_0, h, t_0, @f_1);
% Evolve and plot solutions
for i = 1:numel(h)
    % The function evolve_ode returns the desired solution at all times 
    % given the initial condition, start time, end time and step size
    [y, t] = evolve_ode(h(i), t_0, t_f, y_0, y_1, @f_1, tol);
    y = y(:,~isnan(t));
    t = t(~isnan(t));
    figure;
    % Plot and format plot
    plot(t, y(1,:));
    hold on;
    plot(t, y(2,:));
    legend({'$y_1$','$y_2$'},'Interpreter', 'latex');
    ax = gca;
    ax.FontSize = 20;
    xlabel('$t$', 'Interpreter', 'latex');
    ylabel('$y$', 'Interpreter', 'latex');
    title('Numerical Evolution of $y$', 'Interpreter', 'latex');
end