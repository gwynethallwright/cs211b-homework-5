% Function to calculate the derivative of y for the fourth problem
function u = f_4(y, dx, m)
    A = zeros(m, m);
    for i = 2:m
        A(i,i) = 1;
        A(i,i-1) = -1;
    end
    u = -1/dx * A * y;
end