function [y,group] = st_tfstats(tf1hz,tf4hz,tfcon,field)

% [Y,GROUP] = ST_TFSTATS(TF1HZ,TF4HZ,TFCON) - Stats for TF stim using.
% Input all info for each condition from build_tfcondition.m.
%
% INPUTS:
%       tf1hz - structure with 1hz training info (build_tfcondition.m)
%       tf4hz - structure with 4hz info
%       tfcon - structure with control info
%       field - name in structure of observation to look at
% OUTPUTS:
%       y - data for ANOVA
%       group - group labels for data for ANOVA
%
% NOTES: -
% [P,T,STATS,TERMS] = anovan(y,group);
% multcompare(STATS);
%
%


epochs = {'TF1','TF2','TF3','TF4'};
training_conditions = {tf1hz tf4hz tfcon};
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






