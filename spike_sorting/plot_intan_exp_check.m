function plot_intan_exp_check(stddevs)



interval_lengths = [];
interval = [];
for i = 1:8,
    interval_lengths = [interval_lengths length(stddevs(i).chan_stddevs(:,1))];
    interval = [interval sum(interval_lengths)];
end;

combined_stddevs = [];
for i = 1:8, % for each tfile
    combined_stddevs = [combined_stddevs; stddevs(i).chan_stddevs];
end;
    

figure();

for i = 1:16, % For channels 1:16
    
    subplot(4,4,i), % subplot for each channel
    hold on;
    
    plot(combined_stddevs(:,i));
    line([interval;interval],[min(combined_stddevs(:)),max(combined_stddevs(:))]);
    
end;

suptitle('Channels 1:16');

figure();

for i = 17:32, % For channels 17:32
    
    subplot(4,4,i-16), % subplot for each channel
    hold on;
    
    plot(combined_stddevs(:,i));
    line([interval;interval],[min(combined_stddevs(:)),max(combined_stddevs(:))]);
    
end;

suptitle('Channels 17:32');

