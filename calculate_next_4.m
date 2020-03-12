function [u, r] = calculate_next_4(y, dy, dt, m, fcnHandle, tol)
    y_guess = adams_bashford_4(y, dy, dt, m, fcnHandle);
    u = adams_moulton_4(y(:,2), y_guess, dy, dt, m, fcnHandle);
    % Estimate for local truncation error
    frac = 0.9;
    lte = 1.0/6.0 * norm(y_guess-u, inf);
    % If the LTE exceeds some fraction of the tolerance, compute r to
    % adjust the step size
    if lte >= frac*tol
        r = power(frac*tol/lte, 1.0/3.0);
    else
        r = 1;
    end
end