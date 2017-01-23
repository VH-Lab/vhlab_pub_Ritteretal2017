function [bs_all,bs_dir1,bs_dir2] = tfcell_get_bs_speedmatrix(cell,tfcell,bs_reps)

% [BS_ALL,BS_DIR1,BS_DIR2] = GET_BS_STFSPEEDMATRIX(CELL,STF,BS_REPS) - 
%
% INPUTS: 
%
%
% OUTPUTS: 
%       bs_all - m x n matrix where m is number of bootstrap reps and n is
%       all velocities tested. Each bootstrap rep normalized to itself.
%       bs_dir1 - m x n matrix where m is number of bootstrap reps and n is
%       all SPEEDS tested (half of velocities) in one direction. In [3 2 1]
%       order.
%       bs_dir2 - m x n matrix where m is number of bootstrap reps and n is
%       all SPEEDS tested in the other direction. In [3 2 1] order.
%
% NOTES: 
%
%



tftype = tfcell.type;
velocities = tfcell.velocitiestested;
numvels = length(velocities);
speeds = tfcell.speedstested;
numspeeds = length(speeds);

bootstraps = nan(bs_reps,numvels);


A = findassociate(cell,tftype,'','');

if ~isempty(A),
    
    for i=1:numvels
        
        raw_resps = A.data.f0vals{1}(:,i);
        blank_resps = A.data.blank.f0vals{1}(:);
        
        for j = 1:bs_reps,
            
            bs_resps = datasample(raw_resps,length(raw_resps));
            bs_blank = datasample(blank_resps,length(blank_resps));
            
            bootstraps(j,i) = mean(bs_resps) - mean(bs_blank);
            
        end;   
        
    end;
    
end;


for i = 1:bs_reps,
    
    resps = bootstraps(i,:);
    maxresp = max(abs(resps));
    resps = resps ./ maxresp; % normalize bootsrap rep i
    bootstraps(i,:) = resps;
    
end;


bs_all = bootstraps;
bs_dir1 = bootstraps(:,1:numspeeds);
bs_dir2 = fliplr(bootstraps(:,numspeeds+1:end));















