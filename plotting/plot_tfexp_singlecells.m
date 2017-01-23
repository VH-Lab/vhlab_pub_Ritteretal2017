function plot_tfexp_singlecells(tfexp)

% PLOT_TFEXP_SINGLECELLS(TFEXP) - Plot raw responses from single cells in a
% particular experiment.
%
% INPUTS:
%       tfexp -
%
% OUTPUTS:
%
%
% NOTES:
% - Would like to compare raw and normalized. Maybe an option to plot one
% or the other.

speeds = [25 20 16 12 8 6 4 2 1 0.5 0.25] ./ 0.08;
epoch = {'TF1', 'TF2', 'TF3', 'TF4'};
numcells = length(tfexp.TF1.cells);

counter = 0;

for i = 1:4, % 4 figures each with 8 cells
    figure();
    for j = 1:8, % Each cell in figure
        
        counter = counter + 1;
        if counter <= numcells,
            
            for k = 1:4, % Each tf epoch   
                
                plot_index = (j-1)*4 + k; % put figures in right place
                ax = subplot(8,4,plot_index);
                hold on;
                
                
                pref = tfexp.(epoch{k}).cells(counter).pn_raw.pref_resps;
                pref_ste = tfexp.(epoch{k}).cells(counter).pn_raw.pref_ste;
                null = tfexp.(epoch{k}).cells(counter).pn_raw.null_resps;
                null_ste = tfexp.(epoch{k}).cells(counter).pn_raw.null_ste;
                
                blank = tfexp.(epoch{k}).cells(counter).blank;
                
                errorbar(speeds,pref,pref_ste,'g');
                errorbar(speeds,null,null_ste,'r');
                plot(speeds,blank,'ko','LineWidth',1);
                
                set(ax,'XScale','log');
                if ~isnan(max([pref+pref_ste null+null_ste])), % y axis limit
                    axis([0 max(speeds) -1 max([pref+pref_ste null+null_ste])]);
                end;
                
            end;
            
        end;
    end;
end;



