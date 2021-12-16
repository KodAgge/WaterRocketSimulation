% K�rningsfilen
tic
clear, close all, format long

% ----- Inst�llningar -----
ode45_tolerans = 1e-8;
opts = odeset('RelTol',ode45_tolerans);
intervall_uppdateringar = 8;
IP_metod = 'spline'; % Den interpolationsmetod griddedInterpolant anv�nder
iter_per_var_start = 10; % Hur m�nga punkter intervallen f�r alpha och fyllnadsgrad inneh�ller
mult_av_iter_per_var = 2; %Hur snabbt antalet punkter i intervallen f�r alpha och fyllnadsgrad 
% �kar vid varje iteration vid den tredimensionella interpolationen
systembyte = 1e-9; % Vid det X det byts till system 2

plotta_2D = false;
plotta_3D = true;
visa_IP_info = true;

% ----- Inputs -----
intervall_alpha_start = [3 4];
intervall_fyllnadsgrad_start = [0.2 0.3];
intervall_t = [0 10];
konstanter = hamta_varden(); % H�mtar n�dv�ndiga v�rden

% ----- K�rning -----
main; % K�r huvudfilen
toc