function [speed,dir,other] = tfcondition_age_get_exp_summary(tfc_age)

%
%
%
%
%
%
%


numexps = length(tfc_age.exps);

speed.site_pref_all = NaN(1,11);
speed.site_pref_avg = NaN;
speed.site_pref_ste = NaN;
speed.exp_pref_avgs = NaN(1,11);
speed.exp_pref_avg = NaN;
speed.exp_pref_ste = NaN;

speed.site_null_all = NaN(1,11);
speed.site_null_avg = NaN;
speed.site_null_ste = NaN;
speed.exp_null_avgs = NaN(1,11);
speed.exp_null_avg = NaN;
speed.exp_null_ste = NaN;

speed.site_blank_all = NaN;
speed.site_blank_avg = NaN;
speed.site_blank_ste = NaN;
speed.exp_blank_avgs = NaN;
speed.exp_blank_avg = NaN;
speed.exp_blank_ste = NaN;

speed.site_speed_pref_all = NaN; % each cells single pref speed
speed.site_speed_pref_avg = NaN;
speed.site_speed_pref_ste = NaN;
speed.exp_speed_pref_avgs = NaN;
speed.exp_speed_pref_avg = NaN;
speed.exp_speed_pref_ste = NaN;

dir.mmm_site_all = NaN(1,11);
dir.mmm_site_avg = NaN;
dir.mmm_site_ste = NaN;
dir.mmm_exp_avgs = NaN(1,11);
dir.mmm_exp_avg = NaN;
dir.mmm_exp_ste = NaN;

dir.mmm_site_1hz_all = NaN;
dir.mmm_site_1hz_avg = NaN;
dir.mmm_site_1hz_ste = NaN;
dir.mmm_exp_1hz_avgs = NaN;
dir.mmm_exp_1hz_avg = NaN;
dir.mmm_exp_1hz_avg = NaN;

dir.mmm_site_2hz_all = NaN;
dir.mmm_site_2hz_avg = NaN;
dir.mmm_site_2hz_ste = NaN;
dir.mmm_exp_2hz_avgs = NaN;
dir.mmm_exp_2hz_avg = NaN;
dir.mmm_exp_2hz_ste = NaN;

dir.mmm_site_4hz_all = NaN;
dir.mmm_site_4hz_avg = NaN;
dir.mmm_site_4hz_ste = NaN;
dir.mmm_exp_4hz_avgs = NaN;
dir.mmm_exp_4hz_avg = NaN;
dir.mmm_exp_4hz_ste = NaN;

other.numcells = NaN;

for i = 1:numexps,
    
    speed.site_pref_all = [speed.site_pref_all; tfc_age.exps(i).speed.site_pref_all];
    speed.exp_pref_avgs = [speed.exp_pref_avgs; tfc_age.exps(i).speed.site_pref_avg];
    
    speed.site_null_all = [speed.site_null_all; tfc_age.exps(i).speed.site_null_all];
    speed.exp_null_avgs = [speed.exp_null_avgs; tfc_age.exps(i).speed.site_null_avg];
    
    speed.site_blank_all = [speed.site_blank_all tfc_age.exps(i).speed.site_blank_all];
    speed.exp_blank_avgs = [speed.exp_blank_avgs tfc_age.exps(i).speed.site_blank_avg];
    
    speed.site_speed_pref_all = [speed.site_speed_pref_all tfc_age.exps(i).speed.site_speed_pref_all];
    speed.exp_speed_pref_avgs = [speed.exp_speed_pref_avgs tfc_age.exps(i).speed.site_speed_pref_avg];
    
    dir.mmm_site_all = [dir.mmm_site_all; tfc_age.exps(i).dir.mmm_site_all];
    dir.mmm_exp_avgs = [dir.mmm_exp_avgs; tfc_age.exps(i).dir.mmm_site_avg];
    
    dir.mmm_site_1hz_all = [dir.mmm_site_1hz_all tfc_age.exps(i).dir.mmm_site_1hz_all];
    dir.mmm_exp_1hz_avgs = [dir.mmm_exp_1hz_avgs tfc_age.exps(i).dir.mmm_site_1hz_avg];
    
    dir.mmm_site_2hz_all = [dir.mmm_site_2hz_all tfc_age.exps(i).dir.mmm_site_2hz_all];
    dir.mmm_exp_2hz_avgs = [dir.mmm_exp_2hz_avgs tfc_age.exps(i).dir.mmm_site_2hz_avg];
    
    dir.mmm_site_4hz_all = [dir.mmm_site_4hz_all tfc_age.exps(i).dir.mmm_site_4hz_all];
    dir.mmm_exp_4hz_avgs = [dir.mmm_exp_4hz_avgs tfc_age.exps(i).dir.mmm_site_4hz_avg];
    
end;

speed.site_pref_avg = nanmean(speed.site_pref_all);
speed.site_pref_ste = nanstderr(speed.site_pref_all);
speed.exp_pref_avg = nanmean(speed.exp_pref_avgs);
speed.exp_pref_ste = nanstderr(speed.exp_pref_avgs);

speed.site_null_avg = nanmean(speed.site_null_all);
speed.site_null_ste = nanstderr(speed.site_null_all);
speed.exp_null_avg = nanmean(speed.exp_null_avgs);
speed.exp_null_ste = nanstderr(speed.exp_null_avgs);

speed.site_blank_avg = nanmean(speed.site_blank_all);
speed.site_blank_ste = nanstderr(speed.site_blank_all);
speed.exp_blank_avg = nanmean(speed.exp_blank_avgs);
speed.exp_blank_ste = nanstderr(speed.exp_blank_avgs);

speed.site_speed_pref_avg = nanmean(speed.site_speed_pref_all);
speed.site_speed_pref_ste = nanstderr(speed.site_speed_pref_all);
speed.exp_speed_pref_avg = nanmean(speed.exp_speed_pref_avgs);
speed.exp_speed_pref_ste = nanstderr(speed.exp_speed_pref_avgs);

dir.mmm_site_avg = nanmean(dir.mmm_site_all);
dir.mmm_site_ste = nanstderr(dir.mmm_site_all);
dir.mmm_exp_avg = nanmean(dir.mmm_exp_avgs);
dir.mmm_exp_ste = nanstderr(dir.mmm_exp_avgs);

dir.mmm_site_1hz_avg = nanmean(dir.mmm_site_1hz_all);
dir.mmm_site_1hz_ste = nanstderr(dir.mmm_site_1hz_all);
dir.mmm_exp_1hz_avg = nanmean(dir.mmm_exp_1hz_avgs);
dir.mmm_exp_1hz_ste = nanstderr(dir.mmm_exp_1hz_avgs);

dir.mmm_site_2hz_avg = nanmean(dir.mmm_site_2hz_all);
dir.mmm_site_2hz_ste = nanstderr(dir.mmm_site_2hz_all);
dir.mmm_exp_2hz_avg = nanmean(dir.mmm_exp_2hz_avgs);
dir.mmm_exp_2hz_ste = nanstderr(dir.mmm_exp_2hz_avgs);

dir.mmm_site_4hz_avg = nanmean(dir.mmm_site_4hz_all);
dir.mmm_site_4hz_ste = nanstderr(dir.mmm_site_4hz_all);
dir.mmm_exp_4hz_avg = nanmean(dir.mmm_exp_4hz_avgs);
dir.mmm_exp_4hz_ste = nanstderr(dir.mmm_exp_4hz_avgs);

other.numcells = length(find(~isnan(speed.site_pref_all(:,1))));










