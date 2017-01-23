function [resps,dir,other] = cdstim_get_summary(cells)

%
%
%
%
%
%
%


numcells = length(cells);

resps.normresps_aligned_all = NaN(1,12);
resps.normresps_aligned_avg = NaN(1,12);
resps.normresps_aligned_ste = NaN(1,12);

dir.cv_site_all = nan(1,numcells);
dir.cv_site_avg = NaN;
dir.cv_site_ste = NaN;
dir.dcv_site_all = nan(1,numcells);
dir.dcv_site_avg = NaN;
dir.dcv_site_ste = NaN;
dir.mmm_site_all = nan(1,numcells);
dir.mmm_site_avg = NaN;
dir.mmm_site_ste = NaN;
dir.tot_site_all = nan(1,numcells);
dir.tot_site_avg = NaN;
dir.tot_site_ste = NaN;

other.pref_dir_all = NaN;
other.pref_ori_all = NaN;
other.pref_ori_avg = NaN;
other.pref_ori_ste = NaN;
other.ori_dif_all = NaN;
other.numcells = NaN;
other.filtered = 0;

% From Steve's extract_oridir_test.m function

other.tunewidth_all = NaN;
other.tunewidth_avg = NaN;


for i = 1:numcells,
    
    resps.normresps_aligned_all = [resps.normresps_aligned_all; cells(i).normresps_aligned];
    
    dir.cv_site_all(i) = cells(i).dir.circular_variance;
    dir.dcv_site_all(i) = cells(i).dir.dircircular_variance;
    dir.mmm_site_all(i) = cells(i).dir.mmm;
    dir.tot_site_all(i) = cells(i).dir.tot;
    
    other.pref_dir_all = [other.pref_dir_all cells(i).pref_dir];
    other.pref_ori_all = [other.pref_ori_all cells(i).pref_ori];
    other.ori_dif_all = [other.ori_dif_all cells(i).ori_dif];
    
    other.tunewidth_all = [other.tunewidth_all cells(i).tunewidth];
    
    if cells(i).cd_pvalue < 0.05 && cells(i).filter,
        other.filtered = other.filtered + 1;
    end;
    
end;

resps.normresps_aligned_avg = nanmean(resps.normresps_aligned_all);
resps.normresps_aligned_ste = nanstderr(resps.normresps_aligned_all);

dir.cv_site_avg = nanmean(dir.cv_site_all);
dir.cv_site_ste = nanstderr(dir.cv_site_all);
dir.dcv_site_avg = nanmean(dir.dcv_site_all);
dir.dcv_site_ste = nanstderr(dir.dcv_site_all);
dir.mmm_site_avg = nanmean(dir.mmm_site_all);
dir.mmm_site_ste = nanstderr(dir.mmm_site_all);
dir.tot_site_avg = nanmean(dir.tot_site_all);
dir.tot_site_ste = stderr(dir.tot_site_ste);

other.pref_ori_avg = nanmean(other.pref_ori_all);
other.pref_ori_ste = nanstderr(other.pref_ori_all);

other.tunewidth_avg = nanmean(other.tunewidth_all);

other.numcells = length(find(~isnan(dir.cv_site_all)));





