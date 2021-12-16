% Värdesfilen

function [konstanter, konstanter_namn] = hamta_varden()

    % ----- Värden från uppgiften -----
    N = 10; % [] Starttryck 
    gamma = 7/5; %[] Cp/Cv
    pA = 100000; %[Pa] Lufttryck (100 KPa)
    g = 9.81; %[m/s^2] Tyngdaccelerationen
    L = 0.5; %[m] Flaskans längd
    L0 = 0.006; %[m] Flaskan tom
    Cf = 0.001; %[m^-1] Inre friktion i vattnet
    CDR = 0.01; %[] Motståndskoefficient
    CD = 1.2; %[] Förlust i utströmningen
    roh = 1000; %[kg/m^3] Vattnets densitet
    konstanter = [N gamma pA g L L0 Cf CDR CD roh];
    
    % Konstanternas namn som strängar
    konstanter_namn = {'N','gamma','pA','g','L','L0','Cf','CDR','CD','roh'};   
end