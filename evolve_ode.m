function y = evolve_ode(h, t_0, t_f, y_0, y_1, fcnHandle, tol)
    n_steps = (t_f-t_0)/h;
    y = zeros(2, n_steps+1);
    y(:,1) = y_0;
    y(:,2) = y_1;
    for i = 3:n_steps+1
        % The function calculate_next_theta returns the desired solution at  
        % the next time step using the theta method 
        % It is a predictor-corrector method, so it first calls the 
        % Newton iterator to approximate the solution at the next step, 
        % after which it uses the theta method to correct the solution
        [y(:,i), r] = calculate_next(y(:,i-2:i-1), h, t_0+i*h, fcnHandle, tol);
    end
end