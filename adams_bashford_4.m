% t refers to the time at the earliest point we consider
function u = adams_bashford_4(y_0, dy, dt, m, fcnHandle)
    u = y_0(:,2) + 1.5*dt*fcnHandle(y_0(:,2), dy, m) - 0.5*dt*fcnHandle(y_0(:,1), dy, m);
end