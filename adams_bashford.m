% t refers to the time at the earliest point we consider
function u = adams_bashford(y_0, h, t)
    u = y_0(:,2) + 1.5*h*f(y_0(:,2), t+h) - 0.5*h*f(y_0(:,1), t);
end