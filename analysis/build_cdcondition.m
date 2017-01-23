function [cdc] = build_cdcondition(path,exps)

%
%
%
%
%
%


cdc = struct();

cdc.exps = build_cdexp(path,exps);

cdc.CD1 = cdcondition_get_exp_summary(cdc.exps,'CD1');
cdc.CD2 = cdcondition_get_exp_summary(cdc.exps,'CD2');
cdc.CD3 = cdcondition_get_exp_summary(cdc.exps,'CD3');
cdc.CD4 = cdcondition_get_exp_summary(cdc.exps,'CD4');

