function [resps,dir,other] = cdexp_age_get_summary(cdexp_age)

%
%
%
%
%
%





% Initialize Everything

resps.normresps_aligned_site_all = NaN(1,12);
resps.normresps_aligned_site_avg = NaN(1,12);
resps.normresps_aligned_site_ste = NaN(1,12);
resps.normresps_aligned_pen_avgs = NaN(1,12);
resps.normresps_aligned_pen_avg = NaN(1,12);
resps.normresps_aligned_pen_ste = NaN(1,12);

dir.cv_site_all = NaN; % Circular Variance
dir.cv_site_avg = NaN;
dir.cv_site_ste = NaN;
dir.cv_pen_avgs = NaN;
dir.cv_pen_avg = NaN;
dir.cv_pen_ste = NaN;

dir.dcv_site_all = NaN; % DirCircular Variance
dir.dcv_site_avg = NaN;
dir.dcv_site_ste = NaN;
dir.dcv_pen_avgs = NaN;
dir.dcv_pen_avg = NaN;
dir.dcv_pen_ste = NaN;

dir.mmm_site_all = NaN; % (Max - Oppopsite) / Max
dir.mmm_site_avg = NaN;
dir.mmm_site_ste = NaN;
dir.mmm_pen_avgs = NaN;
dir.mmm_pen_avg = NaN;
dir.mmm_pen_ste = NaN;

dir.tot_site_all = NaN; % (Max_Trained_Dir_Resp - Opp) / Max_Trained_Dir_Resp
dir.tot_site_avg = NaN;
dir.tot_site_ste = NaN;
dir.tot_pen_avgs = NaN;
dir.tot_pen_avg = NaN;
dir.tot_pen_ste = NaN;

other.ori_dif_all = NaN;

num_pens = length(cdexp_age.pen_names);

for i = 1:num_pens,
    
    resps.normresps_aligned_site_all = [resps.normresps_aligned_site_all; ...
        cdexp_age.pen_info(i).resps.normresps_aligned_all];
    resps.normresps_aligned_pen_avgs = [resps.normresps_aligned_pen_avgs; ...
        cdexp_age.pen_info(i).resps.normresps_aligned_avg];
    
    dir.cv_site_all = [dir.cv_site_all cdexp_age.pen_info(i).dir.cv_site_all];
    dir.cv_pen_avgs = [dir.cv_pen_avgs cdexp_age.pen_info(i).dir.cv_site_avg];
    dir.dcv_site_all = [dir.dcv_site_all cdexp_age.pen_info(i).dir.dcv_site_all];
    dir.dcv_pen_avgs = [dir.dcv_pen_avgs cdexp_age.pen_info(i).dir.dcv_site_avg];
    dir.mmm_site_all = [dir.mmm_site_all cdexp_age.pen_info(i).dir.mmm_site_all];
    dir.mmm_pen_avgs = [dir.mmm_pen_avgs cdexp_age.pen_info(i).dir.mmm_site_avg];
    dir.tot_site_all = [dir.tot_site_all cdexp_age.pen_info(i).dir.tot_site_all];
    dir.tot_pen_avgs = [dir.tot_pen_avgs cdexp_age.pen_info(i).dir.tot_site_avg];
    
    other.ori_dif_all = [other.ori_dif_all cdexp_age.pen_info(i).other.ori_dif_all];
    
end;

resps.normresps_aligned_site_avg = nanmean(resps.normresps_aligned_site_all);
resps.normresps_aligned_site_ste = nanstderr(resps.normresps_aligned_site_all);
resps.normresps_aligned_pen_avg = nanmean(resps.normresps_aligned_pen_avgs);
resps.normresps_aligned_pen_ste = nanstderr(resps.normresps_aligned_pen_avgs);


dir.cv_site_avg = nanmean(dir.cv_site_all);
dir.cv_site_ste = nanstderr(dir.cv_site_all);
dir.cv_pen_avg = nanmean(dir.cv_pen_avgs);
dir.cv_pen_ste = nanstderr(dir.cv_pen_avgs);

dir.dcv_site_avg = nanmean(dir.dcv_site_all);
dir.dcv_site_ste = nanstderr(dir.dcv_site_all);
dir.dcv_pen_avg = nanmean(dir.dcv_pen_avgs);
dir.dcv_pen_ste = nanstderr(dir.dcv_pen_avgs);

dir.mmm_site_avg = nanmean(dir.mmm_site_all);
dir.mmm_site_ste = nanstderr(dir.mmm_site_all);
dir.mmm_pen_avg = nanmean(dir.mmm_pen_avgs);
dir.mmm_pen_ste = nanstderr(dir.mmm_pen_avgs);

dir.tot_site_avg = nanmean(dir.tot_site_all);
dir.tot_site_ste = nanstderr(dir.tot_site_all);
dir.tot_pen_avg = nanmean(dir.tot_pen_avgs);
dir.tot_pen_ste = nanstderr(dir.tot_pen_avgs);













