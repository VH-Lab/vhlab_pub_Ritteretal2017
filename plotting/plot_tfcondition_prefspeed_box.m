function plot_tfcondition_prefspeed_box(tfc)

%
%
% INPUTS:
%       tfc -
%       avg - e.g. 'dsi_animal_avg_1hz'
%       avgs - e.g. 'dsi_avgs_1hz'
%       ste - e.g. 'dsi_animal_ste_1hz'



speeds = [3.125 6.25 12.5 25 50 75 100 150 200 250 312.5];
epochs = {'TF1','TF2','TF3','TF4'};

pref_med = [tfc.TF1.speed.speed_pref_pref_animal_medians; ...
    tfc.TF2.speed.speed_pref_pref_animal_medians; ...
    tfc.TF3.speed.speed_pref_pref_animal_medians; ...
    tfc.TF4.speed.speed_pref_pref_animal_medians];


null_med = [tfc.TF1.speed.speed_pref_null_animal_medians; ...
    tfc.TF2.speed.speed_pref_null_animal_medians; ...
    tfc.TF3.speed.speed_pref_null_animal_medians; ...
    tfc.TF4.speed.speed_pref_null_animal_medians];



figure();
hold on;

boxplot(pref_med');
plot(1.5,speeds,'k.','markersize',20);

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

boxplot(null_med');
plot(1.5,speeds,'k.','markersize',20)

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


