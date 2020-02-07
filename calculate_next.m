function u = calculate_next(y, h, t)
    y_guess = adams_bashford(y, h, t);
    u = adams_moulton(y, y_guess, h, t);
end