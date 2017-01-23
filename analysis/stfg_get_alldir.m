function [m_all,m_avg,m_ste,d_all,d_avg,d_ste] = stfg_get_alldir(stfg,stim)

%
%
%
%
%
%
%
%
%
%


numexps = length(stfg.expids);
numspeeds = length(stfg.speeds);
expinfo = stfg.expinfo;

m_all = nan(numexps,numspeeds);
d_all = nan(numexps,numspeeds);

for i = 1:numexps,
    m_all(i,:) = expinfo(i).data.(stim).mmm_avg;
    d_all(i,:) = expinfo(i).data.(stim).dir2_avg;
end;

m_avg = nanmean(m_all);
m_ste = nanstderr(m_all);

d_avg = nanmean(d_all);
d_ste = nanstderr(d_all);