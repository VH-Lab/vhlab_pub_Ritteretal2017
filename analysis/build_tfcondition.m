function [tfcondition] = build_tfcondition(path,exps)

% [TFCONDITION] = BUILD_TFCONDITION(PATH,EXPS) - 
%
% INPUTS: 
%       path -
%       exps - 
%
% OUTPUTS: 
%
%
% NOTES - 
%
%


tfcondition.tfexps = build_tfexp(path,exps);

[tfcondition.TF1.speed, ...
    tfcondition.TF1.dir, ...
    tfcondition.TF1.other] = get_tfcondition_stuff(tfcondition.tfexps,'TF1');

[tfcondition.TF2.speed, ...
    tfcondition.TF2.dir, ...
    tfcondition.TF2.other] = get_tfcondition_stuff(tfcondition.tfexps,'TF2');

[tfcondition.TF3.speed, ...
    tfcondition.TF3.dir, ...
    tfcondition.TF3.other] = get_tfcondition_stuff(tfcondition.tfexps,'TF3');

[tfcondition.TF4.speed, ...
    tfcondition.TF4.dir, ...
    tfcondition.TF4.other] = get_tfcondition_stuff(tfcondition.tfexps,'TF4');



