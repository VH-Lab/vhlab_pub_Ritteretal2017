function plot_tfcondition_maxresp(tfc)

%
%
%
%



epochs = {'TF1','TF2','TF3','TF4'};

% Animal Median and Mad

animal_med_pref = [tfc.TF1.speed.maxresp_pref_animal_median, ...
    tfc.TF2.speed.maxresp_pref_animal_median, ...
    tfc.TF3.speed.maxresp_pref_animal_median, ...
    tfc.TF4.speed.maxresp_pref_animal_median];
animal_mad_pref = [tfc.TF1.speed.maxresp_pref_animal_mad, ...
    tfc.TF2.speed.maxresp_pref_animal_mad, ...
    tfc.TF3.speed.maxresp_pref_animal_mad, ...
    tfc.TF4.speed.maxresp_pref_animal_mad];

animal_med_null = [tfc.TF1.speed.maxresp_null_animal_median, ...
    tfc.TF2.speed.maxresp_null_animal_median, ...
    tfc.TF3.speed.maxresp_null_animal_median, ...
    tfc.TF4.speed.maxresp_null_animal_median];
animal_mad_null = [tfc.TF1.speed.maxresp_null_animal_mad, ...
    tfc.TF2.speed.maxresp_null_animal_mad, ...
    tfc.TF3.speed.maxresp_null_animal_mad, ...
    tfc.TF4.speed.maxresp_null_animal_mad];



figure(); % Pref Directio 
hold on;

bar(animal_med_pref,1,'c');
errorbar(animal_med_pref,animal_mad_pref,'k.','LineWidth',3);

box off;
% axis([0.5 4.5 0 max(animal_med_pref)+1]);
axis([0.5 4.5 0 30]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

for i = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(tfc.(epochs{i}).speed.maxresp_pref_animal_medians),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,tfc.(epochs{i}).speed.maxresp_pref_animal_medians,'k.','markersize',30);
    
end;




figure(); % Null Direction
hold on;

bar(animal_med_null,1,'r');
errorbar(animal_med_null,animal_mad_null,'k.','LineWidth',3);

box off;
% axis([0.5 4.5 0 max(animal_med_pref)+1]);
axis([0.5 4.5 0 30]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

for i = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(tfc.(epochs{i}).speed.maxresp_null_animal_medians),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,tfc.(epochs{i}).speed.maxresp_null_animal_medians,'k.','markersize',30);
    
end;
