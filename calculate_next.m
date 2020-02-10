function [u, r] = calculate_next(y, h, t, fcnHandle, tol)
    y_guess = adams_bashford(y, h, t, fcnHandle);
    u = adams_moulton(y(:,2), y_guess, h, t+h, fcnHandle);
    % Estimate for local truncation error
    C = 1.0/12.0;
    lte = norm(C*power(h, 3)*power(u, 3), inf);
    r = power(0.9*tol/lte, 1/3);
    disp(r);
end