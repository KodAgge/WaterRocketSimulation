% Huvudfilen

% ----- Intervaller -----
intervall_alpha = intervall_alpha_start;
intervall_fyllnadsgrad = intervall_fyllnadsgrad_start;
intervall_t = [0 10];

% ----- Beräkningen ----- 
for uppdatering = 0:intervall_uppdateringar 
    intervall_halvering;
    diff_med_IP;
    tredimensionell_IP;
    if visa_IP_info        
        IP_info;
    end
end

% ---- Plotting ----
if plotta_3D
    tredimensionell_plotting;
end
if plotta_2D
    tvadimensionell_plotting;
end

% ----- Variabelbyte -----
max_alpha = senaste_max_alpha;
max_fyllnadsgrad = senaste_max_fyllnadsgrad;
max_hojd = senaste_max_hojd;