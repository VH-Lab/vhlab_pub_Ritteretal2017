function plot_cdcondition_tunewidth(cdc)

%
%
%
%
%
%
%
%


epochs = {'CD1','CD2','CD3','CD4'};

avgs = [];
stes = [];

for i = 1:4,
    avgs = [avgs cdc.(epochs{i}).other.tunewidth_animal_avg];
    stes = [stes cdc.(epochs{i}).other.tunewidth_animal_ste];
end;


figure();
hold on;

% bar(avgs,0.5,'c');
bar(avgs,1,'c');
errorbar(avgs,stes,'k.','LineWidth',3);

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).other.tunewidth_animal_avgs),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,cdc.(epochs{i}).other.tunewidth_animal_avgs,'k.','markersize',10);
end;

hold off;
box off;
axis([0.5 4.5 0 50]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});

ylabel('Tuning Width (Degrees)','FontSize',14);
xlabel('Hours Training','FontSize',14);
title('Tuning Width','FontSize',14);



