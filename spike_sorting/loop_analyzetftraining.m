function loop_analyzetftraining(exps)


for i = 1:length(exps)
    
    exps{i},
    analyzetftraining(exps{i},1,1,0,1);
    
end;