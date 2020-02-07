% Approximate the solution at the next time step using the FEM
function u = forward_euler_step(y, h, t, fcnHandle)
    u = y + h*fcnHandle(y, t);
end