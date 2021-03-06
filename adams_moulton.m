% t refers to the time at the earliest point we consider
% This is one step further in time than for Bashford
function u = adams_moulton(y_0, y_guess, h, t, fcnHandle)
    u = y_0 + 0.5*h*(fcnHandle(y_guess, t+h) + fcnHandle(y_0, t));
end