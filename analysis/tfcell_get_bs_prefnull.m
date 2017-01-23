function [bs_pref,bs_null] = tfcell_get_bs_prefnull(tfcell,bs_reps)

%
%
%
%
%
%
%
%
%
%
%


anchor_indices = tfcell.anchor_indices;
d1 = tfcell.bs_speedmatrix_d1;
d2 = tfcell.bs_speedmatrix_d2;

numspeeds = length(tfcell.speedstested);
bs_pref = nan(bs_reps,numspeeds);
bs_null = nan(bs_reps,numspeeds);

for i = 1:bs_reps,
    
    d1_sum = 0;
    d2_sum = 0;
    
    for j = 1:length(anchor_indices),
        d1_sum = d1_sum + d1(i,anchor_indices(j));
        d2_sum = d2_sum + d2(anchor_indices(j));
    end;
    
    if d1_sum >= d2_sum
        bs_pref(i,:) = d1(i,:);
        bs_null(i,:) = d2(i,:);
    else
        bs_pref(i,:) = d2(i,:);
        bs_null(i,:) = d1(i,:);
    end;
    
end;


  



    