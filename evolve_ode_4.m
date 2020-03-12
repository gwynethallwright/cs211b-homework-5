function [y, t, steps] = evolve_ode_4(dy, dt, t_0, t_f, y_0, y_1, m, fcnHandle, tol)
    % Matrix to store solution
    % Note: we overestimate the matrix size
    y = nan(m, 1e3);
    % Array to store points at which solution is sampled
    t = nan(1, 1e3);
    % Array to store step sizes
    steps = nan(1, 1e3);
    % Add initial values
    y(:,1) = y_0;
    y(:,2) = y_1;
    t(1) = t_0;
    t(2) = t_0 + dt;
    steps(1) = dt;
    steps(2) = dt;
    % Keep track of index in array
    i = 3;
    t_current = t_0;
    while t_current < t_f
        % The function calculate_next_theta returns the desired solution at  
        % the next time step using AB as the predictor and AM as the
        % corrector
        [y(:,i), r, redo] = calculate_next_4(y(:,i-2:i-1), dy, dt, m, fcnHandle, tol);
        if redo == 0
            t(i) = t(i-1) + dt;
            t_current = t_current + dt;
            steps(i) = dt;
            i = i+1;
        end
        dt = r*dt;
    end
    y = y(:,~isnan(t));
    t = t(~isnan(t));
    steps = steps(~isnan(steps));
end