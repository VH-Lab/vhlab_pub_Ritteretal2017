function [speed,dir,other] = tfstim_get_stuff(tfcells)

% [SPEED,DIR,OTHER] = TFSTIM_GET_STUFF(TFCELLS) - Works through each cell
% info from a temporal frequency stim and pulls out stim level information.
%
% INPUTS: 
%       tfcells - structure of tfcells. See build_tfcell.m
%
% OUTPUTS:
%       speed -
%       dir -
%       other -
%
% NOTES:
% - check nanmean and nanstderr is doing what I think it is with the shape
% of matrices I am using.

numcells = length(tfcells);
numspeeds = 11; % standard speeds

% initialize everything

speed.max_all = nan(1,numcells); % max response of site
speed.max_avg = NaN;
speed.max_ste = NaN;

speed.pref_all = nan(numcells,numspeeds);
speed.pref_avg = NaN;
speed.pref_ste = NaN;
speed.null_all = nan(numcells,numspeeds);
speed.null_avg = NaN;
speed.null_ste = NaN;
speed.blank_all = nan(1,numcells);
speed.blank_avg = NaN;
speed.blank_ste = NaN;
speed.blank_median = NaN;

speed.pref_std_all = nan(numcells,numspeeds);
speed.pref_std_avg = nan(1,numspeeds);
speed.pref_std_ste = nan(1,numspeeds);
speed.null_std_all = nan(numcells,numspeeds);
speed.null_std_avg = nan(1,numspeeds);
speed.null_std_ste = nan(1,numspeeds);

speed.speed_pref_pref_all = nan(1,numcells); % pref speed in pref dir
speed.speed_pref_pref_avg = NaN;
speed.speed_pref_pref_ste = NaN;
speed.speed_pref_pref_median = NaN;
speed.speed_pref_null_all = nan(1,numcells); % pref speed in null dir
speed.speed_pref_null_avg = NaN;
speed.speed_pref_null_ste = NaN;
speed.speed_pref_null_median = NaN;

% Max response (in Hz) in preferred and null directions
speed.maxresp_pref_all = nan(1,numcells);
speed.maxresp_pref_median = NaN;
speed.maxresp_null_all = nan(1,numcells);
speed.maxresp_null_median = NaN;

dir.mmm_all = nan(numcells,numspeeds);
dir.mmm_avg = NaN;
dir.mmm_ste = NaN;
dir.mmm_1hz_all = nan(1,numcells);
dir.mmm_1hz_avg = NaN;
dir.mmm_1hz_ste = NaN;
dir.mmm_2hz_all = nan(1,numcells);
dir.mmm_2hz_avg = NaN;
dir.mmm_2hz_ste = NaN;
dir.mmm_4hz_all = nan(1,numcells);
dir.mmm_4hz_avg = NaN;
dir.mmm_4hz_ste = NaN;

dir.dir2_all = nan(numcells,numspeeds);
dir.dir2_avg = NaN;
dir.dir2_ste = NaN;
dir.dir2_1hz_all = nan(1,numcells);
dir.dir2_1hz_avg = NaN;
dir.dir2_1hz_ste = NaN;
dir.dir2_2hz_all = nan(1,numcells);
dir.dir2_2hz_avg = NaN;
dir.dir2_2hz_ste = NaN;
dir.dir2_4hz_all = nan(1,numcells);
dir.dir2_4hz_avg = NaN;
dir.dir2_4hz_ste = NaN;

dir.tstat_all = nan(numcells,numspeeds);
dir.tstat_avg = NaN;
dir.tstat_ste = NaN;
dir.tstat_1hz_all = nan(1,numcells);
dir.tstat_1hz_avg = NaN;
dir.tstat_1hz_ste = NaN;
dir.tstat_2hz_all = nan(1,numcells);
dir.tstat_2hz_avg = NaN;
dir.tstat_2hz_ste = NaN;
dir.tstat_4hz_all = nan(1,numcells);
dir.tstat_4hz_avg = NaN;
dir.tstat_4hz_ste = NaN;

other.numcells = NaN;
other.filtered = 0;

% get everything

for i = 1:numcells,
    
    speed.max_all(i) = tfcells(i).sm_raw.max_resp;
    
    speed.pref_all(i,:) = tfcells(i).pn_norm.pref_resps; % note, this is blank subtracted
    speed.null_all(i,:) = tfcells(i).pn_norm.null_resps; % note, this is blank subtracted
    speed.pref_std_all(i,:) = tfcells(i).pn_raw.pref_std;
    speed.null_std_all(i,:) = tfcells(i).pn_raw.null_std;
    speed.blank_all(i) = tfcells(i).blank;
    
    % Speed in preferred and null directions that elicited max response
    speed.speed_pref_pref_all(i) = tfcells(i).speed_pref_pref;
    speed.speed_pref_null_all(i) = tfcells(i).speed_pref_null;
    
    % Max resp (in Hz) to preferred and null directions
    speed.maxresp_pref_all(i) = tfcells(i).maxresp_pref;
    speed.maxresp_null_all(i) = tfcells(i).maxresp_null;
     
    dir.mmm_all(i,:) = tfcells(i).mmm.all;
    dir.mmm_1hz_all(i) = tfcells(i).mmm.one_hz;
    dir.mmm_2hz_all(i) = tfcells(i).mmm.two_hz;
    dir.mmm_4hz_all(i) = tfcells(i).mmm.four_hz;
    
    dir.dir2_all(i,:) = tfcells(i).dir2.all;
    dir.dir2_1hz_all(i) = tfcells(i).dir2.one_hz;
    dir.dir2_2hz_all(i) = tfcells(i).dir2.two_hz;
    dir.dir2_4hz_all(i) = tfcells(i).dir2.four_hz;
    
    dir.tstat_all(i,:) = tfcells(i).tstat.all;
    dir.tstat_1hz_all(i) = tfcells(i).tstat.one_hz;
    dir.tstat_2hz_all(i) = tfcells(i).tstat.two_hz;
    dir.tstat_4hz_all(i) = tfcells(i).tstat.four_hz;
    
    if tfcells(i).tfpvalue < 0.05 && tfcells(i).filter,
        other.filtered = other.filtered + 1;
    end;
    
end;

speed.max_avg = nanmean(speed.max_all);
speed.max_ste = nanstderr(speed.max_all);

speed.pref_avg = nanmean(speed.pref_all);
speed.pref_ste = nanstderr(speed.pref_all);
speed.null_avg = nanmean(speed.null_all);
speed.null_ste = nanstderr(speed.null_all);
speed.blank_avg = nanmean(speed.blank_all);
speed.blank_ste = nanstderr(speed.blank_all);
speed.blank_median = nanmedian(speed.blank_all);

speed.pref_std_avg = nanmean(speed.pref_std_all);
speed.pref_std_ste = nanstderr(speed.pref_std_all);
speed.null_std_avg = nanmean(speed.null_std_all);
speed.null_std_ste = nanstderr(speed.null_std_all);

speed.speed_pref_pref_avg = nanmean(speed.speed_pref_pref_all);
speed.speed_pref_pref_ste = nanstderr(speed.speed_pref_pref_all);
speed.speed_pref_pref_median = nanmedian(speed.speed_pref_pref_all);
speed.speed_pref_null_avg = nanmean(speed.speed_pref_null_all);
speed.speed_pref_null_ste = nanstderr(speed.speed_pref_null_all);
speed.speed_pref_null_median = nanmedian(speed.speed_pref_null_all);

speed.maxresp_pref_median = nanmedian(speed.maxresp_pref_all);
speed.maxresp_null_median = nanmedian(speed.maxresp_null_all);

dir.mmm_avg = nanmean(dir.mmm_all);
dir.mmm_ste = nanstderr(dir.mmm_all);
dir.mmm_1hz_avg = nanmean(dir.mmm_1hz_all);
dir.mmm_1hz_ste = nanstderr(dir.mmm_1hz_all);
dir.mmm_2hz_avg = nanmean(dir.mmm_2hz_all);
dir.mmm_2hz_ste = nanstderr(dir.mmm_2hz_all);
dir.mmm_4hz_avg = nanmean(dir.mmm_4hz_all);
dir.mmm_4hz_ste = nanstderr(dir.mmm_4hz_all);

dir.dir2_avg = nanmean(dir.dir2_all);
dir.dir2_ste = nanstderr(dir.dir2_all);
dir.dir2_1hz_avg = nanmean(dir.dir2_1hz_all);
dir.dir2_1hz_ste = nanstderr(dir.dir2_1hz_all);
dir.dir2_2hz_avg = nanmean(dir.dir2_2hz_all);
dir.dir2_2hz_ste = nanstderr(dir.dir2_2hz_all);
dir.dir2_4hz_avg = nanmean(dir.dir2_4hz_all);
dir.dir2_4hz_ste = nanstderr(dir.dir2_4hz_all);

dir.tstat_avg = nanmean(dir.tstat_all);
dir.tstat_ste = nanstderr(dir.tstat_all);
dir.tstat_1hz_avg = nanmean(dir.tstat_1hz_all);
dir.tstat_1hz_ste = nanstderr(dir.tstat_1hz_all);
dir.tstat_2hz_avg = nanmean(dir.tstat_2hz_all);
dir.tstat_2hz_ste = nanstderr(dir.tstat_2hz_all);
dir.tstat_4hz_avg = nanmean(dir.tstat_4hz_all);
dir.tstat_4hz_ste = nanstderr(dir.tstat_4hz_all);

other.numcells = length(find(~isnan(speed.pref_all(:,1))));



