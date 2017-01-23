function plot_cdcondition_bar_lsim(cdc,loc,avg_name,avgs_name,ste_name)

% PLOT_CDCONDITION_BAR_LSIM(CDC,AVG_NAME,AVGS_NAME,STE_NAME) - 
%
% INPUTS: 
%       cdc -
%       avg_name - e.g. 'dcv_exp_avg'
%       avgs_name - e.g. 'dcv_exp_avgs'
%       ste_name - e.g. 'dcv_exp_ste'
%
%



epochs = {'CD1','CD2','CD3','CD4'};

% avg = [1 - cdc.CD1.(loc).(avg_name), ...
%     1 - cdc.CD2.(loc).(avg_name), ...
%     1 - cdc.CD3.(loc).(avg_name), ...
%     1 - cdc.CD4.(loc).(avg_name)];

avg = [cdc.CD1.(loc).(avg_name), ...
    cdc.CD2.(loc).(avg_name), ...
    cdc.CD3.(loc).(avg_name), ...
    cdc.CD4.(loc).(avg_name)];

ste = [cdc.CD1.(loc).(ste_name), ...
    cdc.CD2.(loc).(ste_name), ...
    cdc.CD3.(loc).(ste_name), ...
    cdc.CD4.(loc).(ste_name)];

figure();
hold on;

bar(avg,1,'c');
errorbar(avg,ste,'k.','LineWidth',2);

box off;
axis([0.5 4.5 0 50]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
%set(gca,'YTick',[0 0.2 0.4 0.6 0.8 1]);
%set(gca,'YTick',[0 0.1 0.2 0.3 0.4 0.5]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});

ylabel('Direction Selectivity Index','FontSize',14);
xlabel('Training Time','FontSize',14);

for j = 1:4, % For each epoch add individual animal averages
    
    jitter = rand(length(cdc.(epochs{j}).(loc).(avgs_name)),1) .* 0.2; % Jitter X
    x = jitter + j - mean(jitter);
    %plot(x,1 - cdc.(epochs{j}).(loc).(avgs_name),'k.','markersize',20);
    plot(x,cdc.(epochs{j}).(loc).(avgs_name),'k.','markersize',20);
end;



