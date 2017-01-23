function [clusterids, clusterinfo] = cluster_spikewaves(waves,ref,EpochStart,EpochStop)

% CLUSTER_SPIKEWAVES - 
%
%   INPUTS: 
%
%
%   OUTPUTS: 
%       clusterids -
%       CI - 
%
%
%
% NOTES:
%
%


clusterinfo = struct('number',[],'qualitylabel','','number_of_spikes',[],'meanshape',[],'EpochStart',[],'EpochStop',[]);
clusterinfo = clusterinfo([]);
clusterids = [];

number_of_spikes = length(waves(1,1,:));


clusterinfo(1).number = ref;
clusterinfo(1).qualitylabel = 'Multi-unit';
clusterinfo(1).number_of_spikes = number_of_spikes;
clusterinfo(1).meanshape = nanmean(waves,3);
clusterinfo(1).EpochStart = EpochStart;
clusterinfo(1).EpochStop = EpochStop;


clusterids = ones(number_of_spikes,1);