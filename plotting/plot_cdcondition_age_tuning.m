function plot_cdcondition_age_tuning(cdc)

%
%
%
%
%
%
%



angles = [0 30 60 90 120 150 180 210 240 270 300 330];

figure();

subplot(1,2,1); % sites all and average
hold on;

plot(angles,cdc.resps.normresps_aligned_site_all);
errorbar(angles,cdc.resps.normresps_aligned_site_avg, ...
    cdc.resps.normresps_aligned_site_ste,'b','LineWidth',3);

hold off;
axis([0 330 0 1]);
xlabel('Angle','FontSize',14);
ylabel('Normalized Response','FontSize',14);
title('Sites and Site Average','FontSize',14);

subplot(1,2,2);
hold on;

plot(angles,cdc.resps.normresps_aligned_pen_avgs);
errorbar(angles,cdc.resps.normresps_aligned_pen_avg, ...
    cdc.resps.normresps_aligned_pen_ste,'b','LineWidth',3);

hold off;
axis([0 330 0 1]);
xlabel('Angle','FontSize',14);
ylabel('Normalized Response','FontSize',14);
title('Penetration Averages','FontSize',14);







