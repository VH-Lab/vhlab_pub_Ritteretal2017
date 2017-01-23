function write_spikes(ds,clusterids,CI,name,ref,dirlist,dirinds,times)

% WRITE_SPIKES - 
%
%
%
%


clusterlist = unique(clusterids);
if any(isnan(clusterlist)), clusterlist = clusterlist(1:find(isnan(clusterlist),1,'first')); end;

 % step 3 - write the spike times back to disk

fname_prefix = ['intan_st_' name '_' int2str(ref) '_'];
infofname_prefix = ['intan_ci_' name '_' int2str(ref) '_'];

% fname_prefix = ['willow_st_' name '_' int2str(ref) '_'];
% infofname_prefix = ['willow_ci_' name '_' int2str(ref) '_'];


for i=1:length(dirlist),
	dirname = [getpathname(ds) filesep dirlist{i}];
	dirinds_here = find(dirinds==i);  %  the indexes that were collected in this directory
	% clear any existing clusters
	for j=0:20,
		try,
			warn_state = warning;
			warning off;
			delete([dirname filesep fname_prefix sprintf('%0.3d', j) '.txt']);
			delete([dirname filesep infofname_prefix sprintf('%0.3d', j) '.mat']);
			warning(warn_state);
		end;
	end;
	for j=1:length(clusterlist),
		clusterinds = find(clusterids(dirinds_here)==clusterlist(j)); % find the subset of indexes here that were part of this cluster
		timeshere = times(dirinds_here(clusterinds));  % grab the times of those events
		dlmwrite([dirname filesep fname_prefix sprintf('%0.3d', clusterlist(j)) '.txt' ], timeshere,'delimiter',' ','precision',10);
		clusterinfo = CI(j);
		save([dirname filesep infofname_prefix sprintf('%0.3d',clusterlist(j)) '.mat'], 'clusterinfo','-mat');
		if isempty(timeshere),	% if we have no spiketimes here, check to make sure the unit is "present" here
			if isfield(CI(j),'EpochStart') & isfield(CI(j),'EpochStop'),
				z1=find(strcmp(CI(j).EpochStart,dirlist),1,'first');
				z2=find(strcmp(CI(j).EpochStop,dirlist),1,'first');
				if i>=z1 & i<=z2, % recording is present here, no modifications needed
                else % recording is not present here; we shouldn't have an empty file but rather no file
					% that is, it's not that we were listening and the cell did not spike; we weren't even listening to it
					try,
						warn_state = warning;
						warning off;
						delete([dirname filesep fname_prefix sprintf('%0.3d',clusterlist(j)) '.txt']);
						delete([dirname filesep infofname_prefix sprintf('%0.3d',clusterlist(j)) '.mat']);
						warning(warn_state);
					end;
				end;
			end;
		end;
	end;
end;