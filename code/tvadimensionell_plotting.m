table(senaste_max_alpha,senaste_max_fyllnadsgrad,senaste_max_hojd,'VariableNames',{'Alpha','Fyllnadsgrad','Hojd'})
% Presenterar resultatet p� tabellform

figure(2)

% ----- Ploting av vattenniv�n i flaskan -----
t_efter_vatten_slut = find(uut(:,1) < 1e-9);
t_vatten_slut = tut(t_efter_vatten_slut(1));
% Vattnet tar aldrig slut d� vi satt att programmet ska byta system
% d� X < 1e-9

subplot(1,2,1)
% G�r grafen snygg
xlim([0 t_vatten_slut*1.1])
title('Vattenniv�')
ylabel('X(t) [m]')
xlabel('t [s]')
grid on
hold on
area(tut,uut(:,1))

% ----- Animering av raketens flygtur -----
Z = @(x) spline(tut,uut(:,3),x);
% Anv�nder spline f�r att kunna f� j�mna steg mellan punkterna

antal_steg = 150;
t_efter_nedslag = find(uut(:,3) < 0);
t_nedslag = tut(t_efter_nedslag(1));
t = linspace(0,t_nedslag,antal_steg);

subplot(1,2,2)
% G�r grafen snygg
xlim([0 ceil(t_nedslag)])
ylim([0 ceil(senaste_max_hojd/10)*10])
title('Raketh�jd')
ylabel('Z(t) [m]')
xlabel('t [s]')
grid on
hold on

%Sj�lva animationen
for i = 1:antal_steg-1
    plot(t(i),Z(t(i)),'k.')
    drawnow
    pause(t(i+1)-t(i))
end