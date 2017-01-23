function [pen_info] = tfexp_age_get_pen_info(path,exp,pen_names)

% [PEN_INFO] = TFEXP_AGE_GET_PEN_INFO(PATH,EXP,PEN_NAMES) - Exp folder has
% a subdirectory for each penetration of the experiment. This goes through
% and gets all relevant cell info for each penetration and stores it in the
% pen_info structure.
%
%
%

num_pens = length(pen_names);
pen_info = struct();

for i = 1:num_pens,
   
    % Read in all cell info from penetration, or get cellinfo if already exists.
    
    if exist([path filesep exp filesep pen_names{i} filesep 'cellinfo.mat'],'file'),
        cellinfo = load([path filesep exp filesep pen_names{i} filesep 'cellinfo.mat'], '-mat');
        cells = cellinfo.cells;
        cellnames = cellinfo.cellnames;
    else
        [cells,cellnames] = get_cells(path,exps(i),'TF1 resp'); % read in cells
    end;
    
    % Get all relevant information for TF Stim from Steve Cells for pen
    
    tfcells = build_tfcell(cells,cellnames,'TF1 resp');
    
    pen_info(i).penetration = pen_names{i};
    pen_info(i).cells = tfcells;
    
    [pen_info(i).speed, ...
        pen_info(i).dir, ...
        pen_info(i).other] = tfstim_get_stuff(pen_info(i).cells);
    
    
end;




