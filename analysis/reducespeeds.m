function [reducedmatrix] = reducespeeds(speedmatrix)

% [REDUCED] = REDUCESPEEDS(SPEEDMATRIX) -
%
% INPUTS:
%       speedmatrix - m x n matrix where n represents speeds (not
%           velocities).
%
% OUTPUTS:
%       reduced - m x 11 matrix with 11 speeds
%
%
%
% NOTES:
% -


speeds = [25 20 16 12 10 8 6 5 4 3 2 1 0.75 0.5 0.25];
reducedspeeds = [25 20 16 12 8 6 4 2 1 0.5 0.25];
numrows = length(speedmatrix(:,1));

reducedmatrix = nan(numrows,length(reducedspeeds));

for i = 1:numrows,
    for j = 1:length(reducedspeeds),
        
        index = find(speeds == reducedspeeds(j));
        reducedmatrix(i,j) = speedmatrix(i,index);
        
    end;
end;



