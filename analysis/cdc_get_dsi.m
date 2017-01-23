function [dsi] = cdc_get_dsi(cell,type,exclude,p)

%
%
%
%
%
%


dsi = NaN;

if p < exclude,
    
    A = findassociate(cell,['SP F0 ' type ' Ach OT Dir Circular variance'],'','');
    
    if ~isempty(A),
        dsi = A.data;
    end;
    
end;
