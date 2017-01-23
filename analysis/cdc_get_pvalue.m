function [cd_pvalue] = cdc_get_pvalue(cell,type)

% [CD_PVALUE] - CDC_GET_PVALUE(CELL,TYPE) -
%
%
%
%
%

type = strcat(type,' resp');
cd_pvalue = NaN;

switch type % For old 1hz and 4hz test exps
    case 'Dir2Hz1 resp', type2 = 'Dir1Hz1 resp';
    case 'Dir2Hz2 resp', type2 = 'Dir1Hz2 resp';
    case 'Dir2Hz3 resp', type2 = 'Dir1Hz3 resp';
    case 'Dir2Hz4 resp', type2 = 'Dir1Hz4 resp';
end;

A = findassociate(cell,type,'','');
if isempty(A), A = findassociate(cell,type2,'',''); end;

if ~isempty(A),
    [~,cd_pvalue] = neuralresponsesig_grating(A.data,0);
    
    % Additional Exclusion Criteria
    resps = A.data.f0curve{1}(2,:); % raw responses
    if max(resps) <= 1,
        cd_pvalue = 47;
    end;
    
    
end;

