% Approximate the solution at the next time step using the FEM
function u = forward_euler_step_4(y, dx, dt, m)
    A = zeros(m, m);
    for i = 2:m
        A(i,i) = 1;
        A(i,i-1) = -1;
    end
    disp(size(A));
    disp(size(y));
    time_deriv = -1/dx * A * y;
    u = y + dt*time_deriv;
end