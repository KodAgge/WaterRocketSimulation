alphan_last = alphan; % Sparar sista alpha och fyllnadsgrad
% innan tredimensionell interpolation
fyllnadsgrader_last = fyllnadsgrader; % last ska vara låst

[interpolerad_alpha_matris,interpolerad_fyllnadsgrad_matris] = ndgrid(alphan,fyllnadsgrader);
% Gör om alphan och fyllnadsgrader till matriser där den första har
% alphan som kolumner och den andra fyllnadsgrader som rader
interpolerad_matris = griddedInterpolant(interpolerad_alpha_matris,interpolerad_fyllnadsgrad_matris,max_hojd_matris,IP_metod);
% Använder de matriser som togs fram med ndgrid och de beräknade max 
% höjderna till att genomföra den tredimensionella interpolationen

% När intervallen blir mindre och ode45toleransen lägre klarar datorn
% av en lägre interpolationstolerans utan att ram-minnet tar slut
if uppdatering == 0 || ode45_tolerans > 1e-5
    IP_tolerans = 0.5e-3;
elseif uppdatering > 0
    IP_tolerans = 0.5e-4;
elseif uppdatering > 2
    IP_tolerans = 0.5e-5;
elseif uppdatering > 5
    IP_tolerans = 0.5e-6;
end

% Dummies
interpolations_fel = 100;
senaste_max_alpha = 100;
senaste_max_fyllnadsgrad = 100;

% ---- Tredimensionell interpolation ----
while norm(interpolations_fel) > IP_tolerans
    % Uppdatering av alphan och fyllnadsgrader med tätare intervall
    iter_per_var = iter_per_var * mult_av_iter_per_var;
    fyllnadsgrader = linspace(intervall_fyllnadsgrad(1),intervall_fyllnadsgrad(2),iter_per_var); 
    alphan = linspace(intervall_alpha(1),intervall_alpha(2),iter_per_var);

    % Tar fram en matris med interpolerade höjder utifrån större
    % matriser med tätare element av alpha och fyllnadsgrad
    [interpolerad_alpha_matris,interpolerad_fyllnadsgrad_matris] = ndgrid(alphan,fyllnadsgrader);
    interpolerad_hojd_matris = interpolerad_matris(interpolerad_alpha_matris,interpolerad_fyllnadsgrad_matris);

    % Hittar den interpolerade max höjden och det alpha och
    % fyllnadsgrad som tillhör
    [interpolerad_max_hojd, index_max_hojd] = max(interpolerad_hojd_matris(:));
    interpolerad_max_alpha = interpolerad_alpha_matris(index_max_hojd);
    interpolerad_max_fyllnadsgrad = interpolerad_fyllnadsgrad_matris(index_max_hojd);

    % Beräkning av felvektorn
    interpolations_fel = [interpolerad_max_alpha interpolerad_max_fyllnadsgrad]' - ...
        [senaste_max_alpha senaste_max_fyllnadsgrad]';

    % Sparar värdena för att kunna beräkna felet
    senaste_max_hojd = interpolerad_max_hojd;
    senaste_max_alpha = interpolerad_max_alpha;
    senaste_max_fyllnadsgrad = interpolerad_max_fyllnadsgrad;

end    