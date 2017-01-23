function extractall(path,expnames)

% EXTRACTALL - 
%
%
%
%
%
%



for i=1:length(expnames),
    
    dir = dirstruct([path expnames{i}]);
    tfiles = getalltests(dir);
    
    disp(['Exctracting exp: ' expnames{i}]);
    
    for j=1:length(tfiles),
        
        disp(tfiles(j));
        
        [wavetimes, t] = vhlv_extractwaveforms(strcat([path expnames{i} filesep tfiles{j}]),[-10 25],15,'MEDIAN_FILTER_ACROSS_CHANNELS',1);
        
    end;
end;