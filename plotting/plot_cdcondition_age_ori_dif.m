function plot_cdcondition_age_ori_dif(cdc)

%
%
%
%
%


figure();

subplot(1,2,1);
hist(cdc.other.ori_dif_all);
xlabel('Degree Difference','FontSize',14);
ylabel('Number of Sites','FontSize',14);
total_sites = length(find(~isnan(cdc.other.ori_dif_all)));
title(['Total Sites: ' int2str(total_sites)],'FontSize',14);

subplot(1,2,2);
hold on;
[x,y] = cumhist(cdc.other.ori_dif_all,[0 90],1);
hold off;
plot(x,y,'LineWidth',3);
xlabel('Degree Difference','FontSize',14);
ylabel('Fraction of Sites','FontSize',14);
axis([0 90 0 100]);

