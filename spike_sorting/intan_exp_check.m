function [stddevs] = intan_exp_check(path,exps)

%
%
%
%
%
%
%
%

expinfo = struct(); 

for i = 1:length(exps),
    
    ds = dirstruct([path filesep exps{i}]);
    tdirs = getalltests(ds);
    numtdirs = length(tdirs);
    
    stddevs = struct(); % 32 channels, 8 time points.
    
    for j = 1:numtdirs,
        
        tdirs{j},
        stddevs(j).tdir = tdirs{j};
        stddevs(j).chan_stddevs = intan_signal_check([path filesep exps{i} filesep tdirs{j}]);
        
    end;
    
    expinfo(i).exp = exps{i};
    expinfo(i).stddevs = stddevs;
    
end;