% Felskattningfil 1 - Konstanter

clear, close all, format long

% ----- Inställningar -----
ode45_tolerans = 1e-8;
opts = odeset('RelTol',ode45_tolerans);
intervall_uppdateringar = 8;
IP_metod = 'spline'; % Den interpolations metod griddedInterpolant använder
iter_per_var_start = 10; % Hur många punkter intervallen för alpha och fyllnadsgrad innehåller
mult_av_iter_per_var = 2; %Hur snabbt antalet punkter i intervallen för alpha och fyllnadsgrad 
% ökar vid varje iteration vid den tredimensionella interpolationen
systembyte = 1e-9; % Vid det X det byts till system 2

plotta_2D = false;
plotta_3D = false;
visa_IP_info = false;

fel_procent = 0.01; % En-procentig förändring

% ----- Inputs -----
intervall_alpha_start = [3 4];
intervall_fyllnadsgrad_start = [0.2 0.3];
[konstanter_start, variabel_namn] = hamta_varden(); % Hämtar nödvändiga värden
konstanter = konstanter_start;
variabel_namn(11) = {'Total'};

% ----- Körning -----
main % Gör en vanlig beräkning för att ha som referens
referens = [max_alpha, max_fyllnadsgrad, max_hojd];
disp([num2str(100/(length(konstanter)+1)) '% klart'])

data = [];
for iter = 1:length(konstanter) % Genomför optimeringen för varje störd konstant
    konstanter = konstanter_start;
    konstanter(iter) = konstanter(iter) * (1+fel_procent);
    main;
    data = [data; abs(max_alpha/referens(1)-1), abs(max_fyllnadsgrad/referens(2)-1), abs(max_hojd/referens(3)-1)];    
    disp([num2str(100*(iter+1)/(length(konstanter)+1)) '% klart'])
end
data(11,:) = sum(data);

% ----- Resultat -----
table(referens(1),referens(2),referens(3),'VariableNames',{'Alpha','Fyllnadsgrad','Hojd'})
table(variabel_namn',100*data(:,1),100*data(:,2),100*data(:,3),'VariableNames',{'Variabel','Alpha_avvikelse','Fyllnadsgrad_avvikelse','Hojd_avvikelse'})