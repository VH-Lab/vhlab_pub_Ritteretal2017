function plot_cdcondition_bar(cdc)

%
%
%
%
%
%
%
%

epochs = {'CD1','CD2','CD3','CD4'};

cv_site_avgs = [];
cv_site_stes = [];
cv_exp_avgs = [];
cv_exp_stes = [];

dcv_site_avgs = [];
dcv_site_stes = [];
dcv_exp_avgs = [];
dcv_exp_stes = [];

mmm_site_avgs = [];
mmm_site_stes = [];
mmm_exp_avgs = [];
mmm_exp_stes = [];

tot_site_avgs = [];
tot_site_stes = [];
tot_exp_avgs = [];
tot_exp_stes = [];

for i = 1:4,
    
    cv_site_avgs = [cv_site_avgs cdc.(epochs{i}).dir.cv_site_avg]; % by site averages
    cv_site_stes = [cv_site_stes cdc.(epochs{i}).dir.cv_site_ste]; % by site stes
    cv_exp_avgs = [cv_exp_avgs cdc.(epochs{i}).dir.cv_exp_avg]; % by exp averages
    cv_exp_stes = [cv_exp_stes cdc.(epochs{i}).dir.cv_exp_ste]; % by exp stes
    
    dcv_site_avgs = [dcv_site_avgs cdc.(epochs{i}).dir.dcv_site_avg]; % by site averages
    dcv_site_stes = [dcv_site_stes cdc.(epochs{i}).dir.dcv_site_ste]; % by site stes
    dcv_exp_avgs = [dcv_exp_avgs cdc.(epochs{i}).dir.dcv_exp_avg]; % by exp averages
    dcv_exp_stes = [dcv_exp_stes cdc.(epochs{i}).dir.dcv_exp_ste]; % by exp stes
    
    mmm_site_avgs = [mmm_site_avgs cdc.(epochs{i}).dir.mmm_site_avg];
    mmm_site_stes = [mmm_site_stes cdc.(epochs{i}).dir.mmm_site_ste];
    mmm_exp_avgs = [mmm_exp_avgs cdc.(epochs{i}).dir.mmm_exp_avg];
    mmm_exp_stes = [mmm_exp_stes cdc.(epochs{i}).dir.mmm_exp_ste];
    
    tot_site_avgs = [tot_site_avgs cdc.(epochs{i}).dir.tot_site_avg];
    tot_site_stes = [tot_site_stes cdc.(epochs{i}).dir.tot_site_ste];
    tot_exp_avgs = [tot_exp_avgs cdc.(epochs{i}).dir.tot_exp_avg];
    tot_exp_stes = [tot_exp_stes cdc.(epochs{i}).dir.tot_exp_ste];
    
end;


figure();


subplot(2,4,1) % By Site 1 - (Circular Variance)
hold on;

bar(1 - cv_site_avgs,0.5,'c');
errorbar(1 - cv_site_avgs,cv_site_stes,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).dir.cv_site_all),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,1 - cdc.(epochs{i}).dir.cv_site_all,'k.','markersize',10);
end;

hold off;
box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Hours Training','FontSize',14);
title('1 - CircVar Site','FontSize',14);

subplot(2,4,5) % By Animal 1 - (Circular Variance)
hold on;

bar(1 - cv_exp_avgs,0.5,'c');
errorbar(1 - cv_exp_avgs,cv_exp_stes,'k.','LineWidth',3);

% Add all individual exp avg DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).dir.cv_exp_avgs),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,1 - cdc.(epochs{i}).dir.cv_exp_avgs,'k+','markersize',5);
end;

hold off;
box off;
axis([0.5 4.5 0 0.8]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});
title('1 - CircVar Animal','FontSize',14);


%%%

subplot(2,4,2) % By Site 1 - (Dir Circular Variance)
hold on;

bar(1 - dcv_site_avgs,0.5,'c');
errorbar(1 - dcv_site_avgs,dcv_site_stes,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).dir.dcv_site_all),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,1 - cdc.(epochs{i}).dir.dcv_site_all,'k.','markersize',10);
end;

hold off;
box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Hours Training','FontSize',14);
title('1 - DirCircVar Site','FontSize',14);

subplot(2,4,6) % By Animal 1 - (Dir Circular Variance)
hold on;

bar(1 - dcv_exp_avgs,0.5,'c');
errorbar(1 - dcv_exp_avgs,dcv_exp_stes,'k.','LineWidth',3);

% Add all individual exp avg DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).dir.dcv_exp_avgs),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,1 - cdc.(epochs{i}).dir.dcv_exp_avgs,'k+','markersize',5);
end;

hold off;
box off;
axis([0.5 4.5 0 0.6]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});
title('1 - DirCircVar Animal','FontSize',14);


subplot(2,4,3) % By Site MMM
hold on;

bar(mmm_site_avgs,0.5,'c');
errorbar(mmm_site_avgs,mmm_site_stes,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).dir.mmm_site_all),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,cdc.(epochs{i}).dir.mmm_site_all,'k.','markersize',10);
end;

hold off;
box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Hours Training','FontSize',14);
title('MMM Site','FontSize',14);


subplot(2,4,7) % By Animal MMM
hold on;

bar(mmm_exp_avgs,0.5,'c');
errorbar(mmm_exp_avgs,mmm_exp_stes,'k.','LineWidth',3);

% Add all individual exp avg DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).dir.mmm_exp_avgs),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,cdc.(epochs{i}).dir.mmm_exp_avgs,'k+','markersize',5);
end;

hold off;
box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});
title('MMM Animal','FontSize',14);


subplot(2,4,4) % By Site TOT
hold on;

bar(tot_site_avgs,0.5,'c');
errorbar(tot_site_avgs,tot_site_stes,'k.','LineWidth',3);

% Add all individual cell DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).dir.tot_site_all),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,cdc.(epochs{i}).dir.tot_site_all,'k.','markersize',10);
end;

hold off;
box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Hours Training','FontSize',14);
title('TOT Site','FontSize',14);


subplot(2,4,8) % By Animal TOT
hold on;

bar(tot_exp_avgs,0.5,'c');
errorbar(tot_exp_avgs,tot_exp_stes,'k.','LineWidth',3);

% Add all individual exp avg DSIs to bar graph. X value jittered a little bit
% to distinguish between overlapping points.

for i = 1:4,   
    jitter = rand(length(cdc.(epochs{i}).dir.tot_exp_avgs),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,cdc.(epochs{i}).dir.tot_exp_avgs,'k+','markersize',5);
end;

hold off;
box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});
title('TOT Animal','FontSize',14);




