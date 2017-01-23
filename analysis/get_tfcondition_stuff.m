function [speed,dir,other] = get_tfcondition_stuff(tfexps,tf)

% [STUFF] = GET_TFCONDITION_STUFF(TFEXPS,EPOCH) -
%
% INPUTS:
%       tfexps -
%       tf -
%
% OUTPUTS:
%       stuff - structure containing condition level information for given
%       tf.
%
% NOTES:
%
%
%


numexps = length(tfexps);

speed = struct(); % intitialize speed structure

speed.site_max_all = []; % Max response of site in Hz. Not blank subtracted.
speed.site_max_avg = [];
speed.site_max_ste = [];
speed.animal_max_avgs = [];
speed.animal_max_avg = [];
speed.animal_max_ste = [];

% site responses to preferred and null direction 
speed.site_pref_all = [];
speed.site_pref_avg = [];
speed.site_pref_ste = [];
speed.site_null_all = [];
speed.site_null_avg = [];
speed.site_null_ste = [];

% site std to preferred and null direction
speed.site_pref_std_all = [];
speed.site_pref_std_avg = [];
speed.site_pref_std_ste = [];
speed.site_null_std_all = [];
speed.site_null_std_avg = [];
speed.site_null_std_ste = [];

% animal average response to preffered and null direction
speed.animal_pref_all = [];
speed.animal_pref_avg = [];
speed.animal_pref_ste = [];
speed.animal_null_all = [];
speed.animal_null_avg = [];
speed.animal_null_ste = [];

% animal average std to preferred and null direction
speed.animal_pref_std_all = [];
speed.animal_pref_std_avg = [];
speed.animal_pref_std_ste = [];
speed.animal_null_std_all = [];
speed.animal_null_std_avg = [];
speed.animal_null_std_ste = [];

% Blank
speed.blank_site_all = [];
speed.blank_site_avg = [];
speed.blank_site_ste = [];
speed.blank_animal_avgs = [];
speed.blank_animal_avg = [];
speed.blank_animal_ste = [];
speed.blank_animal_median = [];
speed.blank_animal_medians = [];
speed.blank_animal_mad = [];

% Preferred speed in pref direction site and animal
speed.speed_pref_pref_site_all = [];
speed.speed_pref_pref_site_avg = [];
speed.speed_pref_pref_site_ste = [];
speed.speed_pref_pref_animal_avgs = []; 
speed.speed_pref_pref_animal_avg = [];
speed.speed_pref_pref_animal_ste = [];
speed.speed_pref_pref_animal_medians = [];
speed.speed_pref_pref_animal_median = [];
speed.speed_pref_pref_animal_mad = [];

% Max resp (in Hz) to preferred and null direction
speed.maxresp_pref_animal_median = [];
speed.maxresp_pref_animal_medians = [];
speed.maxresp_pref_animal_mad = [];
speed.maxresp_null_animal_median = [];
speed.maxresp_null_animal_medians = [];
speed.maxresp_null_animal_mad = [];

% Preferred speed in null direction site and animal
speed.speed_pref_null_site_all = [];
speed.speed_pref_null_site_avg = [];
speed.speed_pref_null_site_ste = [];
speed.speed_pref_null_animal_avgs = [];
speed.speed_pref_null_animal_avg = [];
speed.speed_pref_null_animal_ste = [];
speed.speed_pref_null_animal_medians = [];
speed.speed_pref_null_animal_median = [];
speed.speed_pref_null_animal_mad = [];



dir = struct(); % initialize dir structure

% All speeds

% 1 Hz
dir.dsi_all_1hz = [];
dir.dsi_site_avg_1hz = [];
dir.dsi_site_ste_1hz = [];
dir.dsi_avgs_1hz = [];
dir.dsi_animal_avg_1hz = [];
dir.dsi_animal_ste_1hz = [];

dir.tstat_all_1hz = [];
dir.tstat_site_avg_1hz = [];
dir.tstat_site_ste_1hz = [];
dir.tstat_avgs_1hz = [];
dir.tstat_animal_avg_1hz = [];
dir.tstat_animal_ste_1hz = [];

% 2 Hz
dir.dsi_all_2hz = [];
dir.dsi_site_avg_2hz = [];
dir.dsi_site_ste_2hz = [];
dir.dsi_avgs_2hz = [];
dir.dsi_animal_avg_2hz = [];
dir.dsi_animal_ste_2hz = [];

dir.tstat_all_2hz = [];
dir.tstat_site_avg_2hz = [];
dir.tstat_site_ste_2hz = [];
dir.tstat_avgs_2hz = [];
dir.tstat_animal_avg_2hz = [];
dir.tstat_animal_ste_2hz = [];

% 4hz
dir.dsi_all_4hz = [];
dir.dsi_site_avg_4hz = [];
dir.dsi_site_ste_4hz = [];
dir.dsi_avgs_4hz = [];
dir.dsi_animal_avg_4hz = [];
dir.dsi_animal_ste_4hz = [];

dir.tstat_all_4hz = [];
dir.tstat_site_avg_4hz = [];
dir.tstat_site_ste_4hz = [];
dir.tstat_avgs_4hz = [];
dir.tstat_animal_avg_4hz = [];
dir.tstat_animal_ste_4hz = [];

other = struct(); % initialize other structure

other.numcells = NaN;
other.filtered = 0;

for i = 1:numexps,
    
    % Speed
    speed.site_max_all = [speed.site_max_all tfexps(i).(tf).speed.max_all];
    speed.animal_max_avgs = [speed.animal_max_avgs tfexps(i).(tf).speed.max_avg];
    
    speed.site_pref_all =[speed.site_pref_all; tfexps(i).(tf).speed.pref_all];
    speed.site_null_all = [speed.site_null_all; tfexps(i).(tf).speed.null_all];
    
    speed.site_pref_std_all =[speed.site_pref_std_all; tfexps(i).(tf).speed.pref_std_all];
    speed.site_null_std_all = [speed.site_null_std_all; tfexps(i).(tf).speed.null_std_all];
    
    speed.animal_pref_all = [speed.animal_pref_all; tfexps(i).(tf).speed.pref_avg];
    speed.animal_null_all = [speed.animal_null_all; tfexps(i).(tf).speed.null_avg];
    
    speed.animal_pref_std_all = [speed.animal_pref_std_all; tfexps(i).(tf).speed.pref_std_avg];
    speed.animal_null_std_all = [speed.animal_null_std_all; tfexps(i).(tf).speed.null_std_avg];
    
    speed.maxresp_pref_animal_medians = [speed.maxresp_pref_animal_medians; tfexps(i).(tf).speed.maxresp_pref_median];
    speed.maxresp_null_animal_medians = [speed.maxresp_null_animal_medians; tfexps(i).(tf).speed.maxresp_null_median];
    
    % Blank
    speed.blank_site_all = [speed.blank_site_all tfexps(i).(tf).speed.blank_all];
    speed.blank_animal_avgs = [speed.blank_animal_avgs tfexps(i).(tf).speed.blank_avg];
    speed.blank_animal_medians = [speed.blank_animal_medians tfexps(i).(tf).speed.blank_median];
    
    % Preferred speed in pref and null directions
    speed.speed_pref_pref_site_all = [speed.speed_pref_pref_site_all tfexps(i).(tf).speed.speed_pref_pref_all];
    speed.speed_pref_pref_animal_avgs = [speed.speed_pref_pref_animal_avgs tfexps(i).(tf).speed.speed_pref_pref_avg];
    speed.speed_pref_pref_animal_medians = [speed.speed_pref_pref_animal_medians tfexps(i).(tf).speed.speed_pref_pref_median];
    speed.speed_pref_null_site_all = [speed.speed_pref_null_site_all tfexps(i).(tf).speed.speed_pref_null_all];
    speed.speed_pref_null_animal_avgs = [speed.speed_pref_null_animal_avgs tfexps(i).(tf).speed.speed_pref_null_avg];
    speed.speed_pref_null_animal_medians = [speed.speed_pref_null_animal_medians tfexps(i).(tf).speed.speed_pref_null_median];
    
    % Dir All Speeds
    
    
    % 1 Hz DSI
    dir.dsi_all_1hz = [dir.dsi_all_1hz tfexps(i).(tf).dir.mmm_1hz_all];
    dir.dsi_avgs_1hz = [dir.dsi_avgs_1hz tfexps(i).(tf).dir.mmm_1hz_avg];
    dir.tstat_all_1hz = [dir.tstat_all_1hz tfexps(i).(tf).dir.tstat_1hz_all];
    dir.tstat_avgs_1hz = [dir.tstat_avgs_1hz tfexps(i).(tf).dir.tstat_1hz_avg];
    
    % 2 Hz DSI
    dir.dsi_all_2hz = [dir.dsi_all_2hz tfexps(i).(tf).dir.mmm_2hz_all];
    dir.dsi_avgs_2hz = [dir.dsi_avgs_2hz tfexps(i).(tf).dir.mmm_2hz_avg];
    dir.tstat_all_2hz = [dir.tstat_all_2hz tfexps(i).(tf).dir.tstat_2hz_all];
    dir.tstat_avgs_2hz = [dir.tstat_avgs_2hz tfexps(i).(tf).dir.tstat_2hz_avg];
    
    % 4 Hz DSI
    dir.dsi_all_4hz = [dir.dsi_all_4hz tfexps(i).(tf).dir.mmm_4hz_all];
    dir.dsi_avgs_4hz = [dir.dsi_avgs_4hz tfexps(i).(tf).dir.mmm_4hz_avg];
    dir.tstat_all_4hz = [dir.tstat_all_4hz tfexps(i).(tf).dir.tstat_4hz_all];
    dir.tstat_avgs_4hz = [dir.tstat_avgs_4hz tfexps(i).(tf).dir.tstat_4hz_avg];
    
    % Other
    other.filtered = other.filtered + tfexps(i).(tf).other.filtered;
       
end;


speed.site_max_avg = nanmean(speed.site_max_all);
speed.site_max_ste = nanstderr(speed.site_max_all);
speed.animal_max_avg = nanmean(speed.animal_max_avgs);
speed.animal_max_ste = nanstderr(speed.animal_max_avgs);

speed.site_pref_avg = nanmean(speed.site_pref_all);
speed.site_pref_ste = nanstderr(speed.site_pref_all);
speed.site_null_avg = nanmean(speed.site_null_all);
speed.site_null_ste = nanstderr(speed.site_null_all);

speed.site_pref_std_avg = nanmean(speed.site_pref_std_all);
speed.site_pref_std_ste = nanstderr(speed.site_pref_std_all);
speed.site_null_std_avg = nanmean(speed.site_null_std_all);
speed.site_null_std_ste = nanstderr(speed.site_null_std_all);

speed.animal_pref_avg = nanmean(speed.animal_pref_all); % animal average
speed.animal_pref_ste = nanstderr(speed.animal_pref_all);
speed.animal_null_avg = nanmean(speed.animal_null_all); % animal average
speed.animal_null_ste = nanstderr(speed.animal_null_all);

speed.animal_pref_std_avg = nanmean(speed.animal_pref_std_all); % animal average
speed.animal_pref_std_ste = nanstderr(speed.animal_pref_std_all);
speed.animal_null_std_avg = nanmean(speed.animal_null_std_all); % animal average
speed.animal_null_std_ste = nanstderr(speed.animal_null_std_all);

speed.blank_site_avg = nanmean(speed.blank_site_all); % site average
speed.blank_site_ste = nanstderr(speed.blank_site_all); % site ste
speed.blank_animal_avg = nanmean(speed.blank_animal_avgs); % animal averages
speed.blank_animal_ste = nanstderr(speed.blank_animal_avgs); % animal ste
speed.blank_animal_median = nanmedian(speed.blank_animal_medians);
speed.blank_animal_mad = mad(speed.blank_animal_medians,1);

speed.speed_pref_pref_site_avg = nanmean(speed.speed_pref_pref_site_all); % site average
speed.speed_pref_pref_site_ste = nanstderr(speed.speed_pref_pref_site_all);
speed.speed_pref_pref_animal_avg = nanmean(speed.speed_pref_pref_animal_avgs); % animal average
speed.speed_pref_pref_animal_ste = nanstderr(speed.speed_pref_pref_animal_avgs);
speed.speed_pref_pref_animal_median = nanmedian(speed.speed_pref_pref_animal_medians);
speed.speed_pref_pref_animal_mad = mad(speed.speed_pref_pref_animal_medians,1);

speed.speed_pref_null_site_avg = nanmean(speed.speed_pref_null_site_all); % site average
speed.speed_pref_null_site_ste = nanstderr(speed.speed_pref_null_site_all);
speed.speed_pref_null_animal_avg = nanmean(speed.speed_pref_null_animal_avgs); % animal average
speed.speed_pref_null_animal_ste = nanstderr(speed.speed_pref_null_animal_avgs);
speed.speed_pref_null_animal_median = nanmedian(speed.speed_pref_null_animal_medians);
speed.speed_pref_null_animal_mad = mad(speed.speed_pref_null_animal_medians,1);

speed.maxresp_pref_animal_median = nanmedian(speed.maxresp_pref_animal_medians);
speed.maxresp_pref_animal_mad = mad(speed.maxresp_pref_animal_medians,1);
speed.maxresp_null_animal_median = nanmedian(speed.maxresp_null_animal_medians);
speed.maxresp_null_animal_mad = mad(speed.maxresp_null_animal_medians,1);

% Dir 1Hz
dir.dsi_animal_avg_1hz = nanmean(dir.dsi_avgs_1hz); % animal average
dir.dsi_animal_ste_1hz = nanstderr(dir.dsi_avgs_1hz); % animal ste
dir.dsi_site_avg_1hz = nanmean(dir.dsi_all_1hz); % site average
dir.dsi_site_ste_1hz = nanstderr(dir.dsi_all_1hz); % site ste
dir.tstat_animal_avg_1hz = nanmean(dir.tstat_avgs_1hz); % animal average
dir.tstat_animal_ste_1hz = nanstderr(dir.tstat_avgs_1hz); % animal ste
dir.tstat_site_avg_1hz = nanmean(dir.tstat_all_1hz); % site average
dir.tstat_site_ste_1hz = nanstderr(dir.tstat_all_1hz); % site ste

% Dir 2Hz
dir.dsi_animal_avg_2hz = nanmean(dir.dsi_avgs_2hz); % animal average
dir.dsi_animal_ste_2hz = nanstderr(dir.dsi_avgs_2hz); % animal ste
dir.dsi_site_avg_2hz = nanmean(dir.dsi_all_2hz); % site average
dir.dsi_site_ste_2hz = nanstderr(dir.dsi_all_2hz); % site ste
dir.tstat_animal_avg_2hz = nanmean(dir.tstat_avgs_2hz); % animal average
dir.tstat_animal_ste_2hz = nanstderr(dir.tstat_avgs_2hz); % animal ste
dir.tstat_site_avg_2hz = nanmean(dir.tstat_all_2hz); % site average
dir.tstat_site_ste_2hz = nanstderr(dir.tstat_all_2hz); % site ste

% Dir 4Hz
dir.dsi_animal_avg_4hz = nanmean(dir.dsi_avgs_4hz); % animal average
dir.dsi_animal_ste_4hz = nanstderr(dir.dsi_avgs_4hz); % animal ste
dir.dsi_site_avg_4hz = nanmean(dir.dsi_all_4hz); % site average
dir.dsi_site_ste_4hz = nanstderr(dir.dsi_all_4hz); % site ste
dir.tstat_animal_avg_4hz = nanmean(dir.tstat_avgs_4hz); % animal average
dir.tstat_animal_ste_4hz = nanstderr(dir.tstat_avgs_4hz); % animal ste
dir.tstat_site_avg_4hz = nanmean(dir.tstat_all_4hz); % site average
dir.tstat_site_ste_4hz = nanstderr(dir.tstat_all_4hz); % site ste

other.numcells = length(find(~isnan(dir.dsi_all_1hz)));






