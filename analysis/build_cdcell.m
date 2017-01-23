function [cdc] = build_cdcell(cells,cellnames,type,ori_tested)

% [CDC] = BUILD_CDCELL(CELLS,CELLNAMES,TYPE) -
%
% INPUTS:
%       cells -
%       cellnames -
%       type - 'Dir2Hz1' not 'Dir2Hz1 resp'!
%       ori_tested - Orientation at which complementary TF stim was run.
%
% OUTPUTS:
%       cdc - structure w/ site/cell info for coarse direction stim
%           .cellname
%           .type
%           .cd_pvalue
%           .rawresps
%           .normreps
%           .pref_dir
%           .pref_ori
%           .dsi
%           .
% NOTES:
% - [cells,cellnames]=readcellsfromexperimentlist(pwd,{'2016-02-11'},0,50)
%       filters for willow cells without all the Spike2 stuff.


numcells = length(cells);
cdc(numcells) = struct(); % Initialze cdc structure.

for i = 1:numcells,
    
    cdc(i).cellname = cellnames{i};
    cdc(i).type = type;
    cdc(i).ori_tested = ori_tested;
    cdc(i).cd_pvalue = cdc_get_pvalue(cells{i},type);
    
    p = cdc(i).cd_pvalue;
    cdc(i).filter = cdc_get_filter(cells{i},type);
    if cdc(i).filter, p = 47; end; % comment this line in/out for filter
    exclude = 0.05;
    
    [cdc(i).rawresps, ... % A.data.f0curve
        cdc(i).normresps, ...
        cdc(i).blank, ...
        cdc(i).pref_dir, ...
        cdc(i).pref_ori, ...
        cdc(i).ori_dif] = cdc_get_resps(cells{i},type,exclude,p,ori_tested);
    
    [cdc(i).rawresps_aligned, ...
        cdc(i).normresps_aligned] = cdc_get_aligned_resps(cdc(i));
    
    cdc(i).dir = cdc_get_dir(cdc(i));
        
    cdc(i).oridirtest = extract_oridir_test(cells{i},'SP F0 ',type, 'Ach ', 1); % Steve's Function
    cdc(i).tunewidth = NaN;
    if p < exclude, cdc(i).tunewidth = cdc(i).oridirtest.tunewidth; end;
    
end;







