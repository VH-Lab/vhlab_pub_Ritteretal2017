function [tfpvalue] = get_stfpvalue(cell,tftype)

% [TFPVALUES] = GET_STFPVALUES(CELL,TFTYPE) - finds probability that there
% is no variation across the stims and blank for stim tftype for cell.
%
%
% INPUTS: 
%       cell - cell from readcellsfromexperimentlist.m
%       tftype - 'TF1 resp', 'TF2 resp', 'TF3 resp', or 'TF4 resp'
%
% OUTPUTS: 
%       tfpvalue - probability that there is no variation across the stims
%       and blank for stim tftype.
%

tfpvalue = NaN;

A = findassociate(cell,tftype,'','');

    if ~isempty(A),
        
        [~,tfpvalue] = neuralresponsesig_grating(A.data,0);
        
        % Additional Exclusion Criteria
        resps = A.data.f0curve{1}(2,:); % raw responses
        blank = A.data.blank.f0curve{1}(2); % blank response 
        
        if max(resps - blank) <= 1,
            tfpvalue = 47;
        end;
        
        
    end;