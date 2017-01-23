function plot_cdcondition_age_combined_cumhist(p30,p40,jill)

%
%
%
%
%
%
%


cond.p30 = p30;
cond.p40 = p40;
cond.jill = jill;
cond_names = {'p30','p40','jill'};


figure(); % Circular Variance
hold on;

for i = 1:length(cond_names), 
    
    [X,Y] = cumhist(cond.(cond_names{i}).dir.cv_site_all,[0 1],1);
    plot(1 - X,100 - Y,'LineWidth',4);
    
end;

hold off;
title('1 - Circular Variance','FontSize',14);
legend(' p30',' p40',' Jill','Location','SE');




figure(); % DirCircular Variance
hold on;

for i = 1:length(cond_names), 
    
    [X,Y] = cumhist(cond.(cond_names{i}).dir.dcv_site_all,[0 1],1);
    plot(1 - X,100 - Y,'LineWidth',4);
    
end;

hold off;
title('1 - DirCircular Variance','FontSize',14);
legend(' p30',' p40',' Jill','Location','SE')



figure(); % TOT
hold on;

for i = 1:length(cond_names), 
    
    [X,Y] = cumhist(cond.(cond_names{i}).dir.tot_site_all,[0 1],1);
    plot(1 - X,100 - Y,'LineWidth',4);
    
end;

hold off;
title('TOT','FontSize',14);
legend(' p30',' p40',' Jill','Location','SE')



