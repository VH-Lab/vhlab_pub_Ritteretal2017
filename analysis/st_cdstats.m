function [y,group] = st_cdstats(cd1hz,cd4hz,cdcon,field)

% [Y,GROUP] = ST_CDSTATS(CD1HZ,CD4HZ,CDCON,FIELD) - Stats for cd stim.
% Input structures with all info for each condition from
% build_cdcondition.m. 
%
% INPUTS:
%       cd1hz - structure with 1hz training info (build_cdcondition.m)
%       cd4hz - structure with 4hz training info
%       cdcon - structure with control info
%       field - name in structure of observation to look at
% OUTPUTS: 
%       y - data for ANOVA 
%       group - group labels for data for ANOVA
%
% NOTES:
% [P,T,STATS,TERMS] = anovan(y,group);
% multcompare(STATS);
%


epochs = {'CD1','CD2','CD3','CD4'};
training_conditions = {cd1hz cd4hz cdcon};
group_names = [11 12 13 14 41 42 43 44 51 52 53 54];
group_counter = 1;

y = [];
group = [];

for i=1:3 % for each training condition
    
    for j=1:4, % for each epoch        
        y = [y; training_conditions{i}.(epochs{j}).dir.(field)']; % data
        num_sites = length(training_conditions{i}.(epochs{j}).dir.(field));
        group = [group ones(1,num_sites).*group_names(group_counter)];
        group_counter = group_counter + 1;
    end;
    
end;


[P,T,STATS,TERMS] = anovan(y,group');
multcompare(STATS);

