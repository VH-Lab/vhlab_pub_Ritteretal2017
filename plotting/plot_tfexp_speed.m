function plot_tfexp_speed(tfexp)

%
%
%
%
%

speeds = [25 20 16 12 8 6 4 2 1 0.5 0.25] ./ 0.08;
epoch = {'TF1', 'TF2', 'TF3', 'TF4'};

figure();

for i = 1:4
    
    subplot(1,4,i); % TF Plots
    hold on;
    
    errorbar(speeds,tfexp.(epoch{i}).speed.pref_avg,tfexp.(epoch{i}).speed.pref_ste,'g','LineWidth',3);
    errorbar(speeds,tfexp.(epoch{i}).speed.null_avg,tfexp.(epoch{i}).speed.null_ste,'r','LineWidth',3);
    
    hold off;
    set(gca,'XScale','log');
    axis([0 max(speeds) -0.1 1]);
    axis square;
    
    numcells = tfexp.(epoch{i}).other.numcells;
    title(['Num Cells: ' int2str(numcells)]);
    
end;

suptitle(tfexp.expid); % title at top of figure is the exp date