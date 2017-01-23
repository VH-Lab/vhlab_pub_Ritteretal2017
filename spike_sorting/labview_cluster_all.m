function labview_cluster_all(expnames)

% CLUSTER_ALL - Run after threshold_all. Takes a list of experiment names
%   and goes through each T-File clustering all spikes for each channel
%   into one multiunit cluster.
%
%   INPUTS:
%       expnames - cell array of experiment names, e.g. {'2014-12-02', ...}
%
%
% Notes:
% - methods(dirstruct)
% - To test, manually multi unit sort entire thing and compare


for i = 1:length(expnames),
    
    ds = dirstruct(expnames{i});
    tdirs = getalltests(ds);
    namerefs = getnamerefs(ds,tdirs(1)); % should be 32 channels
    
    
    for j = 1:length(namerefs), % for all 32 channels
        
        disp(['Working on experiment ' getpathname(ds) ' channel ' int2str(j)]);
        
        name = namerefs(j).name;
        ref = namerefs(j).ref;
        
        [times,dirends,waves,~,~,EpochNames,~] = labview_read_spikes(ds,name,ref); % read spikes for chan j
        
        [clusterids,CI] = cluster_spikewaves(waves,ref,EpochNames{1},EpochNames{end});
        
        labview_write_spikes(ds,clusterids,CI,name,ref,EpochNames,dirends,times);
        
        
    end;
    
end;




