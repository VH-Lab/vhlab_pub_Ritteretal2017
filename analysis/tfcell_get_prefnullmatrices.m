function [raw,norm] = tfcell_get_prefnullmatrices(tfcell)

% [RAW,NORM] = TFCELL_GET_PREFNULLMATRICES(TFCELL) - sort speedmatrices
% into pref and null matrices.
%
% INPUTS: 
%       tfcell - structure containing relevant info for cell
%
% OUTPUTS: 
%       raw - structure containing pref/null raw response info
%           .pref_resps
%           .pref_ste
%           .pref_std
%           .null_resps
%           .null_ste
%           .null_std
%       norm - structure containing preef/null normalized response info
%           .pref_resps
%           .null_resps
%
%
% NOTES:
% - preferred and null responses are in 'standard speed', e.g. correspond
% to temporal frequencies in this order [25 20 16 12 8 6 4 2 1 .5 .25].
%
%

anchor_indices = tfcell.anchor_indices;
d1 = tfcell.sm_raw.resps_d1; % raw responses to direction 1
d2 = tfcell.sm_raw.resps_d2; % raw responses to direction 2

d1_sum = 0;
d2_sum = 0;

for i = 1:length(anchor_indices),
    d1_sum = d1_sum + d1(anchor_indices(i));
    d2_sum = d2_sum + d2(anchor_indices(i));
end;


if d1_sum >= d2_sum,
    raw.pref_resps = d1;
    raw.pref_ste = tfcell.sm_raw.ste_d1;
    raw.pref_std = tfcell.sm_raw.std_d1;
    raw.null_resps = d2;
    raw.null_ste = tfcell.sm_raw.ste_d2;
    raw.null_std = tfcell.sm_raw.std_d2;
    
    norm.pref_resps = tfcell.sm_norm.resps_d1;
    norm.null_resps = tfcell.sm_norm.resps_d2;
else
    raw.pref_resps = d2;
    raw.pref_ste = tfcell.sm_raw.ste_d2;
    raw.pref_std = tfcell.sm_raw.std_d2;
    raw.null_resps = d1;
    raw.null_ste = tfcell.sm_raw.ste_d1;
    raw.null_std = tfcell.sm_raw.std_d1;
    
    norm.pref_resps = tfcell.sm_norm.resps_d2;
    norm.null_resps = tfcell.sm_norm.resps_d1;    
end;


