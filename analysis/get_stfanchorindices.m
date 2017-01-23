function [ai] = get_anchorindices(speedstested,anchor)

% [AI] = GET_ANCHORINDICES(SPEEDSTESTED,ANCHOR) - 
%
% INPUTS: 
%       speedstested - speeds tested for cell
%       anchor - anchor values for calculating pref/null direction
%
% OUTPUTS:
%       ai - indices in speeds of anchor
%
%
% NOTES:
% -
%
%

ai = [];

for i = 1:length(anchor),
    
    index = find(speedstested == anchor(i));
    ai = [ai index];
    
end;





