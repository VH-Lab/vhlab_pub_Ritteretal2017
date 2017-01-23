function [tfc_age] = build_tfcondition_age(path,exps)

%
%
%
%
%
%




tfc_age = struct();

for i = 1:length(exps), % build struct w/ each age exp for condition
    [tfexp_age] = build_tfexp_age(path,exps{i});
    tfc_age.exps(i) = tfexp_age;
end;

[tfc_age.speed, ...
    tfc_age.dir, ...
    tfc_age.other] = tfcondition_age_get_exp_summary(tfc_age);

