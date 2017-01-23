function plot_tfcondition_age_bar(tfc_age)

%
%
%
%
%
%
%

site_avg = [tfc_age.dir.mmm_site_1hz_avg, ...
    tfc_age.dir.mmm_site_2hz_avg, ...
    tfc_age.dir.mmm_site_4hz_avg];

site_ste = [tfc_age.dir.mmm_site_1hz_ste, ...
    tfc_age.dir.mmm_site_2hz_ste, ...
    tfc_age.dir.mmm_site_4hz_ste];

exp_avg = [tfc_age.dir.mmm_exp_1hz_avg, ...
    tfc_age.dir.mmm_exp_2hz_avg, ...
    tfc_age.dir.mmm_exp_4hz_avg];

exp_ste = [tfc_age.dir.mmm_exp_1hz_ste, ...
    tfc_age.dir.mmm_exp_2hz_ste, ...
    tfc_age.dir.mmm_exp_4hz_ste];

figure();

subplot(1,2,1); % Site Average
hold on;

bar(site_avg,0.5,'c');
errorbar(site_avg,site_ste,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

site_speed_averages = {'mmm_site_1hz_all','mmm_site_2hz_all','mmm_site_4hz_all'};

for j = 1:3,
    
    jitter = rand(length(tfc_age.dir.(site_speed_averages{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,tfc_age.dir.(site_speed_averages{j}),'k.','markersize',10);
    
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

subplot(1,2,2); % Animal Average
hold on;


bar(exp_avg,0.5,'c');
errorbar(exp_avg,exp_ste,'k.','LineWidth',3);

% Add all animal average DSIs to bar graph. X value jittered 
% a little bit to distinguish between overlapping points.

exp_speed_avgs = {'mmm_exp_1hz_avgs','mmm_exp_2hz_avgs','mmm_exp_4hz_avgs'};

for j = 1:3,
    
    jitter = rand(length(tfc_age.dir.(exp_speed_avgs{j})),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,tfc_age.dir.(exp_speed_avgs{j}),'k.','markersize',20);
    
end;

hold off;
box off;
axis([0.5 3.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3]);
set(gca,'XTickLabel',{'12.5', '25', '50'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Speed (Deg/Sec)','FontSize',14);
title('Animal Average','FontSize',14);



