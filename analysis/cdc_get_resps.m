function [rawresps,normresps,blank,pref_dir,pref_ori,ori_dif] = cdc_get_resps(cell,type,exclude,p,ori_tested)

%
%
%
%
%
%
%



type = strcat(type,' resp');
rawresps = nan(1,12);
normresps = nan(1,12);
blank = NaN;
pref_dir = NaN;
pref_ori = NaN;
ori_dif = NaN;

switch type % For old 1hz and 4hz test exps
    case 'Dir2Hz1 resp', type2 = 'Dir1Hz1 resp';
    case 'Dir2Hz2 resp', type2 = 'Dir1Hz2 resp';
    case 'Dir2Hz3 resp', type2 = 'Dir1Hz3 resp';
    case 'Dir2Hz4 resp', type2 = 'Dir1Hz4 resp';
end;

if p < exclude, % exclusion criteria
    
    A = findassociate(cell,type,'','');
    if isempty(A), A = findassociate(cell,type2,'',''); end;
    
    if ~isempty(A),
        resps = A.data.f0curve{1}(2,:);
        blank = A.data.blank.f0curve{1}(2);
        rawresps = resps - blank;
        normresps = rawresps ./ max(abs(rawresps)); % aligned looks weird if site max abs value is a negative
        %normresps = rawresps ./ max(rawresps); 
    end;
    
    % Get preferred direction/orientation
    orientations = [0 30 60 90 120 150 180 210 240 270 300 330];
    maxresp_ind = find(resps == max(resps));
    pref_dir = orientations(maxresp_ind(1)); % might be more than 1, take smaller numerical angle if so
    
    if pref_dir < 180,
        pref_ori = pref_dir;
    else
        pref_ori = pref_dir - 180;
    end;
    
    ori_dif = abs(pref_ori - ori_tested);
    
    if ori_dif > 90,
        ori_dif = 90 - (ori_dif - 90);
    end;
    
end;




