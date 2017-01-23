function [dir2_all,dir2_avg,dir2_ste,bs_dir2_all,bs_dir2_avg,bs_dir2_ste] = tfstims_get_dir(tfstims)

%
%
%
%
%
%




numstims = length(tfstims.exps);
numvels = 11;

dir2_all = nan(numstims,numvels);
bs_dir2_all = nan(numstims,numvels);

for i = 1:numstims,
    
    dir2_all(i,:) = tfstims.tfstim(i).data.dir2_avg;
    bs_dir2_all(i,:) = tfstims.tfstim(i).data.bs_dir2_avg;
        
end;


dir2_avg = nanmean(dir2_all);
dir2_ste = nanstderr(dir2_all);

bs_dir2_avg = nanmean(bs_dir2_all);
bs_dir2_ste = nanstderr(bs_dir2_all);