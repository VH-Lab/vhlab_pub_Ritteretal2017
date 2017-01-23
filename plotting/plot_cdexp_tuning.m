function plot_cdexp_tuning(cdexp)

%
%
%
%
%
%
%
%


angles = [0 30 60 90 120 150 180 210 240 270 300 330];

figure();

subplot(1,4,1); % CD1
hold on;

plot(angles,cdexp.CD1.resps.normresps_aligned_all);
errorbar(angles,cdexp.CD1.resps.normresps_aligned_avg, ...
    cdexp.CD1.resps.normresps_aligned_ste,'b','LineWidth',3);

axis([0 330 0 1]);
xlabel('Direction (Degrees)','FontSize',14);
ylabel('Normalized/Aligned Response','FontSize',14);
title(['0 Hours, Num Cells: ' int2str(cdexp.CD1.other.numcells)]);

subplot(1,4,2); % CD2
hold on;

plot(angles,cdexp.CD2.resps.normresps_aligned_all);
errorbar(angles,cdexp.CD2.resps.normresps_aligned_avg, ...
    cdexp.CD2.resps.normresps_aligned_ste,'b','LineWidth',3);

axis([0 330 0 1]);
title(['3 Hours, Num Cells: ' int2str(cdexp.CD2.other.numcells)]);

subplot(1,4,3); % CD3
hold on;

plot(angles,cdexp.CD3.resps.normresps_aligned_all);
errorbar(angles,cdexp.CD3.resps.normresps_aligned_avg, ...
    cdexp.CD3.resps.normresps_aligned_ste,'b','LineWidth',3);

axis([0 330 0 1]);
title(['6 Hours, Num Cells: ' int2str(cdexp.CD3.other.numcells)]);

subplot(1,4,4); % CD4
hold on;

plot(angles,cdexp.CD4.resps.normresps_aligned_all);
errorbar(angles,cdexp.CD4.resps.normresps_aligned_avg, ...
    cdexp.CD4.resps.normresps_aligned_ste,'b','LineWidth',3);

axis([0 330 0 1]);
title(['9 Hours, Num Cells: ' int2str(cdexp.CD4.other.numcells)]);

suptitle(['Exp: ' cdexp.expid]);


