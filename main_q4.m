% Select initial step sizes
dt = 0.01;
dy = 0.01;
% Select tolerance
tol = 1e-6;
% Select initial and final times
t_0 = 0;
t_f = 1;
% Grid of spatial points
x = 0:dy:1;
% Select initial condition for fourth problem
y_0 = transpose(exp(-x));
m = numel(x);
% Use FEM to get second initial condition for first problem
y_1 = forward_euler_step_4(y_0, dy, dt, m);
