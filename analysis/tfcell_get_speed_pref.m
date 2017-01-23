function [speed_pref_pref,maxresp_pref,speed_pref_null,maxresp_null] = tfcell_get_speed_pref(tfcell)

% [SPEED_PREF] = TFCELL_GET_SPEED_PREF(TFCELL) - Find single speed with
% maximum average response from cell. If tie, currently takes slower speed.
%
% INPUTS:
%       tfcell -
%
% OUTPUTS:
%       speed_pref_pref - speed preference in preferred direction
%       maxresp_pref - 
%       speed_pref_null - speed preference in null direction
%       maxresp_null - 
% NOTES:
% 
%

speeds = tfcell.standardspeeds;

pref_resps = tfcell.pn_raw.pref_resps; % resps to speeds in pref direction
speed_prefs_pref = []; % if more than one speed has max response
speed_pref_pref = NaN;

null_resps = tfcell.pn_raw.null_resps; % resps to speeds in null direction
speed_prefs_null = []; % if more than one speed has max response
speed_pref_null = NaN;


% Find preferred speed in preferred direction

maxresp_pref = max(pref_resps);
max_pref_resp_indices = find(pref_resps == maxresp_pref);

for i=1:length(max_pref_resp_indices),    
    speed_prefs_pref = [speed_prefs_pref speeds(max_pref_resp_indices(i))];
end;

if ~isempty(speed_prefs_pref),
    speed_pref_pref = min(speed_prefs_pref);    
end;


% Find preferred speed in null direction

maxresp_null = max(null_resps);
max_null_resp_indices = find(null_resps == maxresp_null);

for i=1:length(max_null_resp_indices),
    speed_prefs_null = [speed_prefs_null speeds(max_null_resp_indices(i))];
end;

if ~isempty(speed_prefs_null),
    speed_pref_null = min(speed_prefs_null);
end;
















