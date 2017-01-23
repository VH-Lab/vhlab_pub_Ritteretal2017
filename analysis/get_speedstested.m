function [speedstested] = get_speedstested(cell)

% GET_SPEEDSTESTED - Find all speeds that were tested for cell.
%
% INPUTS:
%       cells - One cell
%       types - TF types, e.g. {'TF1 resp', 'TF2 resp', ...}
%
% OUTPUTS:
%       speedstested - All speeds tested for cell. In [3 2 1 1 2 3] order.
%


types = {'TF1 resp', 'TF2 resp', 'TF3 resp', 'TF4 resp'};
speedstested = [];

for i = 1:length(types),
    
    A = findassociate(cell,types{i},'','');
    
    if ~isempty(A),
        speedstested = [speedstested A(end).data.f0curve{1}(1,:)];
    end;
    
end;

speedstested = unique(speedstested);
speedstested = [sort(speedstested,'descend') sort(speedstested,'ascend')];
