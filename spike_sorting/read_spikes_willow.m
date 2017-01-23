function [times, dirinds, waves, spikewaveforms, EpochStartSamples, EpochNames, header] = read_spikes_willow(ds,name,ref)

% READ_SPIKES_INTAN - For each channel (name/ref pair), pull out spike
% information for each epoch (tfile).
%
%   INPUTS: 
%       ds - 
%       name - 
%       ref -
%
%   OUTPUTS:
%       times -
%
%
%



dirlist = getalltests(ds);
waves = [];
dirinds = [];
times = [];

EpochStartSamples = [];
EpochNames = dirlist;

for i=1:length(dirlist),
    
    EpochStartSamples(end+1) = length(times)+1;
    dirname = [getpathname(ds) dirlist{i}];
    channelgrouping_filename = [dirname filesep 'vhwillow_channelgrouping.txt'];
    
    if exist(channelgrouping_filename,'file'),
        channelgrouping = loadStructArray(channelgrouping_filename);
    else
        error(['No file ' channelgrouping_filename '.']);
    end;
      
    % Find which channelgrouping corresponds to our name ref
    channelgroupingnum = [];
    for m=1:length(channelgrouping),
        if strcmp(channelgrouping(m).name,name) && channelgrouping(m).ref == ref,
            channelgroupingnum = m;
            break;
        end;
    end;
    
    [spikewaveforms, header] = readvhlspikewaveformfile([dirname filesep 'willow_spikewaveforms_' int2str(channelgroupingnum) '.vsw']);
    
    try
        waves = cat(3,waves,spikewaveforms);
    catch
        error(['Spikewaveform size mismatch: previous data is ' int2str(size(waves,1)) 'x' int2str(size(waves,2)) ' but data in ' dirlist{i} ' is ' int2str(size(spikewaveforms,1)) 'x' int2str(size(spikewaveforms,2)) '.']);
    end;
    
    
    fid = fopen([dirname filesep 'willow_spiketimes_' int2str(channelgroupingnum) '.vst'],'r','b');
    spiketimes = fread(fid,'float64');
    fclose(fid);
    times = [ times; spiketimes ];
    dirinds = [dirinds; i*ones(size(spiketimes))];
    
end;

