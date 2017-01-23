function plot_cdcondition_polar(cdc)

%
%
%
%
%
%
%



angles = [0 30 60 90 120 150 180 210 240 270 300 330];
radians = (angles * pi) / 180;
radians = [radians 0];
epochs = {'CD1','CD2','CD3','CD4'};

for i = 1:4,
    
    figure();
    
    resps = cdc.(epochs{i}).resps.normresps_aligned_site_avg;
    resps = [resps resps(1)];
    
    polarplot(radians,resps,'LineWidth',3);
    set(gca,'FontSize',14);
    
end;