function [u, r, redo] = calculate_next(y, h, t, fcnHandle, tol)
    y_guess = adams_bashford(y, h, t, fcnHandle);
    u = adams_moulton(y(:,2), y_guess, h, t+h, fcnHandle);
    % Estimate for local truncation error
    frac = 0.9;
    lte = 1.0/6.0 * norm(y_guess-u, inf);
    % If the LTE exceeds some fraction of the tolerance, compute r to
    % adjust the step size
    r = power(frac*tol/lte, 1.0/3.0);
    if lte >= frac*tol
        % We do not accept this step
        redo = 1;
    else
        % We accept this step
        redo = 0;
    end
end