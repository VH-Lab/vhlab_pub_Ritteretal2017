function [cells,cellnames] = get_cells(path,exp,type)

% [CELLS,CELLNAMES] = GET_CELLS(PATH,EXP,TYPE) - pulls out list of cells
% from [path/exp] using readcellsfromexperimentlist.m then filters it to
% return only cells and cellnames with type.
%
% INPUTS: 
%       path - 
%       exp - e.g. {'1014-04-04'}
%       tftype - 'TF1 resp', 'TF2 resp', 'TF3 resp', or 'TF4 resp'
%
% OUTPUTS: 
%       cells -
%       cellnames -
%
% NOTES: 
% - 

[cells,cellnames,~] = readcellsfromexperimentlist(path,exp);

tftype_indices = findstfcells(cells,type);

cells = cells(tftype_indices);
cellnames = cellnames(tftype_indices);


