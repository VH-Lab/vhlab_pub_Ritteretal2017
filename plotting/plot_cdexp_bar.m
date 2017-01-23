function plot_cdexp_bar(cdexp)

% PLOT_CDEXP_BAR(CDEXP) - Bar plots of various metrics pulled from coarse
% direction stimulus for a single Speed Training experiment:
%           Circular Variance
%           DirCircular Variance
%           
% INPUTS: 
%       cdexp - 
%
%
% NOTES: 
%
%


epochs = {'CD1','CD2','CD3','CD4'};

cv_site_avgs = [];
cv_site_stes = [];

dcv_site_avgs = [];
dcv_site_stes = [];

mmm_site_avgs = [];
mmm_site_stes = [];

tot_site_avgs = [];
tot_site_stes = [];

for i = 1:4,
    
    cv_site_avgs = [cv_site_avgs cdexp.(epochs{i}).dir.cv_site_avg]; % by site averages
    cv_site_stes = [cv_site_stes cdexp.(epochs{i}).dir.cv_site_ste]; % by site stes
    
    dcv_site_avgs = [dcv_site_avgs cdexp.(epochs{i}).dir.dcv_site_avg]; % by site averages
    dcv_site_stes = [dcv_site_stes cdexp.(epochs{i}).dir.dcv_site_ste]; % by site stes
    
    mmm_site_avgs = [mmm_site_avgs cdexp.(epochs{i}).dir.mmm_site_avg];
    mmm_site_stes = [mmm_site_stes cdexp.(epochs{i}).dir.mmm_site_ste];
    
    tot_site_avgs = [tot_site_avgs cdexp.(epochs{i}).dir.tot_site_avg];
    tot_site_stes = [tot_site_stes cdexp.(epochs{i}).dir.tot_site_ste];
    
end;


figure();

subplot(1,4,1); % 1 - Circular Variance
hold on;

bar(1 - cv_site_avgs,0.5,'c');
errorbar(1 - cv_site_avgs,cv_site_stes,'k.','LineWidth',3);

for j = 1:4, % jitter individual cell X values
    
    jitter = rand(length(cdexp.(epochs{j}).dir.cv_site_all),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,1 - cdexp.(epochs{j}).dir.cv_site_all,'k.','markersize',10);
    
end;

hold off;
box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});

ylabel('1 - Circular Variance','FontSize',14);
xlabel('Hours Training','FontSize',14);
title('1 - Circular Variance','FontSize',14);



subplot(1,4,2); % 1 - DirCircular Variance
hold on;

bar(1 - dcv_site_avgs,0.5,'c');
errorbar(1 - dcv_site_avgs,dcv_site_stes,'k.','LineWidth',3);

for j = 1:4, % jitter individual cell X values
    
    jitter = rand(length(cdexp.(epochs{j}).dir.dcv_site_all),1) .* 0.2; % Jitter x values a little bit
    x = jitter + j - mean(jitter);
    plot(x,1 - cdexp.(epochs{j}).dir.dcv_site_all,'k.','markersize',10);
    
end;

hold off;
box off;
axis([0.5 4.5 0 1]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0','3','6','9'});

ylabel('1 - DirCircular Variance','FontSize',14);
xlabel('Hours Training','FontSize',14);
title('1 - DirCircular Variance','FontSize',14);




