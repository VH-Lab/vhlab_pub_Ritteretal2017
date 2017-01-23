function plot_tfcondition_blank(tfc)

%
%
%
%
%
%



epochs = {'TF1','TF2','TF3','TF4'};

% Animal Median and Mad

animal_med = [tfc.TF1.speed.blank_animal_median, ...
    tfc.TF2.speed.blank_animal_median, ...
    tfc.TF3.speed.blank_animal_median, ...
    tfc.TF4.speed.blank_animal_median];
animal_mad = [tfc.TF1.speed.blank_animal_mad, ...
    tfc.TF2.speed.blank_animal_mad, ...
    tfc.TF3.speed.blank_animal_mad, ...
    tfc.TF4.speed.blank_animal_mad];



figure();
hold on;

bar(animal_med,1,'c');
errorbar(animal_med,animal_mad,'k.','LineWidth',3);

box off;
%axis([0.5 4.5 0 max(animal_med)+1]);
axis([0.5 4.5 -1 7]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

for i = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(tfc.(epochs{i}).speed.blank_animal_medians),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,tfc.(epochs{i}).speed.blank_animal_medians,'k.','markersize',30);
    
end;


