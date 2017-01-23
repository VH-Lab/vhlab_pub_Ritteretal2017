function plot_singlecell(tfexp,cellnum)

%
%
%
%
%
%
%




tfstims = {'TF1','TF2','TF3','TF4'};
speeds = tfexp.standardspeeds;

for i = 1:4,
    
    figure();
    hold on;
     
%     pref = tfexp.(tfstims{i}).pref_all(cellnum,:);
%     null = tfexp.(tfstims{i}).null_all(cellnum,:);
%     plot(speeds,pref,'g','LineWidth',4);
%     plot(speeds,null,'r','LineWidth',4);
    
    pref_raw = tfexp.(tfstims{i}).cells(cellnum).prefnullmatrix_raw.pref;
    pref_ste = tfexp.(tfstims{i}).cells(cellnum).prefnullmatrix_raw.pref_ste;
    null_raw = tfexp.(tfstims{i}).cells(cellnum).prefnullmatrix_raw.null;
    null_ste = tfexp.(tfstims{i}).cells(cellnum).prefnullmatrix_raw.null_ste;
    
    errorbar(speeds,pref_raw,pref_ste,'g','LineWidth',4);
    errorbar(speeds,null_raw,null_ste,'r','LineWidth',4);
    
    
    set(gca,'XScale','log');
    %axis([0,max(speeds),-1,(max([pref_raw null_raw]) + max([pref_ste null_ste]))]);
    axis([0,max(speeds),-1,5]);
    %axis tight;
    
    ylabel('Response (Spikes/Sec)','FontSize',14);
    xlabel('Speed (Deg/Sec)','FontSize',14);
    legend(' Pref',' Null');
    
    
end;