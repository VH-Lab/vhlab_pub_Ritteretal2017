function plot_tfexp_age_speed(tfexp_age)

%
%
%
%
%



speeds = [25 20 16 12 8 6 4 2 1 0.5 0.25] ./ 0.08;

figure();

subplot(1,2,1); % Site Average
hold on;

errorbar(speeds,tfexp_age.speed.site_pref_avg,tfexp_age.speed.site_pref_ste,'g','LineWidth',3);
errorbar(speeds,tfexp_age.speed.site_null_avg,tfexp_age.speed.site_null_ste,'r','LineWidth',3);

hold off;
set(gca,'XScale','log');
axis([0 max(speeds) -0.1 1]);
axis square;

numcells = tfexp_age.other.numcells;
title(['Site Average, Num Cells: ' int2str(numcells)]);

subplot(1,2,2); % Pen Average
hold on;

errorbar(speeds,tfexp_age.speed.pen_pref_avg,tfexp_age.speed.pen_pref_ste,'g','LineWidth',3);
errorbar(speeds,tfexp_age.speed.pen_null_avg,tfexp_age.speed.pen_null_ste,'r','LineWidth',3);

hold off;
set(gca,'XScale','log');
axis([0 max(speeds) -0.1 1]);
axis square;
title('Penetration Average');


