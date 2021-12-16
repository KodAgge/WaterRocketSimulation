if uppdatering > 0 % Halverar intervalllängden och centrerar kring
    % senaste optimeringen        
    mitten_alpha = senaste_max_alpha;
    spridning_alpha = (intervall_alpha(2) - intervall_alpha(1))/4;
    % Delar med fyra för att halvera intervallet
    intervall_alpha = [mitten_alpha - spridning_alpha mitten_alpha + spridning_alpha];

    mitten_fyllnadsgrad = senaste_max_fyllnadsgrad;
    spridning_fyllnadsgrad = (intervall_fyllnadsgrad(2)-intervall_fyllnadsgrad(1))/4;
    intervall_fyllnadsgrad = [mitten_fyllnadsgrad-spridning_fyllnadsgrad mitten_fyllnadsgrad+spridning_fyllnadsgrad]; 
end

iter_per_var = iter_per_var_start; 
    
alphan = linspace(intervall_alpha(1),intervall_alpha(2),iter_per_var);
fyllnadsgrader = linspace(intervall_fyllnadsgrad(1),intervall_fyllnadsgrad(2),iter_per_var);
