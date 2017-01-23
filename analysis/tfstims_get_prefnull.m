function [p_all,p_avg,p_ste,n_all,n_avg,n_ste] = tfstims_get_prefnull(tfstims)

%
%
%
%
%
%


numstims = length(tfstims.exps);
numvels = 11;

p_all = nan(numstims,numvels);
n_all = nan(numstims,numvels);


for i = 1:numstims,
    
    p_all(i,:) = tfstims.tfstim(i).data.pref_avg;
    n_all(i,:) = tfstims.tfstim(i).data.null_avg;
    
end;


p_avg = nanmean(p_all);
p_ste = nanstderr(p_all);

n_avg = nanmean(n_all);
n_ste = nanstderr(n_all);