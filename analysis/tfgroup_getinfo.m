function [TF] = tfgroup_getinfo(tfgroup,tfstim)

%
%
%
%


numexps = length(tfgroup.expids);
speeds = tfgroup.speeds;
numspeeds = length(speeds);

TF.pref_all = nan(numexps,numspeeds);
TF.null_all = nan(numexps,numspeeds);
TF.pref_all_sites = nan(1,numspeeds);
TF.null_all_sites = nan(1,numspeeds);
TF.mmm_all = nan(numexps,numspeeds);
TF.dir2_all = nan(numexps,numspeeds);
TF.bs_mmm_all = nan(numexps,numspeeds);
TF.bs_dir2_all = nan(numexps,numspeeds);

% new

TF.preftf_all = zeros(1,numspeeds);


for i = 1:numexps,
    
    TF.pref_all(i,:) = tfgroup.tfexps(i).(tfstim).pref_avg;
    TF.null_all(i,:) = tfgroup.tfexps(i).(tfstim).null_avg;
    TF.pref_all_sites = [TF.pref_all_sites; tfgroup.tfexps(i).(tfstim).pref_all];
    TF.null_all_sites = [TF.null_all_sites; tfgroup.tfexps(i).(tfstim).null_all];
    TF.mmm_all(i,:) = tfgroup.tfexps(i).(tfstim).mmm_avg;
    TF.dir2_all(i,:) = tfgroup.tfexps(i).(tfstim).dir2_avg;
    TF.bs_mmm_all(i,:) = tfgroup.tfexps(i).(tfstim).bs_mmm_avg;
    TF.bs_dir2_all(i,:) = tfgroup.tfexps(i).(tfstim).bs_dir2_avg;
    
    % new
    
    TF.preftf_all = TF.preftf_all + tfgroup.tfexps(i).(tfstim).preftf_all;
    
end;

TF.pref_avg = nanmean(TF.pref_all);
TF.pref_ste = nanstderr(TF.pref_all);

TF.null_avg = nanmean(TF.null_all);
TF.null_ste = nanstderr(TF.null_all);

TF.pref_avg_sites = nanmean(TF.pref_all_sites);
TF.pref_ste_sites = nanstderr(TF.pref_all_sites);

TF.null_avg_sites = nanmean(TF.null_all_sites);
TF.null_ste_sites = nanstderr(TF.null_all_sites);

TF.mmm_avg = nanmean(TF.mmm_all);
TF.mmm_ste = nanstderr(TF.mmm_all);

TF.dir2_avg = nanmean(TF.dir2_all);
TF.dir2_ste = nanstderr(TF.dir2_all);

TF.bs_mmm_avg = nanmean(TF.bs_mmm_all);
TF.bs_mmm_ste = nanstderr(TF.bs_mmm_all);

TF.bs_dir2_avg = nanmean(TF.bs_dir2_all);
TF.bs_dir2_ste = nanstderr(TF.bs_dir2_all);

TF.numsites = length(find(~isnan(TF.pref_all_sites(:,1))));


