function [data] = lsim_get_cddata(cd1hz,cd4hz,cdcon,cat,index)

% [DATA] = LSIM_GET_CDDATA(CD1HZ,CD4HZ,CDCON) - pull data out of cd condition
% structures in a format that can be plugged into the linear selectivity
% increase model.
%
% INPUTS:
%       cd1hz - 1Hz training condition info
%       cd4hz - 4Hz training condition info
%       cdcon - control info
%       cat - 'speed', 'dir' or 'other' ... where index is in structure
%       index - e.g. 'cv_site_all' or 'dcv_site_all' or 'tunewidth_all'
% OUTPUTS:
%       data - should be a matrix with each data point, where each row is:
%       DATA(i,:) = [ DSI TRAINING_TYPE TIME_POINT ANIMAL_NUMBER ]
%
% NOTES: 


epochs = {'CD1','CD2','CD3','CD4'};
numepochs = length(epochs);
data = [NaN NaN NaN NaN];

% For cd1hz
numexps = length(cd1hz.exps);
for i = 1:numexps,
    for j = 1:numepochs,
        
        numsites = length(cd1hz.exps(i).(epochs{j}).(cat).(index));
        
        for k = 1:numsites,
            dsi = cd1hz.exps(i).(epochs{j}).(cat).(index)(k);
            data = [data; [dsi 1 j i]];        
        end;
        
    end;
end;


% For cd4hz
numexps = length(cd4hz.exps);
for i = 1:numexps,
    for j = 1:numepochs,
        
        numsites = length(cd4hz.exps(i).(epochs{j}).(cat).(index));
        
        for k = 1:numsites,
            dsi = cd4hz.exps(i).(epochs{j}).(cat).(index)(k);
            data = [data; [dsi 4 j i]];        
        end;
        
    end;
end;


% for cdcon
numexps = length(cdcon.exps);
for i = 1:numexps,
    for j = 1:numepochs,
        
        numsites = length(cdcon.exps(i).(epochs{j}).(cat).(index));
        
        for k = 1:numsites,
            dsi = cdcon.exps(i).(epochs{j}).(cat).(index)(k);
            data = [data; [dsi 0 j i]];        
        end;
        
    end;
end;

% Take out all NaN values
indices = find(~isnan(data(:,1)));
data = data(indices,:,:,:);



