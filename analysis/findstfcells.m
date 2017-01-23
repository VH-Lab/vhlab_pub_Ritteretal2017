function [tftype_indices] = findstfcells(cells,tftype)

% [TFTYPE_INDICES] = FINDSTFCELLS(CELLS,TFTYPE) - takes a list of cells
% from an experiment and pulls out indices of cells associated with the
% stim tftype.
%
% INPUTS:
%       cells - list of cells from readcellsfromexperimentlist.m
%       tftype - 'TF1 resp', 'TF2 resp', 'TF3 resp', or 'TF4 resp'
%
% OUTPUTS: 
%       tfype_indices - indices of cells associated with tftype
%
%
% NOTES:
% - 
%
%


tftype_indices = [];

for i = 1:length(cells),
    
    A = findassociate(cells{i},tftype,'','');
    
    if ~isempty(A),
        tftype_indices = [tftype_indices i];
    end;
        
end;