function [mmm,dir2,tstat] = tfcell_get_dir(tfcell)

% [MMM,DIR2] = TFCELL_GET_DIR - get direction indices for cell from
% tfstim.
%
% INPUTS:
%       tfcell - contains all relevant info for cell's responses to tfstim
%
% OUTPUTS:
%       mmm -
%           .all
%           .one_hz
%           .two_hz
%           .four_hz
%       dir2 -
%           .all
%           .one_hz
%           .two_hz
%           .four_hz
%       tstat - 
%           .all
%           .one_hz
%           .two_hz
%           .four_hz
%
% NOTES: 
% - Blank is subtracted before calculating direction indices
%
%


numspeeds = length(tfcell.standardspeeds);
blank = tfcell.blank;
pref = tfcell.pn_raw.pref_resps - blank; % subtracting blank here!
pref_ste = tfcell.pn_raw.pref_ste;
null = tfcell.pn_raw.null_resps - blank; % subtracting blank here!
null_ste = tfcell.pn_raw.null_ste;

% initialize everything

mmm.all = nan(1,numspeeds); % (Max - Min) / Max
mmm.one_hz = NaN;
mmm.two_hz = NaN;
mmm.four_hz = NaN;

dir2.all = nan(1,numspeeds); % (Pref - Null) / (abs(Pref) + abs(Null))
dir2.one_hz = NaN;
dir2.two_hz = NaN;
dir2.four_hz = NaN;

tstat.all = nan(1,numspeeds); % (Pref - Null) / (sqrt(Pref_Ste^2 + Null_Ste^2))
tstat.one_hz = NaN;
tstat.two_hz = NaN;
tstat.four_hz = NaN;


for i = 1:numspeeds, % for mmm
    
    if ~isnan(pref(i)),
        
        if pref(i) >= null(i),
            max = pref(i);
            min = null(i);
        else
            max = null(i);
            min = pref(i);
        end;
        
        if max ~= 0,
            mmm.all(i) = (max - min) / max; % mmm calc
        else
            mmm.all(i) = 0;
        end;
        
        if mmm.all(i) > 1, mmm.all(i) = 1; end; % max mmm value is 1
        if mmm.all(i) < 0, mmm.all(i) = 0; end; % min mmm value is 0
        
    end;
    
end;

mmm.one_hz = mmm.all(9);
mmm.two_hz = mmm.all(8);
mmm.four_hz = mmm.all(7);


for i = 1:numspeeds, % for dir2   
    if ~isnan(pref(i)),
        
        dir2.all(i) = (pref(i) - null(i)) / (abs(pref(i)) + abs(null(i))); % dir2 calc
        
        if pref(i) && null(i) == 0, dir2.all(i) = 0; end;
        
    end;
end;

dir2.one_hz = dir2.all(9);
dir2.two_hz = dir2.all(8);
dir2.four_hz = dir2.all(7);


for i = 1:numspeeds, % for tstat
    if ~isnan(pref(i)),
        
        tstat.all(i) = abs((pref(i) - null(i))) / sqrt(pref_ste(i)^2 + null_ste(i)^2);
        
        if pref_ste(i) && null_ste(i) == 0, tstat.all(i) = 0; end; % If denominator of tstat calc is 0
        
    end;
end;

tstat.one_hz = tstat.all(9);
tstat.two_hz = tstat.all(8);
tstat.four_hz = tstat.all(7);


    
    
    
    
    




