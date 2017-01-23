function [pen_info] = cdexp_age_get_pen_info(path,exp,pen_names)

%
%
%
%
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
        [cells,cellnames] = get_cells(path,exps(i),'Dir2Hz1'); % read in cells
    end;
    
    fileID = fopen([path filesep exp filesep pen_names{i} filesep 'trainingangle.txt'],'r');
    ori_tested = fscanf(fileID,'%i');
    fclose(fileID);
    
    % Get all relevant information for CD Stim from Steve Cells for pen
    
    cdc = build_cdcell(cells,cellnames,'Dir2Hz1',ori_tested);
    
    pen_info(i).penetration = pen_names{i};
    pen_info(i).cells = cdc;
    
    [pen_info(i).resps, ...
        pen_info(i).dir, ...
        pen_info(i).other] = cdstim_get_summary(pen_info(i).cells);
    
    
end;

