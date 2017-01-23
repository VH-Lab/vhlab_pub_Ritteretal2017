function plot_tfcondition_speed(tfc)

%
%
%
%
%
%




speeds = [25 20 16 12 8 6 4 2 1 0.5 0.25] ./ 0.08;
epoch = {'TF1', 'TF2', 'TF3', 'TF4'};

figure();

for i = 1:4,
    
    subplot(2,4,i),
    hold on;
    
    site_pref_avg = tfc.(epoch{i}).speed.site_pref_avg;
    site_pref_ste = tfc.(epoch{i}).speed.site_pref_ste;
    site_null_avg = tfc.(epoch{i}).speed.site_null_avg;
    site_null_ste = tfc.(epoch{i}).speed.site_null_ste;
    
    errorbar(speeds,site_pref_avg,site_pref_ste,'g','LineWidth',3);
    errorbar(speeds,site_null_avg,site_null_ste,'r','LineWidth',3);
    
    hold off;
    set(gca,'XScale','log');
    set(gca,'Xtick',[3 6 12 25 50 100 300]);
    axis([0 max(speeds) -0.1 1]);
    axis square;
    
    numcells = tfc.(epoch{i}).other.numcells;
    numfiltered = tfc.(epoch{i}).other.filtered;
    title(['Num Cells: ' int2str(numcells) ' Filtered: ' int2str(numfiltered)]);
       
end;


for i = 1:4
    
    subplot(2,4,i+4);
    hold on;
    
    pref_avg = tfc.(epoch{i}).speed.animal_pref_avg;
    pref_ste = tfc.(epoch{i}).speed.animal_pref_ste;
    animal_pref_avgs = tfc.(epoch{i}).speed.animal_pref_all;
    
    null_avg = tfc.(epoch{i}).speed.animal_null_avg;
    null_ste = tfc.(epoch{i}).speed.animal_null_ste;
    animal_null_avgs = tfc.(epoch{i}).speed.animal_null_all;
    
    errorbar(speeds,pref_avg,pref_ste,'k','LineWidth',3);
    errorbar(speeds,null_avg,null_ste,'k--','LineWidth',3);
    
    if i == 1,
        legend('Preferred','Null');
    end;
    
    plot(speeds,animal_pref_avgs,'k');
    plot(speeds,animal_null_avgs,'k--');
    
    hold off;
    set(gca,'XScale','log');
    axis([0 max(speeds) -0.2 1]);
    set(gca,'Xtick',[3 6 12 25 50 100 300],'LineWidth',3);
    %axis square;
    
%     if i == 1, 
%         leg = legend(' Preferred', ' Null'); 
%         set(leg,'Location','southwest');
%     end;
%     
end;





