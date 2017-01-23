function [preftf_all,blank_all,blank_avg,blank_ste] = tfstim_get_stuff(tfstim)

% [PREFTF_ALL] = TFSTIM_GET_STUFF(TFSTIM) - 
%
% INPUTS: 
%       tfstim -
%
% OUTPUTS: 
%       preftf_all - 
%



speeds = tfstim.standardspeeds;
numcells = length(tfstim.cells);
preftf_all = nan(1,length(speeds));

blank_all = nan(1,numcells);
blank_avg = NaN;
blank_ste = NaN;

for i = 1:numcells,
    
    % preftf = tfstim.cells(i).preftf;
    % index = find(speeds == preftf);
    % preftf_all(index) = preftf_all(index) + 1;
    
    blank_all(i) = tfstim.cells(i).blank;
end;

blank_avg = nanmean(blank_all);
blank_ste = nanstderr(blank_all);