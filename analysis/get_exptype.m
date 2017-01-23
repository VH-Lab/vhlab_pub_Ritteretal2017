function [exptype] = get_exptype(path,exp)

% GET_EXPTYPE - Gets type of speed training experiment.
%
% INPUTS:
%       path - location where experiments are stored
%       exp - date of experiment
%
% OUTPUTS:
%       exptype - 'control', '1hz training', '4hz training', or 'adult'.
%       Read from 'trainingtemporalfrequency.txt'.
%
% NOTES:
%
% - Currently control is 0, 1 hz is 1, 4 hz is 4, and adult is 5 in
% 'trainingtemporalfrequency.txt'.
%
%


pathname = strcat(path, filesep, exp{1}, filesep, 'trainingtemporalfrequency.txt');
exptype = csvread(pathname);




