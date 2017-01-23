function [raw,norm,blank] = tfcell_get_speedmatrix(tfcell,p,exclude)

% [RAW,NORM,BLANK] = TFCELL_GET_SPEEDMATRIX(TFCELL,P,EXCLUDE) - pull out
% response information from cell to tfstim from Steve's 'cell'. 
%
% INPUTS: 
%       tfcell - structure containing relevant cell info
%       p - cell's include/exclude value
%       exclude - exclusion threshold
%
% OUTPUTS:
%       raw - structure containing raw responses of cell to tf stimulus
%           .resps - response in Hz
%           .ste - standard error
%           .std - standar deviation
%           .resps_d1 - response in Hz to first direction
%           .ste_d1
%           .std_d1
%           .resps_d2 - response in Hz to second direction
%           .ste_d2
%           .std_d2
%           .max - max response in Hz across all velocities
%       norm - structure containing normalized responses of cell to tf
%       stimulus
%           .resps
%           .resps_d1
%           .resps_d2
%       blank - average blank response of cell
%
% NOTES:  
% - Aligning to 'standard speed' here to not deal with later, e.g. 
% correspond to temporal frequencies in this order:
% [25 20 16 12 8 6 4 2 1 .5 .25].
% - Not subtracting blank here for RAW, but am subtracting blank for NORM.
% 

cell = tfcell.cell;
tftype = tfcell.type;
velocities = tfcell.velocitiestested;
numvels = length(velocities);
speeds = tfcell.speedstested;
numspeeds = length(speeds);

% initialize everything as NaNs

blank = NaN;

raw.resps = nan(1,numvels);
raw.ste = nan(1,numvels);
raw.std = nan(1,numvels);
raw.resps_d1 = nan(1,numspeeds);
raw.ste_d1 = nan(1,numspeeds);
raw.std_d1 = nan(1,numspeeds);
raw.resps_d2 = nan(1,numspeeds);
raw.ste_d2 = nan(1,numspeeds);
raw.std_d2 = nan(1,numspeeds);
raw.max_resp = nan;

norm.resps = nan(1,numvels);
norm.resps_d1 = nan(1,numspeeds);
norm.resps_d2 = nan(1,numspeeds);


if p < exclude, % cell exclusion criteria, see build_tfcell
    
    A = findassociate(cell,tftype,'','');
    
    if ~isempty(A),
        raw.resps = A.data.f0curve{1}(2,:); % raw responses
        raw.ste = A.data.f0curve{1}(4,:); % standard error
        raw.std = A.data.f0curve{1}(3,:); % standard deviation
        blank = A.data.blank.f0curve{1}(2); % blank response      
    end;
    
raw.resps_d1 = raw.resps(1:numspeeds);
raw.ste_d1 = raw.ste(1:numspeeds);
raw.std_d1 = raw.std(1:numspeeds);
raw.resps_d2 = fliplr(raw.resps(numspeeds+1:end));
raw.ste_d2 = fliplr(raw.ste(numspeeds+1:end));
raw.std_d2 = fliplr(raw.std(numspeeds+1:end));
raw.max_resp = max(raw.resps);

norm.resps = (raw.resps - blank) ./ (max(abs(raw.resps - blank)));
norm.resps_d1 = (raw.resps_d1 - blank) ./ (max(abs(raw.resps - blank)));
norm.resps_d2 = (raw.resps_d2 - blank) ./ (max(abs(raw.resps - blank)));

end;


% Reduce to standard speeds here so don't have to deal with it later

if numspeeds == 15,    
    raw.resps_d1 = reduce_speeds(raw.resps_d1);
    raw.ste_d1 = reduce_speeds(raw.ste_d1);
    raw.std_d1 = reduce_speeds(raw.std_d1);
    raw.resps_d2 = reduce_speeds(raw.resps_d2);
    raw.ste_d2 = reduce_speeds(raw.ste_d2);
    raw.std_d2 = reduce_speeds(raw.std_d2);
    
    norm.resps_d1 = reduce_speeds(norm.resps_d1);
    norm.resps_d2 = reduce_speeds(norm.resps_d2);
end;



