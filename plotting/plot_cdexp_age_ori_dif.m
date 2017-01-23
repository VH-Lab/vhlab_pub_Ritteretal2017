function plot_cdexp_age_ori_dif(cde)

%
%
%
%
%
%

pen_names = cde.pen_names;
numpens = length(pen_names);

figure();

subplot(1,numpens+1,1),
hist(cde.other.ori_dif_all,[30 60 90 120 150]);
title([cde.animal_id ' (All Pens)'],'Interp','None');
xlabel('Degree Difference');
ylabel('Number of Sites');

for i = 1:numpens,
    
    subplot(1,numpens+1,i+1),
    hist(cde.pen_info(i).other.ori_dif_all,[30 60 90 120 150]);
    
    title(pen_names{i},'Interp','None');
    xlabel('Degree Difference');
    ylabel('Number of Sites');
    
end;
