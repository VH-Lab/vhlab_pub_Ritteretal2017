function plot_cdcondition_cumhist(cdc)

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

for i = 1:4, % 1 - Circular Variance
    
    [X,Y] = cumhist(cdc.(epochs{i}).dir.cv_site_all,[0 1],1);
    plot(1 - X,100 - Y,'LineWidth',4);
    
end;

hold off;

legend(' 0 Hours, n=99',' 3 Hours, n=103',' 6 Hours, n=75',' 9 Hours, n=64','Location','SE');

title('Circular Variance','FontSize',14);
set(gca,'LineWidth',3,'FontSize',14);
set(gca,'YTick',[0 20 40 60 80 100]);



figure();
hold on;

for i = 1:4, % 1 - DirCircular Variance
    
    [X,Y] = cumhist(cdc.(epochs{i}).dir.dcv_site_all,[0 1],1);
    plot(1 - X,100 - Y,'LineWidth',4);
    
end;

hold off;

legend(' 0 Hours, n=99',' 3 Hours, n=103',' 6 Hours, n=75',' 9 Hours, n=64','Location','SE');

title('DirCircular Variance','FontSize',14);
set(gca,'LineWidth',3,'FontSize',14);
set(gca,'YTick',[0 20 40 60 80 100])















