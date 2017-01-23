function [cdexp_age] = build_cdexp_age(path,exp)

%
%
%
%
%
%
%



cdexp_age.animal_id = exp;
cdexp_age.pen_names = tfexp_age_get_pen_names(path,exp);
cdexp_age.pen_info = cdexp_age_get_pen_info(path,exp,cdexp_age.pen_names);

[cdexp_age.resps, ...
    cdexp_age.dir, ...
    cdexp_age.other] = cdexp_age_get_summary(cdexp_age);