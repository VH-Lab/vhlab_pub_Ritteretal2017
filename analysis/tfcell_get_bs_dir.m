function [bs_mmm,bs_dir2] = tfcell_get_bs_dir(tfcell,bs_reps)

%
%
%
%
%
%
%
%
%

speeds = tfcell.speedstested;
numspeeds = length(speeds);

pref = tfcell.bs_prefmatrix;
null = tfcell.bs_nullmatrix;

mmm_all = nan(bs_reps,numspeeds);
dir2_all = nan(bs_reps,numspeeds);

for i = 1:bs_reps,
    
    [mmm_all(i,:),dir2_all(i,:)] = tfcell_get_dir(speeds,pref(i,:),null(i,:));
    
end;

bs_mmm = nanmean(mmm_all);
bs_dir2 = nanmean(dir2_all);