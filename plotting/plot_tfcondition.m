function plot_tfcondition(tfc)

%
%
%
%
%
%
%
%




% Speed Tuning Average

plot_tfcondition_speed(tfc);
%plot_tfcondition_speed_lsim(tfc);

% Direction Indices

plot_tfcondition_bar_old(tfc); % see plot_tfcondition_bar.m
plot_tfcondition_cumhist(tfc);
plot_tfcondition_tstat_bar(tfc);

% Other

plot_tfcondition_blank(tfc);
plot_tfcondition_prefspeed(tfc);
%plot_tfcondition_prefspeed_box(tfc);
plot_tfcondition_maxresp(tfc);









