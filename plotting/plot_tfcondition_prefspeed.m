function plot_tfcondition_prefspeed(tfc)

%
%
% INPUTS:
%       tfc -
%       avg - e.g. 'dsi_animal_avg_1hz'
%       avgs - e.g. 'dsi_avgs_1hz'
%       ste - e.g. 'dsi_animal_ste_1hz'



speeds = [3.125 6.25 12.5 25 50 75 100 150 200 250 312.5];
epochs = {'TF1','TF2','TF3','TF4'};

pref_med = [tfc.TF1.speed.speed_pref_pref_animal_median, ...
    tfc.TF2.speed.speed_pref_pref_animal_median, ...
    tfc.TF3.speed.speed_pref_pref_animal_median, ...
    tfc.TF4.speed.speed_pref_pref_animal_median];

pref_man = [tfc.TF1.speed.speed_pref_pref_animal_mad, ...
    tfc.TF2.speed.speed_pref_pref_animal_mad, ...
    tfc.TF3.speed.speed_pref_pref_animal_mad, ...
    tfc.TF4.speed.speed_pref_pref_animal_mad];

null_med = [tfc.TF1.speed.speed_pref_null_animal_median, ...
    tfc.TF2.speed.speed_pref_null_animal_median, ...
    tfc.TF3.speed.speed_pref_null_animal_median, ...
    tfc.TF4.speed.speed_pref_null_animal_median];

null_man = [tfc.TF1.speed.speed_pref_null_animal_mad, ...
    tfc.TF2.speed.speed_pref_null_animal_mad, ...
    tfc.TF3.speed.speed_pref_null_animal_mad, ...
    tfc.TF4.speed.speed_pref_null_animal_mad];



figure();
hold on;

bar(pref_med,1,'g');
errorbar(pref_med,pref_man,'k.','LineWidth',2);
plot(1.5,speeds,'k.','markersize',30);

box off;
axis([0.5 4.5 0 312.5]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'YScale','Log');
set(gca,'XTick',[1 2 3 4]);
set(gca,'YTick',[3.125 6.25 12.5 25 50 75 100 150 200 250 312.5]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Training Time','FontSize',14);

for j = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(tfc.(epochs{j}).speed.speed_pref_pref_animal_medians),1) .* 0.2; % Jitter X
    x = jitter + j - mean(jitter);
    plot(x,tfc.(epochs{j}).speed.speed_pref_pref_animal_medians,'k.','markersize',30);
    
end;



figure();
hold on;

bar(null_med,1,'r');
errorbar(null_med,null_man,'k.','LineWidth',2);
plot(1.5,speeds,'k.','markersize',30)

box off;
axis([0.5 4.5 0 312.5]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'YScale','Log');
set(gca,'YTick',[3.125 6.25 12.5 25 50 75 100 150 200 250 312.5]);
axis([0.5 4.5 0 312.5]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Training Time','FontSize',14);

for j = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(tfc.(epochs{j}).speed.speed_pref_null_animal_medians),1) .* 0.2; % Jitter X
    x = jitter + j - mean(jitter);
    plot(x,tfc.(epochs{j}).speed.speed_pref_null_animal_medians,'k.','markersize',30);
    
end;


