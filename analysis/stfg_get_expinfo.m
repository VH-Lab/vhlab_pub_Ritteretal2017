function [expinfo] = stfg_get_expinfo(path,stfg)

% [EXPINFO] = STFG_GET_EXPINFO(PATH,STFG) - 
%
% INPUTS: 
%       path - location experiments are stored
%       stfg - structure containing information about group/condition
%
% OUTPUTS: 
%       expinfo - structure with length of number experiments included in
%       group/condition containing relevant data for each experiment.
%
% NOTES:
% -



expids = stfg.expids;
numexps = length(expids);

for i = 1:numexps,
    
    expinfo(i).name = expids{i};
    expinfo(i).data = build_stfexp(path,expids(i));
    
end;
