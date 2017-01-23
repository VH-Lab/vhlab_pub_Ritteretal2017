function plot_tfcondition_age_speed(tfc_age)

%
%
%
%
%
%

% Test Calcs

dsi = (tfc_age.speed.site_pref_avg - tfc_age.speed.site_null_avg) ./ tfc_age.speed.site_pref_avg;

%


speeds = [25 20 16 12 8 6 4 2 1 0.5 0.25] ./ 0.08;

figure();

subplot(1,2,1); % Site Average
hold on;

errorbar(speeds,tfc_age.speed.site_pref_avg,tfc_age.speed.site_pref_ste,'g','LineWidth',3);
errorbar(speeds,tfc_age.speed.site_null_avg,tfc_age.speed.site_null_ste,'r','LineWidth',3);

errorbar(speeds,tfc_age.dir.mmm_site_avg,tfc_age.dir.mmm_site_ste,'b','LineWidth',2); % mmm DSI
plot(speeds,dsi,'b-','LineWidth',2);

hold off;
set(gca,'XScale','log');
axis([0 max(speeds) -0.1 1]);

numcells = tfc_age.other.numcells;
title(['Site Average, Num Cells: ' int2str(numcells)]);


subplot(1,2,2); % Exp Average
hold on;

errorbar(speeds,tfc_age.speed.exp_pref_avg,tfc_age.speed.exp_pref_ste,'g','LineWidth',3);
errorbar(speeds,tfc_age.speed.exp_null_avg,tfc_age.speed.exp_null_ste,'r','LineWidth',3);

hold off;
set(gca,'XScale','log');
axis([0 max(speeds) -0.1 1]);
title('Animal Average');




