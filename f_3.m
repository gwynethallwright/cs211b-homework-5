% Function to calculate the derivative of y for the third problem
function u = f_3(y, t)
    u = transpose([y(2), 2*((1-y(1)*y(1))*y(2) - y(1))]);
end