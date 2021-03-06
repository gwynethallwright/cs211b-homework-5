% Select initial step sizes
dt = 1e-3;
dy = 0.003;
% Select tolerance
tol = 1e-6;
% Select initial and final times
t_0 = 0;
t_f = 1;
% Grid of spatial points
x = 0:dy:1;
% Select initial condition for fourth problem
y_0 = transpose(exp(-10*x));
m = numel(x);
% Use FEM to get second initial condition for fourth problem
y_1 = forward_euler_step_4(y_0, dy, dt, m);
[y, t, steps] = evolve_ode_4(dy, dt, t_0, t_f, y_0, y_1, m, @f_4, tol);
t_grid = [0, 0.25, 0.5, 0.6, 0.8, 1.0];
y_grid = interp2(transpose(t), x, y, transpose(t_grid), x);
figure;
for i = 1:6
    plot(x, y_grid(:, i)); 
    hold on;
end
ax = gca;
ax.FontSize = 20;
legend({'$t=0$','$t=0.25$', '$t=0.5$', '$t=0.6$', '$t=0.8$', '$t=1.0$'},'Interpreter', 'latex');
xlabel('$x$', 'Interpreter', 'latex');
ylabel('$y$', 'Interpreter', 'latex');
title('Numerical Evolution of $y$', 'Interpreter', 'latex');
xlim([0, 1.5]);
figure;

plot(t, steps);
ax = gca;
ax.FontSize = 20;
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$h$', 'Interpreter', 'latex');
title('Step Size $h$ over Time $t$', 'Interpreter', 'latex');
xlim([0, 1]);
