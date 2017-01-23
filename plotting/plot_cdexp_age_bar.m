function plot_cdexp_age_bar(cdexp_age)




site_avg = [cdexp_age.dir.cv_site_avg];
site_ste = [cdexp_age.dir.cv_site_ste];
    
pen_avg = [cdexp_age.dir.cv_pen_avg];
pen_ste = [cdexp_age.dir.cv_pen_ste];
    
    

figure();

subplot(1,2,1); % Site Average
hold on;

bar(site_avg,'c');
errorbar(site_avg,site_ste,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

site_speed_averages = {'cv_site_all'};

for j = 1:1,
    
    jitter = rand(length(cdexp_age.dir.(site_speed_averages{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,cdexp_age.dir.(site_speed_averages{j}),'k.','markersize',10);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('Site Average','FontSize',14);



subplot(1,2,2); % Penetration Average
hold on;

bar(pen_avg,'c');
errorbar(pen_avg,pen_ste,'k.','LineWidth',3);

% Add all penetration average DSIs to bar graph. X value jittered 
% a little bit to distinguish between overlapping points.

pen_speed_avgs = {'cv_pen_avgs'};

for j = 1:1,
    
    jitter = rand(length(cdexp_age.dir.(pen_speed_avgs{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,cdexp_age.dir.(pen_speed_avgs{j}),'k.','markersize',20);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('Penetration Average','FontSize',14);



