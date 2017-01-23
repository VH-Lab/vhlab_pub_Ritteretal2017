function [p_all,p_avg,p_ste,n_all,n_avg,n_ste] = stfg_get_prefnull(stfg,stim)

% [PREF_ALL,PREF_AVG,PREF_STE,NULL_ALL,NULL_AVG,NULL_STE] = STFG_GET_PREFNULL(STFG,STIM) -
%
% INPUTS:
%
%
% OUTPUTS:
%
%
%

numexps = length(stfg.expids);
numspeeds = length(stfg.speeds);
expinfo = stfg.expinfo;

p_all = nan(numexps,numspeeds);
n_all = nan(numexps,numspeeds);

for i = 1:numexps,
    p_all(i,:) = expinfo(i).data.(stim).pref_avg;
    n_all(i,:) = expinfo(i).data.(stim).null_avg;
end;

p_avg = nanmean(p_all);
p_ste = nanstderr(p_all);

n_avg = nanmean(n_all);
n_ste = nanstderr(n_all);

