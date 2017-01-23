function [cdstim] = build_cdstim(cells,cellnames,type,ori_tested)

% [CDSTIM] = BUILD_CDSTIM(CELLS,CELLNAMES,TYPE,ORI_TESTED) - 
%
%
%
%
%
%
%


cdstim.cells = build_cdcell(cells,cellnames,type,ori_tested);

[cdstim.resps, ...
    cdstim.dir, ...
    cdstim.other] = cdstim_get_summary(cdstim.cells);


