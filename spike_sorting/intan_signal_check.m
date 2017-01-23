function [stddevs] = intan_signal_check(dirname)

% [STDDEVS] = INTAN_SIGNAL_CHECK(DIRNAME) - Looks at Intan RHD file and 
% pulls out std of signal for each channel at each interval. For example:
%       stddevs = intan_signal_check('t00002');
% 
% NOTES:
%
%
%


start_time = 0;
interval = 30.0;
stop_time = start_time + interval;

channel_numbers = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 ...
    17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32];

% Step 1 - read in the header file and channel list

header_filename = vhintan_getdirfilename(dirname);
data_filename   = header_filename;
header = read_Intan_RHD2000_header(header_filename);

% Step 2 - Look at first 'interval' of time. Pull out total time of stim.

[~,~,tot_time] = read_Intan_RHD2000_datafile(data_filename,header,'amp',channel_numbers,start_time,stop_time);

% Step 3 - Loop through signal on each channel by interval and pull
% out std for each channel at each interval.

num_time_periods = floor(tot_time / interval);
stddevs = NaN(num_time_periods,length(channel_numbers));
[B,A] = cheby1(4,0.8,300/(0.5*header.frequency_parameters.amplifier_sample_rate),'high'); % for filtering

for i = 1:num_time_periods,
    
    [D,~,~] = read_Intan_RHD2000_datafile(data_filename,header,'amp',channel_numbers,(interval * (i-1)),(interval * i));
    D = filtfilt(B,A,D);
    
    for j = 1:length(channel_numbers),
        stddev = std(D(:,j));
        stddevs(i,j) = stddev;
    end;
    
end;







