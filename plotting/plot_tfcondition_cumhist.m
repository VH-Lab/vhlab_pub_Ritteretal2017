function plot_tfcondition_cumhist(tfc)

%
%
%
%
%
%
%


dsi_all = {'dsi_all_1hz','dsi_all_2hz','dsi_all_4hz'};
epochs = {'TF1','TF2','TF3','TF4'};

figure();
hold on;

for i = 1:3,
    
    subplot(1,3,i), % 3 plots, one for DSI at 1hz, 2hz, and 4hz
    hold on;
    
    for j = 1:4, % number of epochs
        
        [X,Y] = cumhist(tfc.(epochs{j}).dir.(dsi_all{i}),[0 1],1);
        plot(X,Y,'LineWidth',4);
        
    end;
    
    title(dsi_all{i},'Interp','None');
    
    legend(' 0 Hours', ' 3 Hours', ' 6 Hours', ' 9 Hours');
    legend('Location','SouthEast');
    xlabel('DSI');
    ylabel('Percent Sites');
    set(gca,'FontSize',14,'LineWidth',4);
    %axis square
    
end;


