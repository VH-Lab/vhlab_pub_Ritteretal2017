function plot_cdcondition_age_bar(cdc_age)

%
%
%
%
%


cv_site_avg = cdc_age.dir.cv_site_avg;
cv_site_ste = cdc_age.dir.cv_site_ste;
cv_pen_avg = cdc_age.dir.cv_pen_avg;
cv_pen_ste = cdc_age.dir.cv_pen_ste;
    
dcv_site_avg = cdc_age.dir.dcv_site_avg;
dcv_site_ste = cdc_age.dir.dcv_site_ste;
dcv_pen_avg = cdc_age.dir.dcv_pen_avg;
dcv_pen_ste = cdc_age.dir.dcv_pen_ste;

mmm_site_avg = cdc_age.dir.mmm_site_avg;
mmm_site_ste = cdc_age.dir.mmm_site_ste;
mmm_pen_avg = cdc_age.dir.mmm_pen_avg;
mmm_pen_ste = cdc_age.dir.mmm_pen_ste;

tot_site_avg = cdc_age.dir.tot_site_avg;
tot_site_ste = cdc_age.dir.tot_site_ste;
tot_pen_avg = cdc_age.dir.tot_pen_avg;
tot_pen_ste = cdc_age.dir.tot_pen_ste;

figure();

subplot(2,4,1); % 1 - Circular Variance Site
hold on;

bar(1 - cv_site_avg,'c');
errorbar(1 - cv_site_avg,cv_site_ste,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

site_speed_averages = {'cv_site_all'};

for j = 1:1,
    
    jitter = rand(length(cdc_age.dir.(site_speed_averages{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,1 - cdc_age.dir.(site_speed_averages{j}),'k.','markersize',10);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('1 - CV Site','FontSize',14);


subplot(2,4,5); % 1 - Circular Variance Pen
hold on;

bar(1 - cv_pen_avg,'c');
errorbar(1 - cv_pen_avg,cv_pen_ste,'k.','LineWidth',3);

% Add all penetration average DSIs to bar graph. X value jittered 
% a little bit to distinguish between overlapping points.

pen_speed_avgs = {'cv_pen_avgs'};

for j = 1:1,
    
    jitter = rand(length(cdc_age.dir.(pen_speed_avgs{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,1 - cdc_age.dir.(pen_speed_avgs{j}),'k.','markersize',20);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('1 - CV Pen','FontSize',14);

% ---------- %

subplot(2,4,2); % 1 - DirCircular Variance Site
hold on;

bar(1 - dcv_site_avg,'c');
errorbar(1 - dcv_site_avg,dcv_site_ste,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

site_speed_averages = {'dcv_site_all'};

for j = 1:1,
    
    jitter = rand(length(cdc_age.dir.(site_speed_averages{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,1 - cdc_age.dir.(site_speed_averages{j}),'k.','markersize',10);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('1 - DCV Site','FontSize',14);


subplot(2,4,6); % 1 - DirCircular Variance Pen
hold on;

bar(1 - dcv_pen_avg,'c');
errorbar(1 - dcv_pen_avg,dcv_pen_ste,'k.','LineWidth',3);

% Add all penetration average DSIs to bar graph. X value jittered 
% a little bit to distinguish between overlapping points.

pen_speed_avgs = {'dcv_pen_avgs'};

for j = 1:1,
    
    jitter = rand(length(cdc_age.dir.(pen_speed_avgs{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,1 - cdc_age.dir.(pen_speed_avgs{j}),'k.','markersize',20);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('1 - DCV Pen','FontSize',14);

% ---------- %

subplot(2,4,3); % MMM Site
hold on;

bar(mmm_site_avg,'c');
errorbar(mmm_site_avg,mmm_site_ste,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

site_speed_averages = {'mmm_site_all'};

for j = 1:1,
    
    jitter = rand(length(cdc_age.dir.(site_speed_averages{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,cdc_age.dir.(site_speed_averages{j}),'k.','markersize',10);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('MMM Site','FontSize',14);


subplot(2,4,7); % MMM Pen
hold on;

bar(mmm_pen_avg,'c');
errorbar(mmm_pen_avg,mmm_pen_ste,'k.','LineWidth',3);

% Add all penetration average DSIs to bar graph. X value jittered 
% a little bit to distinguish between overlapping points.

pen_speed_avgs = {'mmm_pen_avgs'};

for j = 1:1,
    
    jitter = rand(length(cdc_age.dir.(pen_speed_avgs{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,cdc_age.dir.(pen_speed_avgs{j}),'k.','markersize',20);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('MMM Pen','FontSize',14);


subplot(2,4,4); % TOT Site
hold on;

bar(tot_site_avg,'c');
errorbar(tot_site_avg,tot_site_ste,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

site_speed_averages = {'tot_site_all'};

for j = 1:1,
    
    jitter = rand(length(cdc_age.dir.(site_speed_averages{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,cdc_age.dir.(site_speed_averages{j}),'k.','markersize',10);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('TOT Site','FontSize',14);


subplot(2,4,8); % TOT Pen
hold on;

bar(tot_pen_avg,'c');
errorbar(tot_pen_avg,tot_pen_ste,'k.','LineWidth',3);

% Add all penetration average DSIs to bar graph. X value jittered 
% a little bit to distinguish between overlapping points.

pen_speed_avgs = {'tot_pen_avgs'};

for j = 1:1,
    
    jitter = rand(length(cdc_age.dir.(pen_speed_avgs{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,cdc_age.dir.(pen_speed_avgs{j}),'k.','markersize',20);
    
end;

hold off;
box off;
axis([0.5 1.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1]);
set(gca,'XTickLabel',{'25'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('TOT Pen','FontSize',14);

