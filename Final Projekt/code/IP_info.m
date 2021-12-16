% Printar info angående resultatet av de två interpolationerna
disp(['Uppdatering ', num2str(uppdatering),' klar'])
disp(['Interpolation gav ', num2str(differens_interpolation_max_hojd),' m extra'])
disp(['3D interpolation gav ', num2str(senaste_max_hojd - senaste_ode45_max_hojd),' m extra'])
disp(['Totalt sett gav interpolation ', num2str(differens_interpolation_max_hojd + senaste_max_hojd - senaste_ode45_max_hojd),' m extra'])
disp('----------------------------------------------')