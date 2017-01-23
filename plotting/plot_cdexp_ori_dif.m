function plot_cdexp_ori_dif(cdexp)

%
%
%
%
%
%
%


figure();
hold on;

[x1,y1] = cumhist(cdexp.CD1.other.ori_dif_all,[0 90],1);
[x2,y2] = cumhist(cdexp.CD2.other.ori_dif_all,[0 90],1);
[x3,y3] = cumhist(cdexp.CD3.other.ori_dif_all,[0 90],1);
[x4,y4] = cumhist(cdexp.CD4.other.ori_dif_all,[0 90],1);

plot(x1,y1,'LineWidth',3);
plot(x2,y2,'LineWidth',3);
plot(x3,y3,'LineWidth',3);
plot(x4,y4,'LineWidth',3);

xlabel('Degree Difference','FontSize',14);
ylabel('Fraction of Sites','FontSize',14);
legend(' 0 Hours',' 3 Hours',' 6 Hours',' 9 Hours','Location','SE');
axis([0 90 0 100]);
