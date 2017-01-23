function [m_all,m_avg,m_ste,d_all,d_avg,d_ste] = stfe_get_alldir(stiminfo,pvalue)

% [INDIVMMM,AVGMMM,STDMMM, ...
% INDIVDIR2,AVGDIR2,STDDIR2]= GET_ALLDIR(STF,PVALUE) - 
%
% INPUTS: 
%       stf -
%       pvalue -
%
% OUTPUTS: 
%
%
%
% NOTES:
% -
%

speeds = stiminfo.data(1).speedstested;
numspeeds = length(speeds);

m_all = nan(length(stiminfo),numspeeds);
d_all = nan(length(stiminfo),numspeeds);

for i = 1:length(stiminfo.data);
    
    if stiminfo.data(i).tfpvalue < pvalue,        
        m_all(i,:) = stiminfo.data(i).mmm;
        d_all(i,:) = stiminfo.data(i).dir2;
    end;
    
end;

m_avg = nanmean(m_all);
m_ste = nanstderr(m_all);

d_avg = nanmean(d_all);
d_ste = nanstderr(d_all);

% Convert to Standard Speeds

if length(speeds) > 11,
    
    m_all = reducespeeds(m_all);
    m_avg = reducespeeds(m_avg);
    m_ste = reducespeeds(m_ste);
    
    d_all = reducespeeds(d_all);
    d_avg = reducespeeds(d_avg);
    d_ste = reducespeeds(d_ste);

end;




