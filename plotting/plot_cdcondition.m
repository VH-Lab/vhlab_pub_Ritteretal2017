function plot_cdcondition(cdc)

%
%
%
%
%
%
%


% ----- Coarse Direction Tuning
plot_cdcondition_tuning(cdc);
plot_cdcondition_polar(cdc);

% ----- Direction Indices
%plot_cdcondition_bar_lsim
plot_cdcondition_bar(cdc);
plot_cdcondition_cumhist(cdc);

% ----- Other
plot_cdcondition_ori_dif(cdc);
plot_cdcondition_tunewidth(cdc);
plot_cdcondition_tunewidth_cumhist(cdc);