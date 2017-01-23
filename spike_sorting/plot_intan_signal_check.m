function plot_intan_signal_check(stddevs)

%
%
%
%
%
%

max_stdev = max(stddevs(:));
num_intervals = length(stddevs(:,1));

figure();
hold on;

for i = 1:32,
    
    subplot(8,4,i);
    plot(stddevs(:,i));

    %axis([0 num_intervals 0 2*max_stdev]);
    
end;


