% Variabler som behövs nollställas vid varje iteration
senaste_ode45_max_hojd = 0;
max_hojd_matris = [];
    
i = 1; % Håller koll på vilket index nuvarande alpha har

for alpha = alphan
    j = 1; % Håller koll på vilket index nuvarande fyllnadsgrad har

    for fyllnadsgrad = fyllnadsgrader
        X0 = konstanter(5)*fyllnadsgrad; % L*fyllnadsgrad
        varden = [fyllnadsgrad alpha konstanter X0 systembyte];
        % Data som funktionen behöver

        f = @(t,u) systemet(t,u,varden);
        % Sparar funktionen som f

        u_start = zeros(4,1);
        u_start(1) = X0;
        % Startvärden för [X X' Z Z']'
        % Alla är noll förutom X

        % Löser systemet av differentialekvationer för t = [0 10]
        [tut, uut] = ode45(f,intervall_t,u_start,opts);

        tvadimensionell_IP;
        
        max_hojd_matris(i,j) = max_hojd;

        if max_hojd > senaste_ode45_max_hojd
            % För att hålla koll på hur mycket inerpolationen bidrog med
            differens_interpolation_max_hojd = max_hojd - utan_interpolation_ode45_max_hojd;

            if plotta_2D % Ifall datan vill användas till plotting efteråt
                max_tut = tut;
                max_uut = uut;
            end

            senaste_ode45_max_hojd = max_hojd;
        end
        j = j + 1;
    end
    i = i + 1;
end    