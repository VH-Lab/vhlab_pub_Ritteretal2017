function [resps,dir,other] = cdcondition_age_get_exp_summary(cdc)

%
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

dir.cv_site_all = NaN;
dir.cv_site_avg = NaN;
dir.cv_site_ste = NaN;
dir.cv_pen_avgs = NaN;
dir.cv_pen_avg = NaN;
dir.cv_pen_ste = NaN;

dir.dcv_site_all = NaN;
dir.dcv_site_avg = NaN;
dir.dcv_site_ste = NaN;
dir.dcv_pen_avgs = NaN;
dir.dcv_pen_avg = NaN;
dir.dcv_pen_ste = NaN;

dir.mmm_site_all = NaN;
dir.mmm_site_avg = NaN;
dir.mmm_site_ste = NaN;
dir.mmm_pen_avgs = NaN;
dir.mmm_pen_avg = NaN;
dir.mmm_pen_ste = NaN;

dir.tot_site_all = NaN;
dir.tot_site_avg = NaN;
dir.tot_site_ste = NaN;
dir.tot_pen_avgs = NaN;
dir.tot_pen_avg = NaN;
dir.tot_pen_ste = NaN;

other.ori_dif_all = NaN;

numexps = length(cdc.exps);

for i = 1:numexps,
    
    resps.normresps_aligned_site_all = [resps.normresps_aligned_site_all; ...
        cdc.exps(i).resps.normresps_aligned_site_all];
    resps.normresps_aligned_pen_avgs = [resps.normresps_aligned_pen_avgs; ...
        cdc.exps(i).resps.normresps_aligned_pen_avgs];
    
    dir.cv_site_all = [dir.cv_site_all cdc.exps(i).dir.cv_site_all];
    dir.cv_pen_avgs = [dir.cv_pen_avgs cdc.exps(i).dir.cv_pen_avgs];
    dir.dcv_site_all = [dir.dcv_site_all cdc.exps(i).dir.dcv_site_all];
    dir.dcv_pen_avgs = [dir.dcv_pen_avgs cdc.exps(i).dir.dcv_pen_avgs];
    dir.mmm_site_all = [dir.mmm_site_all cdc.exps(i).dir.mmm_site_all];
    dir.mmm_pen_avgs = [dir.mmm_pen_avgs cdc.exps(i).dir.mmm_pen_avgs];
    dir.tot_site_all = [dir.tot_site_all cdc.exps(i).dir.tot_site_all];
    dir.tot_pen_avgs = [dir.tot_pen_avgs cdc.exps(i).dir.tot_pen_avgs];
    
    other.ori_dif_all = [other.ori_dif_all cdc.exps(i).other.ori_dif_all];
    
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



