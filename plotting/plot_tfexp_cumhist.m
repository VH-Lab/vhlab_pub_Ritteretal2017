function plot_tfexp_cumhist(tfexp)

%
%
%
%
%


mmm_hz_all = {'mmm_1hz_all','mmm_2hz_all','mmm_4hz_all'};
epochs = {'TF1','TF2','TF3','TF4'};

figure();
hold on;

for i = 1:3,
    
    subplot(1,3,i), % 3 plots, one for DSI at 1hz, 2hz, and 4hz
    hold on;
    
    for j = 1:4, % number of epochs
        
        [X,Y] = cumhist(tfexp.(epochs{j}).dir.(mmm_hz_all{i}),[0 1],1);
        plot(X,Y,'LineWidth',4);
        
    end;
    
    title(mmm_hz_all{i},'Interp','None');
    
    legend(' 0 Hours', ' 3 Hours', ' 6 Hours', ' 9 Hours');
    legend('Location','SouthEast');
    xlabel('DSI');
    ylabel('Percent Sites');
    set(gca,'FontSize',14,'LineWidth',4);
    axis square
    
end;


