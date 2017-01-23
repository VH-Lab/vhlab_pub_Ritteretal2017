function [tfexp] = build_tfexp(path,exps)

% [TFEXP] = BUILD_TFEXP(PATH,EXPS) - 
%
% INPUTS: 
%       path - location of where exp directory (or cell info) is stored
%       exps - name of experiments, e.g. {'2014-04-01','2014-04-04',...}
%
% OUTPUTS: 
%       tfexp - 
%
% NOTES -
%
%


numexps = length(exps);
tfexp(numexps) = struct(); % initialize tfexp structure

for i = 1:numexps

% Read in all cell info from experiment, or get cellinfo if already exists.

if exist([path filesep exps{i} filesep 'cellinfo.mat'],'file'),    
    cellinfo = load([path filesep exps{i} filesep 'cellinfo.mat'], '-mat');
    cells = cellinfo.cells;
    cellnames = cellinfo.cellnames;
else
    [cells,cellnames] = get_cells(path,exps(i),'TF1 resp'); % read in cells
end;

% Build structure with all relevant info from experiment

tfexp(i).expid = exps(i);
tfexp(i).exptype = get_exptype(path,exps(i));
tfexp(i).trainedori = get_trainedori(path,exps(i));

tfexp(i).TF1 = build_tfstim(cells,cellnames,'TF1 resp');
tfexp(i).TF2 = build_tfstim(cells,cellnames,'TF2 resp');
tfexp(i).TF3 = build_tfstim(cells,cellnames,'TF3 resp');
tfexp(i).TF4 = build_tfstim(cells,cellnames,'TF4 resp');


end;

