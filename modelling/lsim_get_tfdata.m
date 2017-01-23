function [data] = lsim_get_tfdata(tf1hz,tf4hz,tfcon,loc,index)

% [DATA] = LSIM_GET_TFDATA(TF1HZ,TF4HZ,TFCON) - pull data out of tf condition
% structures in a format that can be plugged into the linear selectivity
% increase model.
%
% INPUTS:
%       tf1hz - 1Hz training condition info
%       tf4hz - 4Hz training condition info
%       tfcon - control info
%       index - e.g. '
% OUTPUTS:
%       data - should be a matrix with each data point, where each row is:
%       DATA(i,:) = [ DSI TRAINING_TYPE TIME_POINT ANIMAL_NUMBER ]
%
% NOTES: 
% - Unique animal ID in each training type? Can reuse num between training
% type?
% - sites don't persist ... 
% Add num hours as input to fun


epochs = {'TF1','TF2','TF3','TF4'};
%epochs = {'TF1','TF2','TF3'};
numepochs = length(epochs);
data = [NaN NaN NaN NaN];

% For tf1hz
numexps = length(tf1hz.tfexps);
for i = 1:numexps,
    for j = 1:numepochs,
        
        numsites = length(tf1hz.tfexps(i).(epochs{j}).(loc).(index));
        
        for k = 1:numsites,
            dsi = tf1hz.tfexps(i).(epochs{j}).(loc).(index)(k);
            data = [data; [dsi 1 j i]];        
        end;
        
    end;
end;


% For tf4hz
numexps = length(tf4hz.tfexps);
for i = 1:numexps,
    for j = 1:numepochs,
        
        numsites = length(tf4hz.tfexps(i).(epochs{j}).(loc).(index));
        
        for k = 1:numsites,
            dsi = tf4hz.tfexps(i).(epochs{j}).(loc).(index)(k);
            data = [data; [dsi 4 j i]];        
        end;
        
    end;
end;


% for tfcon
numexps = length(tfcon.tfexps);
for i = 1:numexps,
    for j = 1:numepochs,
        
        numsites = length(tfcon.tfexps(i).(epochs{j}).(loc).(index));
        
        for k = 1:numsites,
            dsi = tfcon.tfexps(i).(epochs{j}).(loc).(index)(k);
            data = [data; [dsi 0 j i]];        
        end;
        
    end;
end;

% Take out all NaN values
indices = find(~isnan(data(:,1)));
data = data(indices,:,:,:);



