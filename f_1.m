% Function to calculate the derivative of y for the first problem
function u = f_1(y, t)
    u = transpose([-y(1), -10*(y(2) - t*t) + 2*t*t]);
end