% Select initial step sizes
h = 0.01;
% Select tolerance
tol = 1e-6;
% Select initial and final times
t_0 = 0;
t_f = 1;
t_f_2 = 100;
t_f_3 = 11;
% Select initial condition for first problem
y_0 = transpose([1.0, 2.0]);
% Use FEM to get second initial condition for first problem
y_1 = forward_euler_step(y_0, h, t_0, @f_1);
% Select initial condition for second problem
u_0 = transpose([10.0, 10.0]);
% Use FEM to get second initial condition for second problem
u_1 = forward_euler_step(u_0, h, t_0, @f_2);
% Select initial condition for third problem
w_0 = transpose([2.0, 0.0]);
% Use FEM to get second initial condition for third problem
w_1 = forward_euler_step(w_0, h, t_0, @f_3);
% Evolve and plot solutions
% The function evolve_ode returns the desired solution at all times 
% given the initial condition, start time, end time and initial step size
% % PROBLEM 1
% [y, t, steps] = evolve_ode(h, t_0, t_f, y_0, y_1, @f_1, tol);
% figure;
% plot(t, y(1,:));
% hold on;
% plot(t, y(2,:));
% legend({'$y_1$','$y_2$'},'Interpreter', 'latex');
% ax = gca;
% ax.FontSize = 20;
% xlabel('$t$', 'Interpreter', 'latex');
% ylabel('$y$', 'Interpreter', 'latex');
% title('Numerical Evolution of $y$', 'Interpreter', 'latex');
% xlim([0, 1]);
% % PROBLEM 2
% [u, t_2, steps] = evolve_ode(h, t_0, t_f_2, u_0, u_1, @f_2, tol);
% figure;
% plot(t_2, u(1,:));
% hold on;
% plot(t_2, u(2,:));
% legend({'$y_1$','$y_2$'},'Interpreter', 'latex');
% ax = gca;
% ax.FontSize = 20;
% xlabel('$t$', 'Interpreter', 'latex');
% ylabel('$y$', 'Interpreter', 'latex');
% title('Numerical Evolution of $y$', 'Interpreter', 'latex');
% xlim([0, 100]);
% figure;
% plot(u(1,:), (u(2,:)));
% ax = gca;
% ax.FontSize = 20;
% xlabel('$y_1$', 'Interpreter', 'latex');
% ylabel('$y_2$', 'Interpreter', 'latex');
% title('Numerical Evolution of $y$', 'Interpreter', 'latex');
% PROBLEM 3
[w, t_3, steps] = evolve_ode(h, t_0, t_f_3, w_0, w_1, @f_3, tol);
figure;
plot(t_3, w(1,:));
hold on;
plot(t_3, w(2,:));
legend({'$y_1$','$y_2$'},'Interpreter', 'latex');
ax = gca;
ax.FontSize = 20;
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$y$', 'Interpreter', 'latex');
title('Numerical Evolution of $y$', 'Interpreter', 'latex');
xlim([0, 11]);
figure;
plot(t_3, steps);
ax = gca;
ax.FontSize = 20;
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$h$', 'Interpreter', 'latex');
title('Step Size $h$ over Time $t$', 'Interpreter', 'latex');
xlim([0, 11]);