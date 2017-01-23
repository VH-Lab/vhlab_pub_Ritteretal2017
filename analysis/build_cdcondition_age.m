function [cdc_age] = build_cdcondition_age(path,exps)

%
%
%
%
%
%
%



cdc_age = struct();

for i = 1:length(exps), % build struct w/ each age exp for condition
    [cdexp_age] = build_cdexp_age(path,exps{i});
    cdc_age.exps(i) = cdexp_age;
end;

[cdc_age.resps, ...
    cdc_age.dir, ...
    cdc_age.other] = cdcondition_age_get_exp_summary(cdc_age);