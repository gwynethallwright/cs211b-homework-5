function y = evolve_ode(h, t_0, t_f, y_0, theta, tol, max_its)
    n_steps = (t_f-t_0)/h;
    y = zeros(2, n_steps+1);
    y(:,1) = y_0;
    for i = 2:n_steps+1
        % The function calculate_next_theta returns the desired solution at  
        % the next time step using the theta method 
        % It is a predictor-corrector method, so it first calls the 
        % Newton iterator to approximate the solution at the next step, 
        % after which it uses the theta method to correct the solution
        y(:,i) = calculate_next_theta(y(:,i-1), h, t_0+i*h, theta, tol, max_its);
    end
end