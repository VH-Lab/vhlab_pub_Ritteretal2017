function [trained_ori] = get_trainedori(path,exp)

% GET_TRAINED_ORI - Gets training/tested orientation for experiments.
%
% INPUTS:
%       path - location where experiments are stored
%       exp - date of experiment
%
% OUTPUTS:
%       trained_ori - training orientation, or temp freq stim test
%       orientation if no training was done.
%


pathname = strcat(path, filesep, exp{1}, filesep, 'trainingangle.txt');
trained_ori = csvread(pathname);
if trained_ori >= 180, trained_ori = trained_ori - 180; end;