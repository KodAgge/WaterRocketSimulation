% Variabler som beh�vs nollst�llas vid varje iteration
senaste_ode45_max_hojd = 0;
max_hojd_matris = [];
    
i = 1; % H�ller koll p� vilket index nuvarande alpha har

for alpha = alphan
    j = 1; % H�ller koll p� vilket index nuvarande fyllnadsgrad har

    for fyllnadsgrad = fyllnadsgrader
        X0 = konstanter(5)*fyllnadsgrad; % L*fyllnadsgrad
        varden = [fyllnadsgrad alpha konstanter X0 systembyte];
        % Data som funktionen beh�ver

        f = @(t,u) systemet(t,u,varden);
        % Sparar funktionen som f

        u_start = zeros(4,1);
        u_start(1) = X0;
        % Startv�rden f�r [X X' Z Z']'
        % Alla �r noll f�rutom X

        % L�ser systemet av differentialekvationer f�r t = [0 10]
        [tut, uut] = ode45(f,intervall_t,u_start,opts);

        tvadimensionell_IP;
        
        max_hojd_matris(i,j) = max_hojd;

        if max_hojd > senaste_ode45_max_hojd
            % F�r att h�lla koll p� hur mycket inerpolationen bidrog med
            differens_interpolation_max_hojd = max_hojd - utan_interpolation_ode45_max_hojd;

            if plotta_2D % Ifall datan vill anv�ndas till plotting efter�t
                max_tut = tut;
                max_uut = uut;
            end

            senaste_ode45_max_hojd = max_hojd;
        end
        j = j + 1;
    end
    i = i + 1;
end    