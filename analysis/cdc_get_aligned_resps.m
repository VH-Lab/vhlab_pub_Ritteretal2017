function [rawresps_aligned,normresps_aligned] = cdc_get_aligned_resps(cdc)

% [RAWRESPS_ALIGNED,NORMRESPS_ALIGNED] = CDC_GET_ALIGNED_RESPS(CDC) -
% Rotates cdc.rawresps and cdc.normresps such that the maximum response is
% at poistion 4 (i.e. at 90 degerees)
%
%
%
%


rawresps = cdc.rawresps;
normresps = cdc.normresps;
pref_dir = cdc.pref_dir;

orientations = [0 30 60 90 120 150 180 210 240 270 300 330];
pref_dir_ind = find(orientations == pref_dir);
shift = 4 - pref_dir_ind; % to shift pref dir to 90 degrees

if isempty(shift), shift = 0; end; % when resps all NaN

rawresps_aligned = circshift(rawresps,[shift,0]);
normresps_aligned = circshift(normresps,[shift,0]);





