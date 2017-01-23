function plot_tfcondition_tstat_bar(tfc)

%
%
%
%
%
%
%
%


tstat_avg = {'tstat_animal_avg_1hz','tstat_animal_avg_2hz','tstat_animal_avg_4hz',};
tstat_ste = {'tstat_animal_ste_1hz','tstat_animal_ste_2hz','tstat_animal_ste_4hz',};
plot_titles1 = {'One Hz Animal','Two Hz Animal','Four Hz Animal'};

tstat_animal_avgs = {'tstat_avgs_1hz','tstat_avgs_2hz','tstat_avgs_4hz'};
epochs = {'TF1','TF2','TF3','TF4'};

tstat_site_avg = {'tstat_site_avg_1hz','tstat_site_avg_2hz','tstat_site_avg_4hz'};
tstat_site_ste = {'tstat_site_ste_1hz','tstat_site_ste_2hz','tstat_site_ste_4hz'};
tstat_site_all = {'tstat_all_1hz','tstat_all_2hz','tstat_all_4hz'};
plot_titles2 = {'One Hz Site','Two Hz Site','Four Hz Site'};


figure();

for i = 1:3 % 3 plots, one for TSTAT at 1hz, 2hz, and 4hz (animal averages)
    
    avg = [tfc.TF1.dir.(tstat_avg{i}), ...
        tfc.TF2.dir.(tstat_avg{i}), ...
        tfc.TF3.dir.(tstat_avg{i}), ...
        tfc.TF4.dir.(tstat_avg{i})];
    
    ste = [tfc.TF1.dir.(tstat_ste{i}), ...
        tfc.TF2.dir.(tstat_ste{i}), ...
        tfc.TF3.dir.(tstat_ste{i}), ...
        tfc.TF4.dir.(tstat_ste{i})];
    
    subplot(2,3,i),
    hold on;
    
    bar(avg,0.5,'c');
    errorbar(avg,ste,'k.','LineWidth',3);
    
    box off;
    axis([0.5 4.5 0 5]);
    set(gca,'FontSize',14,'LineWidth',3);
    set(gca,'XTick',[1 2 3 4]);
    set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});
    
    ylabel('Direction Selectivity Index','FontSize',14);
    xlabel('Training Time','FontSize',14);
    title(plot_titles1{i});
    
    for j = 1:4, % For each epoch add individual animal averages
        
        jitter = rand(length(tfc.(epochs{j}).dir.(tstat_animal_avgs{i})),1) .* 0.2; % Jitter x values a little bit
        x = jitter + j - mean(jitter);
        plot(x,tfc.(epochs{j}).dir.(tstat_animal_avgs{i}),'k.','markersize',20);
        
    end;
    
    
end;



for i = 1:3, % 3 plots, one for DSI at 1hz, 2hz, and 4hz (site averages)
    
    avg = [tfc.TF1.dir.(tstat_site_avg{i}), ...
        tfc.TF2.dir.(tstat_site_avg{i}), ...
        tfc.TF3.dir.(tstat_site_avg{i}), ...
        tfc.TF4.dir.(tstat_site_avg{i})];
    
    ste = [tfc.TF1.dir.(tstat_site_ste{i}), ...
        tfc.TF2.dir.(tstat_site_ste{i}), ...
        tfc.TF3.dir.(tstat_site_ste{i}), ...
        tfc.TF4.dir.(tstat_site_ste{i})];
    
    subplot(2,3,i+3),
    hold on;
    
    bar(avg,0.5,'c');
    errorbar(avg,ste,'k.','LineWidth',3);
    
    box off;
    axis([0.5 4.5 0 5]);
    set(gca,'FontSize',14,'LineWidth',3);
    set(gca,'XTick',[1 2 3 4]);
    set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});
    
    ylabel('Direction Selectivity Index','FontSize',14);
    xlabel('Training Time','FontSize',14);
    title(plot_titles2{i});
    
    for j = 1:4, % For each epoch add individual site averages
        
        jitter = rand(length(tfc.(epochs{j}).dir.(tstat_site_all{i})),1) .* 0.2; % Jitter x values a little bit
        x = jitter + j - mean(jitter);
        plot(x,tfc.(epochs{j}).dir.(tstat_site_all{i}),'k.','markersize',10);
        
    end;
    
end;


suptitle('TSTAT');
