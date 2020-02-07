% t refers to the time at the earliest point we consider
function u = adams_moulton(y_0, y_guess, h, t, fcnHandle)
    u = y_0 + 0.5*h*f(y_guess, t+h) + fcnHandle(y_0, t);
end