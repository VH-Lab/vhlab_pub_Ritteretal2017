function [tfcell] = build_tfcell(cells,cellnames,type)

% [TFCELL] = BUILD_TFCELL(CELLS,CELLNAMES,TYPE) -
%
% INPUTS: 
%       cells - From Steve's readcellsfromexperimentlist
%       cellnames - From Steve's readcellsfromexperimentlist
%       type - 'TF1 resp' or 'TF2 resp' ... etc
%
% OUTPUTS: 
%       tfcell - structure with information for site/cells for tfstim type
%           .cell - 
%           .cellname -
%           .type - 
%           .velocitiestested - 
%           .speedstested - 
%           .standardspeeds - 
%           .anchor -
%           .anchor_indices - 
%           .tfpvalue - 
%           .filter
%           .sm_raw - 
%           .sm_norm
%           .blank - 
%           .pn_raw -
%           .pn_norm -
%           .mmm -
%           .dir2 - 
%           .tstat - 
%           .speed_pref_pref - speed preference in preferred direction
%           .maxresp_pref - max response in preferred direction (hz)
%           .speed_pref_null - speed preference in null direction
%           .maxresp_null - max response in null direction (hz)
%
% NOTES:
%
%





numcells = length(cells);
tfcell(length(cells)) = struct(); % initialize tfcell structure

for i = 1:numcells,
    
    tfcell(i).cell = cells{i}; % Steve cell
    tfcell(i).cellname = cellnames{i}; % Steve cell name
    tfcell(i).type = type;
    
    tfcell(i).velocitiestested = get_speedstested(cells{i});
    tfcell(i).speedstested = fliplr(unique(tfcell(i).velocitiestested));
    tfcell(i).standardspeeds = [25 20 16 12 8 6 4 2 1 0.5 0.25] ./ 0.08;
    tfcell(i).anchor = [1 2 4];
    tfcell(i).anchor_indices = [9 8 7];
    
    % Cell exculsion criteria
    tfcell(i).tfpvalue = get_stfpvalue(cells{i},type);
    p = tfcell(i).tfpvalue;
    tfcell(i).filter = tfcell_get_filter(cells{i},type);
    if tfcell(i).filter, p = 47; end; % comment this line in/out for filter
    exclude = 0.05;
    
    % Pull out cell's responses to temporal frequency stimulus
    [tfcell(i).sm_raw, ...
        tfcell(i).sm_norm, ...
        tfcell(i).blank] = tfcell_get_speedmatrix(tfcell(i),p,exclude);
    
    % Sort responses to temporal frequency stimulus
    [tfcell(i).pn_raw, ...
        tfcell(i).pn_norm] = tfcell_get_prefnullmatrices(tfcell(i));

    % Calculate direction indices at each tf in temporal frequency stimulus
    [tfcell(i).mmm, ...
        tfcell(i).dir2, ...
        tfcell(i).tstat] = tfcell_get_dir(tfcell(i));
     
    % Find cell's single preferred speed
    [tfcell(i).speed_pref_pref, ...
        tfcell(i).maxresp_pref, ...
        tfcell(i).speed_pref_null, ...
        tfcell(i).maxresp_null] = tfcell_get_speed_pref(tfcell(i));
    

end;






