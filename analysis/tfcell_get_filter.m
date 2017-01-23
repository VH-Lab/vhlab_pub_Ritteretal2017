function [filter] = tfcell_get_filter(cell,tftype)

% [FILTER] = TFCELL_GET_FILTER(CELL,TFTYPE) -
%
%
%
%
%
% Notes:
% - Called by: build_tfcell.m,



filter = 1; % Change to 0 if SHOULD INCLUDE.

switch tftype % get corresponding cdtype
    case 'TF1 resp',
        cdtype1 = 'Dir2Hz1 resp';
        cdtype2 = 'Dir1Hz1 resp';
    case 'TF2 resp',
        cdtype1 = 'Dir2Hz2 resp';
        cdtype2 = 'Dir1Hz2 resp';
    case 'TF3 resp',
        cdtype1 = 'Dir2Hz3 resp';
        cdtype2 = 'Dir1Hz3 resp';
    case 'TF4 resp',
        cdtype1 = 'Dir2Hz4 resp';
        cdtype2 = 'Dir1Hz4 resp';
end;


B = findassociate(cell,cdtype1,'','');
if isempty(B), B = findassociate(cell,cdtype2,'',''); end; % If old 1hz and 4hz exp

if ~isempty(B),
    
    % Get Training Orientation (0 <= angle < 180)
    C = findassociate(cell,'Training Angle','','');
    ori_tested = C.data;
    if ori_tested >= 180, ori_tested = ori_tested - 180; end;
    
    
    % Get site preferred orientation
    resps = B.data.f0curve{1}(2,:);
    
    orientations = [0 30 60 90 120 150 180 210 240 270 300 330];
    maxresp_ind = find(resps == max(resps));
    pref_dir = orientations(maxresp_ind(1)); % might be more than 1, take smaller numerical angle if so
    
    if pref_dir < 180,
        pref_ori = pref_dir;
    else
        pref_ori = pref_dir - 180;
    end;
    
    % Get difference between preferred and trained orientation.
    % 0 <= difference <= 90
    
    ori_dif = abs(pref_ori - ori_tested);
    
    if ori_dif > 90,
        ori_dif = 90 - (ori_dif - 90);
    end;
    
    if ori_dif <= 30,
        filter = 0;
    end;
    
end;


% Check Blank Value. IF above 25 hz, then do not include cell

A = findassociate(cell,tftype,'','');
if ~isempty(A),
    
    resps = A.data.f0curve{1}(2,:); % raw responses
    blank = A.data.blank.f0curve{1}(2); % blank response
    
    if blank > 25, filter = 1; end;
    
    % find response at two hz ... if less than 1, exclude    
    if length(resps) == 30, % for newer speeds
        if resps(11) - blank < 1 && resps(20) - blank < 1,
            filter = 1;
        end;
    end;
    
    if length(resps) == 22, % for older speeds
        if resps(8) - blank < 1 && resps(15) - blank < 1,
            filter = 1;
        end;  
    end;
    
end;








