function plot_tfexp_dir(tfexp)


% DSI Across Speeds

speeds = [25 20 16 12 8 6 4 2 1 0.5 0.25] ./ 0.08;
epoch = {'TF1', 'TF2', 'TF3', 'TF4'};

figure();

for i = 1:4
    
    subplot(2,1,1) % MMM
    hold on;
    
    errorbar(speeds,tfexp.(epoch{i}).dir.mmm_avg,tfexp.(epoch{i}).dir.mmm_ste,'LineWidth',3);
    
end;

set(gca,'XScale','log');
axis tight;
axis([0 max(speeds) 0 1]);
legend(' 0 Hours',' 3 Hours', ' 6 Hours', ' 9 Hours');
title('(Max - Min) / Max');

for i = 1:4,
    
    subplot(2,1,2) % DIR2
    hold on;
    
    errorbar(speeds,tfexp.(epoch{i}).dir.dir2_avg,tfexp.(epoch{i}).dir.dir2_ste,'LineWidth',3);
    
end;

set(gca,'XScale','log');
axis tight;
axis([0 max(speeds) -.2 1]);
legend(' 0 Hours',' 3 Hours', ' 6 Hours', ' 9 Hours');
title('(Pref - Null) / (Pref + Null)');




