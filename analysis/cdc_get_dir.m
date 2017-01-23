function [dir] = cdc_get_dir(cdc)

% [DIR] = CDC_GET_DIR(CDC) - 
%
%   Inputs:
%       -
%
%   Outputs: 
%       - dir
%           .dircircular_variance
%           .mmm


angles = [0 30 60 90 120 150 180 210 240 270 300 330];
resps = cdc.rawresps;


% Compute Circular Variance and DirCircular Variance

dir.circular_variance = compute_circularvariance(angles,resps);
dir.dircircular_variance = compute_dircircularvariance(angles,resps);

% Compute (Max - Opposite) / Max (mmm)

pref_dir = cdc.pref_dir;
pref_dir_index = find(angles == pref_dir);
opp_dir_index = pref_dir_index + 6;
if opp_dir_index > 12, opp_dir_index = opp_dir_index - 12; end;

dir.mmm = (resps(pref_dir_index) - resps(opp_dir_index)) / resps(pref_dir_index);


% Compute (Max_Tested - Opposite) / Max_Tested (tot)
% Takes max of the two directions at tested orientation as Max_Tested

tested_ori = cdc.ori_tested;
tested_ori_nearest_30 = round(tested_ori / 30) * 30;
tested_ori_index = find(angles == tested_ori_nearest_30);
tested_dir1_resp = resps(tested_ori_index);
tested_dir2_resp = resps(tested_ori_index + 6);

if tested_dir1_resp >= tested_dir2_resp,
    dir.tot = (tested_dir1_resp - tested_dir2_resp) / tested_dir1_resp;
else
    dir.tot = (tested_dir2_resp - tested_dir1_resp) / tested_dir2_resp;
end;












