function lsim_plot(slope_dist,alphas_dist)

% LSIM_PLOT(SLOPE_DIST,ALPHAS_DIST,TYPES) - Plot output of
% bootstrap_linear_slectivity_increasem_model.m
%
% INPUTS:
%       slopes_dist -
%       alphas_dist -
%       types -
%
%
% NOTES:
%
%

figure();

for i = 1:3,
    
    subplot(3,1,i);
    hold on;
    
    histogram(slope_dist(:,i),25);
    % axis([-.1 0.2 0 200]);
    axis([-.2 .4 0 200]);
    
    sorted_slope_dist = sort(slope_dist(:,i));
    five_percent = sorted_slope_dist(50);
    ninetyfive_percent = sorted_slope_dist(950);
    
    plot([five_percent five_percent],[0 200]);
    plot([ninetyfive_percent ninetyfive_percent],[0 200]);
    
end;
suptitle('Slope Distribution');


figure();

for i = 1:14,
    
    subplot(5,3,i);
    hold on;
    
    histogram(alphas_dist(:,i),25);
    axis([0 1 0 2000])
    
end;



