function plot_cdcondition_tuning_fit(cdc)

%
%
%
%
%
%
%


angles = [0 30 60 90 120 150 180 210 240 270 300 330];
x = 0:1:359;
epochs = {'CD1','CD2','CD3','CD4'};

figure();

for i = 1:4, % Animal average
    
    subplot(1,4,i),
    hold on;
    
    plot(x,cdc.(epochs{i}).fit.f0curvefits,'LineWidth',3);
    plot(x,cdc.(epochs{i}).fit.f0curvefit,'k','LineWidth',5);
    errorbar(angles,cdc.(epochs{i}).resps.normresps_aligned_exp_avg, ...
        cdc.(epochs{i}).resps.normresps_aligned_exp_ste,'k.','LineWidth',5);
    
    hold off;
    axis([0 360 -.2 1]);
    axis square;
    set(gca,'XTick',[]);
    set(gca,'LineWidth',3,'FontSize',14);
    set(gca,'YTick',[-.2 0 0.2 0.4 0.6 0.8 1.0]);
    set(gca,'XTick',[0 30 60 90 120 150 180 210 240 270 300 330]);
    
end;










