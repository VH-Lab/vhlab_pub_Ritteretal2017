function updateallthedudes_intan(path,expnames)

% 
%
%
%
%
%
%

for i = 1:length(expnames),
    
    pathname = strcat(path,expnames{i});
 
    ds = dirstruct(pathname);
    
    namerefs = getallnamerefs(ds);
    
    for r = 1:length(namerefs),
        namerefs(r);
        pause(5.1);
        importspikedata_intan(ds,namerefs(r));
    end;
    
end;