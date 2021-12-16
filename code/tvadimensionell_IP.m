% Hittar max-v�rde f�r Z f�r varje kombination av alpha och
% fyllnadsgrad mha interpolation av grad 2
[utan_interpolation_ode45_max_hojd, index]= max(uut(:,3));
index_max = (index-1:index+1)'; % Tar fram index f�r de 
% punkter som ska anv�ndas f�r interpolation

c = polyfit(tut(index_max),uut(index_max,3),2); % IP grad 2
t_max = roots(polyder(c)); % Tar fram t vid max_hojd
max_hojd = max(polyval(c,t_max));