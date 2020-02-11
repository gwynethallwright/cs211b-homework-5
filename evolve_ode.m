function [y, t] = evolve_ode(h, t_0, t_f, y_0, y_1, fcnHandle, tol)
    % Array to store solution
    % Note: we overestimate the array size
    y = nan(2, 1e3);
    % Array to store points at which solution is sampled
    t = nan(1, 1e3);
    % Add initial values
    y(:,1) = y_0;
    y(:,2) = y_1;
    t(1) = t_0;
    t(2) = t_0 + h;
    % Keep track of index in array
    i = 3;
    t_current = t_0;
    while t_current < t_f
        % The function calculate_next_theta returns the desired solution at  
        % the next time step using AB as the predictor and AM as the
        % corrector
        [y(:,i), r] = calculate_next(y(:,i-2:i-1), h, t(i-1), fcnHandle, tol);
        if r == 1
            t(i) = t(i-1) + h;
            t_current = t_current + h;
            i = i+1;
        end
        h = r*h;
    end
    y = y(:,~isnan(t));
    t = t(~isnan(t));
end