function [pen_names] = tfexp_age_get_pen_names(path,exp)

% [PEN_NAMES] = TFEXP_AGE_GET_PEN_NAMES(PATH,EXP) - Get names of all
% subdirectories of experiment folder. These are each individual
% penetrations for experiment.
%
%

% Get penetration names (list of not hidden folders inside exp folder)

folders = dir([path filesep exp]);
folders = folders([folders.isdir] & ~strncmp('.',{folders.name},1));

pen_names = cell(length(folders),1);

for i = 1:length(folders), 
    pen_names{i} = folders(i).name;
end;