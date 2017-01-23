function plot_cdcondition_ori_dif(cdc)

%
%
%
%
%
%
%

figure(); % Condition
hold on;

[x1,y1] = cumhist(cdc.CD1.other.ori_dif_all,[0 90],1);
[x2,y2] = cumhist(cdc.CD2.other.ori_dif_all,[0 90],1);
[x3,y3] = cumhist(cdc.CD3.other.ori_dif_all,[0 90],1);
[x4,y4] = cumhist(cdc.CD4.other.ori_dif_all,[0 90],1);

plot(x1,y1,'LineWidth',3);
plot(x2,y2,'LineWidth',3);
plot(x3,y3,'LineWidth',3);
plot(x4,y4,'LineWidth',3);

xlabel('Degree Difference','FontSize',14);
ylabel('Fraction of Sites','FontSize',14);
legend(' 0 Hours',' 3 Hours',' 6 Hours',' 9 Hours','Location','SE');
axis([0 90 0 100]);

figure(); % Indiv Exps

numexps = length(cdc.exps);

for i = 1:numexps,
    
    subplot(1,numexps,i)
    hold on;
    
    [x1,y1] = cumhist(cdc.exps(i).CD1.other.ori_dif_all,[0 90],1);
    [x2,y2] = cumhist(cdc.exps(i).CD2.other.ori_dif_all,[0 90],1);
    [x3,y3] = cumhist(cdc.exps(i).CD3.other.ori_dif_all,[0 90],1);
    [x4,y4] = cumhist(cdc.exps(i).CD4.other.ori_dif_all,[0 90],1);
    
    plot(x1,y1,'LineWidth',3);
    plot(x2,y2,'LineWidth',3);
    plot(x3,y3,'LineWidth',3);
    plot(x4,y4,'LineWidth',3);
    
    axis([0 90 0 100]);
    legend(' 0 Hours',' 3 Hours',' 6 Hours',' 9 Hours','Location','SE');
    title(cdc.exps(i).expid,'FontSize',14);
    
    if i == 1,
        xlabel('Degree Difference','FontSize',14);
        ylabel('Fraction of Sites','FontSize',14);
    end;
    
end;




