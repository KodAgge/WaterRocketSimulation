% Felskattningsfil 2 - Intervalluppdateringar

clear, close all, format long

% ----- Inst�llningar -----
ode45_tolerans = 1e-8;
opts = odeset('RelTol',ode45_tolerans);
IP_metod = 'spline'; % Den interpolations metod griddedInterpolant anv�nder
iter_per_var_start = 10; % Hur m�nga punkter intervallen f�r alpha och fyllnadsgrad inneh�ller
mult_av_iter_per_var = 2; %Hur snabbt antalet punkter i intervallen f�r alpha och fyllnadsgrad 
% �kar vid varje iteration vid den tredimensionella interpolationen
systembyte = 1e-9; % Vid det X det byts till system 2

plotta_2D = false;
plotta_3D = false;
visa_IP_info = false;

antal_intervall_uppdateringar = 0:8;

% ----- Inputs -----
intervall_alpha_start = [3 4];
intervall_fyllnadsgrad_start = [0.2 0.3];
intervall_t = [0 10];
konstanter = hamta_varden(); % H�mtar n�dv�ndiga v�rden

% ----- K�rning -----
data = [];
for intervall_uppdateringar = antal_intervall_uppdateringar
    main;
    data = [data; intervall_uppdateringar max_alpha max_fyllnadsgrad max_hojd];
    disp([num2str((intervall_uppdateringar-antal_intervall_uppdateringar(1)+1)/(length(antal_intervall_uppdateringar))*100) '% klart'])
end
data(:,5) = [0; diff(data(:,4))];

% ----- Resultat -----
array2table(data,'VariableNames',{'Intervall_uppdateringar','Alpha','Fyllnadsgrad','Hojd','Hojd_skillnad'})