function [mmm_all,mmm_avg,mmm_ste,dir2_all,dir2_avg,dir2_ste] = tfstim_get_bs_dir(cells,tfstim)

%
%
%
%
%



numcells = length(cells);

speeds = tfstim.speedstested;
numspeeds = length(speeds);

mmm_all = nan(numcells,numspeeds);
dir2_all = nan(numcells,numspeeds);

for i = 1:length(cells),
    
    if cells(i).tfpvalue < 0.05,
        mmm_all(i,:) = cells(i).bs_mmm;
        dir2_all(i,:) = cells(i).bs_dir2;
    end;
    
end;

mmm_avg = nanmean(mmm_all);
mmm_ste = nanstderr(mmm_all);

dir2_avg = nanmean(dir2_all);
dir2_ste = nanstderr(dir2_all);

% Convert to Standard Speeds

if length(speeds) > 11,
    
    mmm_all = reducespeeds(mmm_all);
    mmm_avg = reducespeeds(mmm_avg);
    mmm_ste = reducespeeds(mmm_ste);
    
    dir2_all = reducespeeds(dir2_all);
    dir2_avg = reducespeeds(dir2_avg);
    dir2_ste = reducespeeds(dir2_ste);
    
end;
