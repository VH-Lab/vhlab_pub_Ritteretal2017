function plot_tfcondition_bar(tfc,avg_name,avgs_name,ste_name)

%
%
% INPUTS:
%       tfc -
%       avg - e.g. 'dsi_animal_avg_1hz'
%       avgs - e.g. 'dsi_avgs_1hz'
%       ste - e.g. 'dsi_animal_ste_1hz'


epochs = {'TF1','TF2','TF3','TF4'};

avg = [tfc.TF1.dir.(avg_name), ...
    tfc.TF2.dir.(avg_name), ...
    tfc.TF3.dir.(avg_name), ...
    tfc.TF4.dir.(avg_name)];

ste = [tfc.TF1.dir.(ste_name), ...
    tfc.TF2.dir.(ste_name), ...
    tfc.TF3.dir.(ste_name), ...
    tfc.TF4.dir.(ste_name)];

figure();
hold on;

bar(avg,1,'c');
errorbar(avg,ste,'k.','LineWidth',2);

box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'YTick',[0 0.2 0.4 0.6 0.8 1]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Training Time','FontSize',14);

for j = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(tfc.(epochs{j}).dir.(avgs_name)),1) .* 0.2; % Jitter X
    x = jitter + j - mean(jitter);
    plot(x,tfc.(epochs{j}).dir.(avgs_name),'k.','markersize',30);
    
end;



