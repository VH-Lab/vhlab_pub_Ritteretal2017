function plot_tfexp_bar(tfexp)


% Bar Graph

tfdir_all = {'mmm_1hz_all','mmm_2hz_all','mmm_4hz_all'};
tfdir_avg = {'mmm_1hz_avg','mmm_2hz_avg','mmm_4hz_avg'};
tfdir_ste = {'mmm_1hz_ste','mmm_2hz_ste','mmm_4hz_ste'};

epochs = {'TF1', 'TF2', 'TF3', 'TF4'};

figure();

for i = 1:3,
    
    subplot(1,3,i);
    hold on;
    
    avg = [tfexp.TF1.dir.(tfdir_avg{i}), ...
        tfexp.TF2.dir.(tfdir_avg{i}), ...
        tfexp.TF3.dir.(tfdir_avg{i}), ...
        tfexp.TF4.dir.(tfdir_avg{i})];
    
    ste = [tfexp.TF1.dir.(tfdir_ste{i}), ...
        tfexp.TF2.dir.(tfdir_ste{i}), ...
        tfexp.TF3.dir.(tfdir_ste{i}), ...
        tfexp.TF4.dir.(tfdir_ste{i})];
    
    bar(avg,0.5,'c');
    errorbar(avg,ste,'k.','LineWidth',3);
    
    % Add all individual cell DSIs to bar graph. X value jittered a little bit
    % to distinguish between overlapping points.
    
    for j=1:length(epochs),
        
        jitter = rand(length(tfexp.(epochs{j}).dir.(tfdir_all{i})),1) .* 0.2; % Jitter x values a little bit
        x = jitter + j - mean(jitter);
        plot(x,tfexp.(epochs{j}).dir.(tfdir_all{i}),'k.','markersize',10);
        
    end;
    
    box off;
    axis([0.5 4.5 0 1]);
    set(gca,'FontSize',14,'LineWidth',3);
    set(gca,'XTick',[1 2 3 4]);
    set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});
    axis square
    
    ylabel('Direction Selectivity Index','FontSize',14);
    xlabel('Training Time','FontSize',14);
    title(tfdir_avg{i},'FontSize',14,'Interp','None');
    
end;