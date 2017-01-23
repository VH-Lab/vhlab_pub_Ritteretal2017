function plot_cdcondition_tuning(cdc)

%
%
%
%
%
%
%


angles = [0 30 60 90 120 150 180 210 240 270 300 330];
epochs = {'CD1','CD2','CD3','CD4'};
hours_trained = {'0 Hours','3 Hours','6 Hours','9 Hours'};

figure();

for i = 1:4, % Site average
    
    subplot(2,4,i);
    hold on;
    
    plot(angles,cdc.(epochs{i}).resps.normresps_aligned_site_all);
    errorbar(angles,cdc.(epochs{i}).resps.normresps_aligned_site_avg, ...
        cdc.(epochs{i}).resps.normresps_aligned_site_ste,'b','LineWidth',3);
    
    hold off;
    axis([0 330 -.2 1]);
    numcells = int2str(cdc.(epochs{i}).other.numcells);
    filtered = int2str(cdc.(epochs{i}).other.filtered);
    title([hours_trained{i} ' , Num Cells: ' numcells ' Filtered: ' filtered]);
    
    if i == 1, % Axis Labels on First Plot
        xlabel('Direction (Degrees)','FontSize',14);
        ylabel('Normalized/Aligned Response','FontSize',14);
    end;
    
end;

for i = 1:4, % Animal average
    
    subplot(2,4,i+4),
    hold on;
    
    plot(angles,cdc.(epochs{i}).resps.normresps_aligned_exp_avgs, ...
        'LineWidth',2);
    errorbar(angles,cdc.(epochs{i}).resps.normresps_aligned_exp_avg, ...
        cdc.(epochs{i}).resps.normresps_aligned_exp_ste,'b','LineWidth',4);
    
    hold off;
    axis([0 330 -.2 1]);
    %axis square;
    set(gca,'XTick',[]);
    set(gca,'LineWidth',3,'FontSize',14);
    set(gca,'YTick',[-.2 0 0.2 0.4 0.6 0.8 1.0]);
    set(gca,'XTick',[0 30 60 90 120 150 180 210 240 270 300 330]);
end;










