function u = calculate_next(y, h, t, fcnHandle)
    y_guess = adams_bashford(y, h, t, fcnHandle);
    u = adams_moulton(y(:,2), y_guess, h, t+h, fcnHandle);
end