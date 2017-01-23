function plot_cdcondition_tunewidth_cumhist(cdc)

%
%
%
%
%
%
%
%





epochs = {'CD1','CD2','CD3','CD4'};

figure();
hold on;

for i = 1:4, %
    
    [X,Y] = cumhist(cdc.(epochs{i}).other.tunewidth_site_all,[0 140],1);
    plot(X,Y,'LineWidth',4);
    
end;

hold off;

%legend(' 0 Hours, n=99',' 3 Hours, n=103',' 6 Hours, n=75',' 9 Hours, n=64','Location','SE');
legend(' 0 Hours',' 3 Hours',' 6 Hours',' 9 Hours','Location','SE');

title('Tuning Width','FontSize',14);
set(gca,'LineWidth',3,'FontSize',14);
set(gca,'YTick',[0 20 40 60 80 100 120 140]);

axis([0 90 0 100]);













