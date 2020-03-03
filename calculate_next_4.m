function [u, r] = calculate_next_4(y, dy, dt, m, fcnHandle, tol)
    y_guess = adams_bashford_4(y, dy, dt, m, fcnHandle);
    u = adams_moulton_4(y(:,2), y_guess, dy, dt, m, fcnHandle);
    % Estimate for local truncation error
    C = 1.0/12.0;
    frac = 0.9;
    lte = norm(C*power(dt, 3)*power(u, 3), inf);
    % If the LTE exceeds some fraction of the tolerance, compute r to
    % adjust the step size
    if lte >= frac*tol
        r = power(frac*tol/lte, 1.0/3.0);
    else
        r = 1;
    end
end