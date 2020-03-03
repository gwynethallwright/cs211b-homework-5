% t refers to the time at the earliest point we consider
% This is one step further in time than for Bashford
function u = adams_moulton_4(y_0, y_guess, dy, dt, m, fcnHandle)
    u = y_0 + 0.5*dt*(fcnHandle(y_guess, dy, m) + fcnHandle(y_0, dy, m));
end