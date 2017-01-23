function plot_tfexp_age_bar(tfexp_age)

%
%
%



site_avg = [tfexp_age.dir.mmm_site_1hz_avg, ...
    tfexp_age.dir.mmm_site_2hz_avg, ...
    tfexp_age.dir.mmm_site_4hz_avg];

site_ste = [tfexp_age.dir.mmm_site_1hz_ste, ...
    tfexp_age.dir.mmm_site_2hz_ste, ...
    tfexp_age.dir.mmm_site_4hz_ste];

pen_avg = [tfexp_age.dir.mmm_pen_1hz_avg, ...
    tfexp_age.dir.mmm_pen_2hz_avg, ...
    tfexp_age.dir.mmm_pen_4hz_avg];

pen_ste = [tfexp_age.dir.mmm_pen_1hz_ste, ...
    tfexp_age.dir.mmm_pen_2hz_ste, ...
    tfexp_age.dir.mmm_pen_4hz_ste];

figure();

subplot(1,2,1); % Site Average
hold on;

bar(site_avg,0.5,'c');
errorbar(site_avg,site_ste,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

site_speed_averages = {'mmm_site_1hz_all','mmm_site_2hz_all','mmm_site_4hz_all'};

for j = 1:3,
    
    jitter = rand(length(tfexp_age.dir.(site_speed_averages{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,tfexp_age.dir.(site_speed_averages{j}),'k.','markersize',10);
    
end;

hold off;
box off;
axis([0.5 3.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3]);
set(gca,'XTickLabel',{'12.5', '25', '50'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('Site Average','FontSize',14);

subplot(1,2,2); % Penetration Average
hold on;


bar(pen_avg,0.5,'c');
errorbar(pen_avg,pen_ste,'k.','LineWidth',3);

% Add all penetration average DSIs to bar graph. X value jittered 
% a little bit to distinguish between overlapping points.

pen_speed_avgs = {'mmm_pen_1hz_avgs','mmm_pen_2hz_avgs','mmm_pen_4hz_avgs'};

for j = 1:3,
    
    jitter = rand(length(tfexp_age.dir.(pen_speed_avgs{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,tfexp_age.dir.(pen_speed_avgs{j}),'k.','markersize',20);
    
end;

hold off;
box off;
axis([0.5 3.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3]);
set(gca,'XTickLabel',{'12.5', '25', '50'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('Penetration Average','FontSize',14);



