% Make this a function! 

% Select Directory Containing T Files

%ds = dirstruct('/Users/Neil/Desktop/2016-02-11');
ds = dirstruct('/Volumes/Data3/Neil/2016-06-10'); % school
%ds = dirstruct('/home/neil/Data/2016-04-15'); % home

% Get all cells from directory

[cells,cellnames]=load2celllist(getexperimentfile(ds),'cell*','-mat');

% Pick which T Files you want to looks at

Tnames = {'t00001'};


% For each T File, For each cell in each T File, Pull up info, if 
% it has a quality label, assess direction selectivity (pull up figure).

for t=1:length(Tnames)
    for i=1:length(cells),
        %A=findassociate(cells{i},'vhlv_clusterinfo','','');
        A=findassociate(cells{i},'vhintan_clusterinfo','','');
        if ~isempty(A),
            cellnames{i}, A.data.qualitylabel,
            singleunitgrating2(ds, cells{i}, cellnames{i}, Tnames{t}, 'angle',1);
            %singleunitgrating2(ds, cells{i}, cellnames{i}, Tnames{t}, 'tFrequency',1);
        end;
    end;
end;
