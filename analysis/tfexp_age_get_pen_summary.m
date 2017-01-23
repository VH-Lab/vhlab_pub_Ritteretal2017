function [speed,dir,other] = tfexp_age_get_pen_summary(tfexp_age)

% [SPEED,DIR,OTHER] = TFEXP_AGE_GET_PEN_SUMMARY(TFEXP_AGE) - Pulls out all
% individual penetration information from tfexp_age and finds summary
% statistics (both for total site from all penetrations and penetration
% averages).
%
%
%
%
%
%
%
%
%

% Initialize everything

speed.site_pref_all = NaN(1,11);
speed.site_pref_avg = NaN;
speed.site_pref_ste = NaN;
speed.pen_pref_avgs = NaN(1,11);
speed.pen_pref_avg = NaN;
speed.pen_pref_ste = NaN;

speed.site_null_all = NaN(1,11);
speed.site_null_avg = NaN;
speed.site_null_ste = NaN;
speed.pen_null_avgs = NaN(1,11);
speed.pen_null_avg = NaN;
speed.pen_null_ste = NaN;

speed.site_blank_all = NaN;
speed.site_blank_avg = NaN;
speed.site_blank_ste = NaN;
speed.pen_blank_avgs = NaN;
speed.pen_blank_avg = NaN;
speed.pen_blank_ste = NaN;

speed.site_speed_pref_all = NaN; % each cells single pref speed
speed.site_speed_pref_avg = NaN;
speed.site_speed_pref_ste = NaN;
speed.pen_speed_pref_avgs = NaN;
speed.pen_speed_pref_avg = NaN;
speed.pen_speed_pref_ste = NaN;

dir.mmm_site_all = NaN(1,11); 
dir.mmm_site_avg = NaN;
dir.mmm_site_ste = NaN;
dir.mmm_pen_avgs = NaN(1,11);
dir.mmm_pen_avg = NaN;
dir.mmm_pen_ste = NaN;

dir.mmm_site_1hz_all = NaN;
dir.mmm_site_1hz_avg = NaN;
dir.mmm_site_1hz_ste = NaN;
dir.mmm_pen_1hz_avgs = NaN;
dir.mmm_pen_1hz_avg = NaN;
dir.mmm_pen_1hz_avg = NaN;

dir.mmm_site_2hz_all = NaN;
dir.mmm_site_2hz_avg = NaN;
dir.mmm_site_2hz_ste = NaN;
dir.mmm_pen_2hz_avgs = NaN;
dir.mmm_pen_2hz_avg = NaN;
dir.mmm_pen_2hz_ste = NaN;

dir.mmm_site_4hz_all = NaN;
dir.mmm_site_4hz_avg = NaN;
dir.mmm_site_4hz_ste = NaN;
dir.mmm_pen_4hz_avgs = NaN;
dir.mmm_pen_4hz_avg = NaN;
dir.mmm_pen_4hz_ste = NaN;

other.numcells = NaN;


num_pens = length(tfexp_age.pen_names);

for i = 1:num_pens,
    
    speed.site_pref_all = [speed.site_pref_all; tfexp_age.pen_info(i).speed.pref_all];
    speed.pen_pref_avgs = [speed.pen_pref_avgs; tfexp_age.pen_info(i).speed.pref_avg];
    
    speed.site_null_all = [speed.site_null_all; tfexp_age.pen_info(i).speed.null_all];
    speed.pen_null_avgs = [speed.pen_null_avgs; tfexp_age.pen_info(i).speed.null_avg];
    
    speed.site_blank_all = [speed.site_blank_all tfexp_age.pen_info(i).speed.blank_all];
    speed.pen_blank_avgs = [speed.pen_blank_avgs tfexp_age.pen_info(i).speed.blank_avg];
    
    speed.site_speed_pref_all = [speed.site_speed_pref_all tfexp_age.pen_info(i).speed.speed_pref_all];
    speed.pen_speed_pref_avgs = [speed.pen_speed_pref_avgs tfexp_age.pen_info(i).speed.speed_pref_avg];
    
    dir.mmm_site_all = [dir.mmm_site_all; tfexp_age.pen_info(i).dir.mmm_all];
    dir.mmm_pen_avgs = [dir.mmm_pen_avgs; tfexp_age.pen_info(i).dir.mmm_avg];
    
    dir.mmm_site_1hz_all = [dir.mmm_site_1hz_all tfexp_age.pen_info(i).dir.mmm_1hz_all];
    dir.mmm_pen_1hz_avgs = [dir.mmm_pen_1hz_avgs tfexp_age.pen_info(i).dir.mmm_1hz_avg];
    
    dir.mmm_site_2hz_all = [dir.mmm_site_2hz_all tfexp_age.pen_info(i).dir.mmm_2hz_all];
    dir.mmm_pen_2hz_avgs = [dir.mmm_pen_2hz_avgs tfexp_age.pen_info(i).dir.mmm_2hz_avg];
    
    dir.mmm_site_4hz_all = [dir.mmm_site_4hz_all tfexp_age.pen_info(i).dir.mmm_4hz_all];
    dir.mmm_pen_4hz_avgs = [dir.mmm_pen_4hz_avgs tfexp_age.pen_info(i).dir.mmm_4hz_avg];
    
end;



speed.site_pref_avg = nanmean(speed.site_pref_all);
speed.site_pref_ste = nanstderr(speed.site_pref_all);
speed.pen_pref_avg = nanmean(speed.pen_pref_avgs);
speed.pen_pref_ste = nanstderr(speed.pen_pref_avgs);

speed.site_null_avg = nanmean(speed.site_null_all);
speed.site_null_ste = nanstderr(speed.site_null_all);
speed.pen_null_avg = nanmean(speed.pen_null_avgs);
speed.pen_null_ste = nanstderr(speed.pen_null_avgs);

speed.site_blank_avg = nanmean(speed.site_blank_all);
speed.site_blank_ste = nanstderr(speed.site_blank_all);
speed.pen_blank_avg = nanmean(speed.pen_blank_avgs);
speed.pen_blank_ste = nanstderr(speed.pen_blank_avgs);

speed.site_speed_pref_avg = nanmean(speed.site_speed_pref_all);
speed.site_speed_pref_ste = nanstderr(speed.site_speed_pref_all);
speed.pen_speed_pref_avg = nanmean(speed.pen_speed_pref_avgs);
speed.pen_speed_pref_ste = nanstderr(speed.pen_speed_pref_avgs);

dir.mmm_site_avg = nanmean(dir.mmm_site_all);
dir.mmm_site_ste = nanstderr(dir.mmm_site_all);
dir.mmm_pen_avg = nanmean(dir.mmm_pen_avgs);
dir.mmm_pen_ste = nanstderr(dir.mmm_pen_avgs);

dir.mmm_site_1hz_avg = nanmean(dir.mmm_site_1hz_all);
dir.mmm_site_1hz_ste = nanstderr(dir.mmm_site_1hz_all);
dir.mmm_pen_1hz_avg = nanmean(dir.mmm_pen_1hz_avgs);
dir.mmm_pen_1hz_ste = nanstderr(dir.mmm_pen_1hz_avgs);

dir.mmm_site_2hz_avg = nanmean(dir.mmm_site_2hz_all);
dir.mmm_site_2hz_ste = nanstderr(dir.mmm_site_2hz_all);
dir.mmm_pen_2hz_avg = nanmean(dir.mmm_pen_2hz_avgs);
dir.mmm_pen_2hz_ste = nanstderr(dir.mmm_pen_2hz_avgs);

dir.mmm_site_4hz_avg = nanmean(dir.mmm_site_4hz_all);
dir.mmm_site_4hz_ste = nanstderr(dir.mmm_site_4hz_all);
dir.mmm_pen_4hz_avg = nanmean(dir.mmm_pen_4hz_avgs);
dir.mmm_pen_4hz_ste = nanstderr(dir.mmm_pen_4hz_avgs);

other.numcells = length(find(~isnan(speed.site_pref_all(:,1))));


