function [CD] = cdcondition_get_exp_summary(exps,epoch)

%
%
%
%
%
%
%



% Initialize Everything

CD.resps.normresps_aligned_site_all = NaN(1,12);
CD.resps.normresps_aligned_site_avg = NaN(1,12);
CD.resps.normresps_aligned_site_ste = NaN(1,12);
CD.resps.normresps_aligned_exp_avgs = NaN(1,12);
CD.resps.normresps_aligned_exp_avg = NaN(1,12);
CD.resps.normresps_aligned_exp_ste = NaN(1,12);

CD.dir.cv_site_all = [];
CD.dir.cv_site_avg = [];
CD.dir.cv_site_ste = [];
CD.dir.cv_exp_avgs = [];
CD.dir.cv_exp_avg = [];
CD.dir.cv_exp_ste = [];

CD.dir.dcv_site_all = [];
CD.dir.dcv_site_avg = [];
CD.dir.dcv_site_ste = [];
CD.dir.dcv_exp_avgs = [];
CD.dir.dcv_exp_avg = [];
CD.dir.dcv_exp_ste = [];

CD.dir.mmm_site_all = [];
CD.dir.mmm_site_avg = [];
CD.dir.mmm_site_ste = [];
CD.dir.mmm_exp_avgs = [];
CD.dir.mmm_exp_avg = [];
CD.dir.mmm_exp_ste = [];

CD.dir.tot_site_all = [];
CD.dir.tot_site_avg = [];
CD.dir.tot_site_ste = [];
CD.dir.tot_exp_avgs = [];
CD.dir.tot_exp_avg = [];
CD.dir.tot_exp_ste = [];

CD.other.ori_dif_all = [];
CD.other.numcells = [];
CD.other.filtered = 0;

CD.other.tunewidth_animal_avgs = [];
CD.other.tunewidth_animal_avg = [];
CD.other.tunewidth_animal_ste = [];
CD.other.tunewidth_site_all = [];
CD.other.tunewidth_site_avg = [];
CD.other.tunewidth_site_ste = [];


numexps = length(exps);

for i = 1:numexps,
    
    CD.resps.normresps_aligned_site_all = [CD.resps.normresps_aligned_site_all; ...
        exps(i).(epoch).resps.normresps_aligned_all];
    CD.resps.normresps_aligned_exp_avgs = [CD.resps.normresps_aligned_exp_avgs; ...
        exps(i).(epoch).resps.normresps_aligned_avg];
    
    CD.dir.cv_site_all = [CD.dir.cv_site_all exps(i).(epoch).dir.cv_site_all];
    CD.dir.cv_exp_avgs = [CD.dir.cv_exp_avgs exps(i).(epoch).dir.cv_site_avg];
    CD.dir.dcv_site_all = [CD.dir.dcv_site_all exps(i).(epoch).dir.dcv_site_all];
    CD.dir.dcv_exp_avgs = [CD.dir.dcv_exp_avgs exps(i).(epoch).dir.dcv_site_avg];
    CD.dir.mmm_site_all = [CD.dir.mmm_site_all exps(i).(epoch).dir.mmm_site_all];
    CD.dir.mmm_exp_avgs = [CD.dir.mmm_exp_avgs exps(i).(epoch).dir.mmm_site_avg];
    CD.dir.tot_site_all = [CD.dir.tot_site_all exps(i).(epoch).dir.tot_site_all];
    CD.dir.tot_exp_avgs = [CD.dir.tot_exp_avgs exps(i).(epoch).dir.tot_site_avg];
    
    % Other
    CD.other.ori_dif_all = [CD.other.ori_dif_all exps(i).(epoch).other.ori_dif_all];
    CD.other.filtered = CD.other.filtered + exps(i).(epoch).other.filtered;
    CD.other.tunewidth_animal_avgs = [CD.other.tunewidth_animal_avgs exps(i).(epoch).other.tunewidth_avg];
    CD.other.tunewidth_site_all = [CD.other.tunewidth_site_all exps(i).(epoch).other.tunewidth_all];
    
end;


CD.resps.normresps_aligned_site_avg = nanmean(CD.resps.normresps_aligned_site_all);
CD.resps.normresps_aligned_site_ste = nanstderr(CD.resps.normresps_aligned_site_all);
CD.resps.normresps_aligned_exp_avg = nanmean(CD.resps.normresps_aligned_exp_avgs);
CD.resps.normresps_aligned_exp_ste = nanstderr(CD.resps.normresps_aligned_exp_avgs);

CD.dir.cv_site_avg = nanmean(CD.dir.cv_site_all);
CD.dir.cv_site_ste = nanstderr(CD.dir.cv_site_all);
CD.dir.cv_exp_avg = nanmean(CD.dir.cv_exp_avgs);
CD.dir.cv_exp_ste = nanstderr(CD.dir.cv_exp_avgs);
CD.dir.dcv_site_avg = nanmean(CD.dir.dcv_site_all);
CD.dir.dcv_site_ste = nanstderr(CD.dir.dcv_site_all);
CD.dir.dcv_exp_avg = nanmean(CD.dir.dcv_exp_avgs);
CD.dir.dcv_exp_ste = nanstderr(CD.dir.dcv_exp_avgs);
CD.dir.mmm_site_avg = nanmean(CD.dir.mmm_site_all);
CD.dir.mmm_site_ste = nanstderr(CD.dir.mmm_site_all);
CD.dir.mmm_exp_avg = nanmean(CD.dir.mmm_exp_avgs);
CD.dir.mmm_exp_ste = nanstderr(CD.dir.mmm_exp_avgs);
CD.dir.tot_site_avg = nanmean(CD.dir.tot_site_all);
CD.dir.tot_site_ste = nanstderr(CD.dir.tot_site_all);
CD.dir.tot_exp_avg = nanmean(CD.dir.tot_exp_avgs);
CD.dir.tot_exp_ste = nanstderr(CD.dir.tot_exp_avgs);

CD.other.numcells = length(find(~isnan(CD.dir.cv_site_all)));

CD.other.tunewidth_animal_avg = nanmean(CD.other.tunewidth_animal_avgs);
CD.other.tunewidth_animal_ste = nanstderr(CD.other.tunewidth_animal_avgs);
CD.other.tunewidth_site_avg = nanmean(CD.other.tunewidth_site_all);
CD.other.tunewidth_site_ste = nanstderr(CD.other.tunewidth_site_all);

% FITS






