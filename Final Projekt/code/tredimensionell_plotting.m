grid on
hold on

% Plottar höjderna som togs fram av ode45
[fyllnadsgrader_matris, alphan_matris] = meshgrid(fyllnadsgrader_last,alphan_last);
plot3(alphan_matris,fyllnadsgrader_matris,max_hojd_matris,'k.','markersize',2);

% Plottar den interpolerade ytan
surf(interpolerad_alpha_matris,interpolerad_fyllnadsgrad_matris,interpolerad_hojd_matris,'edgecolor','none')
colorbar

% Plottar den optimerade punkten
plot3(interpolerad_alpha_matris(index_max_hojd), interpolerad_fyllnadsgrad_matris(index_max_hojd), interpolerad_hojd_matris(index_max_hojd),'rx');

% Snyggar till figuren
xlabel('\alpha')
ylabel('Fyllnadsgrad')
zlabel('Höjd')
xlim([intervall_alpha(1),intervall_alpha(2)])
ylim([intervall_fyllnadsgrad(1),intervall_fyllnadsgrad(2)])