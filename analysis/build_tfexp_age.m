function [tfexp_age] = build_tfexp_age(path,exp)

% [TFEXP_AGE] = BUILD_TFEXP_AGE(PATH_EXP) -
%
% INPUTS:
%       path -
%       exp -
%
% OUTPUTS:
%       tfexp_age -
%
% NOTES:
%
%


tfexp_age.animal_id = exp;
tfexp_age.pen_names = tfexp_age_get_pen_names(path,exp);
tfexp_age.pen_info = tfexp_age_get_pen_info(path,exp,tfexp_age.pen_names);

[tfexp_age.speed, ...
    tfexp_age.dir, ...
    tfexp_age.other] = tfexp_age_get_pen_summary(tfexp_age);


