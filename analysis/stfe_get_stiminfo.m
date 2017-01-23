function [stiminfo] = stfe_get_stiminfo(path,exp)

% [EXPINFO] = STFG_GET_EXPINFO(PATH,STFG) - 
%
% INPUTS: 
%       path - location experiments are stored
%
% OUTPUTS: 
%       expinfo - 
%
% NOTES:
% -


tftypes = {'TF1 resp','TF2 resp','TF3 resp','TF4 resp'};

for i = 1:4,
    
    stiminfo(i).name = tftypes{i};
    stiminfo(i).data = build_stfstim(path,exp,tftypes{i});
    
end;
