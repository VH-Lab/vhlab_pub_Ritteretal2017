function [cdexp] = build_cdexp(path,exps)

%
%
%
%
%
%

numexps = length(exps);
cdexp(numexps) = struct(); % initialize cdexp structure

for i = 1:numexps,
    
    % Read in all cell info from penetration, or get cellinfo if already exists.
    
    if exist([path filesep exps{i} filesep 'cellinfo.mat'],'file'),
        cellinfo = load([path filesep exps{i} filesep 'cellinfo.mat'], '-mat');
        cells = cellinfo.cells;
        cellnames = cellinfo.cellnames;
    else
        [cells,cellnames] = get_cells(path,exps{i},'Dir2Hz1'); % read in cells
    end;
    
    fileID = fopen([path filesep exps{i} filesep 'trainingangle.txt'],'r');
    ori_tested = fscanf(fileID,'%i');
    fclose(fileID);
    
    % Fill cdexp structure with relevant info from experiment
    
    cdexp(i).expid = exps{i};
    
    cdexp(i).CD1 = build_cdstim(cells,cellnames,'Dir2Hz1',ori_tested);
    cdexp(i).CD2 = build_cdstim(cells,cellnames,'Dir2Hz2',ori_tested);
    cdexp(i).CD3 = build_cdstim(cells,cellnames,'Dir2Hz3',ori_tested);
    cdexp(i).CD4 = build_cdstim(cells,cellnames,'Dir2Hz4',ori_tested);
    
    
end;










