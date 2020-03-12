function [u, r] = calculate_next(y, h, t, fcnHandle, tol)
    y_guess = adams_bashford(y, h, t, fcnHandle);
    u = adams_moulton(y(:,2), y_guess, h, t+h, fcnHandle);
    % Estimate for local truncation error
    C = 1.0/12.0;
    frac = 0.9;
    % lte = norm(C*power(h, 3)*power(u, 3), inf);
    lte = 1.0/6.0 * norm(y_guess-u, inf);
    % If the LTE exceeds some fraction of the tolerance, compute r to
    % adjust the step size
    if lte >= frac*tol
        r = power(frac*tol/lte, 1.0/3.0);
    else
        r = 1;
    end
end