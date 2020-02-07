function u = calculate_next(y, h, t, fcnHandle)
    y_guess = adams_bashford(y, h, t, fcnHandle);
    u = adams_moulton(y, y_guess, h, t, fcnHandle);
end