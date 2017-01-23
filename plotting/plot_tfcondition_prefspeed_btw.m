function plot_tfcondition_prefspeed_btw(tfc)

%
%
% INPUTS:
%       tfc -
%       avg - e.g. 'dsi_animal_avg_1hz'
%       avgs - e.g. 'dsi_avgs_1hz'
%       ste - e.g. 'dsi_animal_ste_1hz'


epochs = {'TF1','TF2','TF3','TF4'};

pref_avg = [tfc.TF1.speed.speed_pref_pref_animal_avg, ...
    tfc.TF2.speed.speed_pref_pref_animal_avg, ...
    tfc.TF3.speed.speed_pref_pref_animal_avg, ...
    tfc.TF4.speed.speed_pref_pref_animal_avg];

pref_ste = [tfc.TF1.speed.speed_pref_pref_animal_ste, ...
    tfc.TF2.speed.speed_pref_pref_animal_ste, ...
    tfc.TF3.speed.speed_pref_pref_animal_ste, ...
    tfc.TF4.speed.speed_pref_pref_animal_ste];

null_avg = [tfc.TF1.speed.speed_pref_null_animal_avg, ...
    tfc.TF2.speed.speed_pref_null_animal_avg, ...
    tfc.TF3.speed.speed_pref_null_animal_avg, ...
    tfc.TF4.speed.speed_pref_null_animal_avg];

null_ste = [tfc.TF1.speed.speed_pref_null_animal_ste, ...
    tfc.TF2.speed.speed_pref_null_animal_ste, ...
    tfc.TF3.speed.speed_pref_null_animal_ste, ...
    tfc.TF4.speed.speed_pref_null_animal_ste];



figure();
hold on;

bar(avg,.5,'c');
errorbar(pref_avg,pref_ste,'k.','LineWidth',2);

box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'YTick',[0 10 20 30 40 50 60 70 80 90 100]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Training Time','FontSize',14);

for j = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(tfc.(epochs{j}).speed.speed_pref_pref_avgs),1) .* 0.2; % Jitter X
    x = jitter + j - mean(jitter);
    plot(x,tfc.(epochs{j}).speed.speed_pref_pref_avgs,'k.','markersize',30);
    
end;



figure();
hold on;

bar(avg,.5,'c');
errorbar(null_avg,null_ste,'k.','LineWidth',2);

box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'YTick',[0 10 20 30 40 50 60 70 80 90 100]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Training Time','FontSize',14);

for j = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(tfc.(epochs{j}).speed.speed_pref_null_animal_avgs),1) .* 0.2; % Jitter X
    x = jitter + j - mean(jitter);
    plot(x,tfc.(epochs{j}).speed.speed_pref_null_animal_avgs,'k.','markersize',30);
    
end;


