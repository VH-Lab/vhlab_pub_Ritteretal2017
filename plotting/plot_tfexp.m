function plot_tfexp(tfexp)

% PLOT_TFEXP(TFEXP) - All plots for single tfexp
%
% INPUTS:
%       tfexp -
%
% OUTPUTS:
%
%
% NOTES:
% -
%
%


% ----- Speed Tuning Average
plot_tfexp_speed(tfexp);


% ----- Speed Tuning Single Cells
plot_tfexp_singlecells(tfexp);


% ----- Diriction Indices Averages

plot_tfexp_bar(tfexp);
plot_tfexp_cumhist(tfexp);
%plot_tfexp_dir(tfexp); % this one seems pretty useless

% ----- Plot Other
plot_tfexp_blank(tfexp);
plot_tfexp_prefspeed(tfexp);












