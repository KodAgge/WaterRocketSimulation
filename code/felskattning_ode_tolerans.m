% Felskattningsfil 3 - ODE-tolerans

clear, close all, format long

% ----- Inställningar -----
intervall_uppdateringar = 8;
IP_metod = 'spline'; % Den interpolations metod griddedInterpolant använder
iter_per_var_start = 10; % Hur många punkter intervallen för alpha och fyllnadsgrad innehåller
mult_av_iter_per_var = 2; %Hur snabbt antalet punkter i intervallen för alpha och fyllnadsgrad 
% ökar vid varje iteration vid den tredimensionella interpolationen
systembyte = 1e-9; % Vid det X det byts till system 2

plotta_2D = false;
plotta_3D = false;
visa_IP_info = false;

potenser = 3:11;

% ----- Inputs -----
intervall_alpha_start = [3 4];
intervall_fyllnadsgrad_start = [0.2 0.3];
intervall_t = [0 10];
konstanter = hamta_varden(); % Hämtar nödvändiga värden

% ----- Körning -----
data = [];
for potens = potenser % Gör optimeringen för olika ode45_toleranser
    ode45_tolerans = 10^(-potens);
    opts = odeset('RelTol',ode45_tolerans);
    main;
    data = [data; ode45_tolerans max_alpha max_fyllnadsgrad max_hojd];
    disp([num2str((potens-potenser(1)+1)/length(potenser)*100) '% klart'])
end

% ----- Resultat -----
array2table(data,'VariableNames',{'RelTol','Alpha','Fyllnadsgrad','Hojd'})