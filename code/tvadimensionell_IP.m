% Hittar max-värde för Z för varje kombination av alpha och
% fyllnadsgrad mha interpolation av grad 2
[utan_interpolation_ode45_max_hojd, index]= max(uut(:,3));
index_max = (index-1:index+1)'; % Tar fram index för de 
% punkter som ska användas för interpolation

c = polyfit(tut(index_max),uut(index_max,3),2); % IP grad 2
t_max = roots(polyder(c)); % Tar fram t vid max_hojd
max_hojd = max(polyval(c,t_max));