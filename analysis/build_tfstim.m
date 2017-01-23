function [tfstim] = build_tfstim(cells,cellnames,tftype)

% [TFSTIM] = BUILD_TFSTIM(CELLS,CELLNAMES,TFTYPE) - Compiles information
% from all cells for a single temporal frequency stim (i.e. tftype).
%
% INPUTS:
%       cells -
%       cellnames -
%       tftype -
%
% OUTPUTS:
%       tfstim - structure containing information about all cells from a
%       temporal frequency stim.
%
% NOTES:
% - See build_tfcell and tfstim_get_stuff
%


tfstim.cells = build_tfcell(cells,cellnames,tftype);

[tfstim.speed, ...
    tfstim.dir, ...
    tfstim.other] = tfstim_get_stuff(tfstim.cells);




