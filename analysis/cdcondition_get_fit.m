function [y,fwhm1,fwhm2] = cdcondition_get_fit(curve,plotit)

%
%
%
%
%
%
%
%


x = [0 30 60 90 120 150 180 210 240 270 300 330]';
f = fit(x,curve','gauss2'); % fit data

x2 = 0:1:359; % x-axis single degree resolution
y = f.a1*exp(-((x2-f.b1)./f.c1).^2) + f.a2*exp(-((x2-f.b2)./f.c2).^2); % get fit y values

c1 = find(y(1:180) > f.a1/2); % peak 1
s11 = x2(c1(1)); % first crossing of half way point for peak 1
s12 = x2(c1(end)); % second crossing of half way point for peak 1
c2 = find(y(181:359) > f.a2/2); % peak 2
s21 = x2(c2(1)) + 180; % first crossing of half way point for peak 2
s22 = x2(c2(end) + 180); % second crossing of half way point for peak 2

fwhm1 = s12 - s11; % full width half max of peak 1 (in degrees)
fwhm2 = s22 - s21; % full wifth half max of peak 2 (in degrees)


if plotit,
    
    figure();
    hold on;
    plot(x2,y,'LineWidth',3);
    
    plot([s11 s11],[0 1],'k');
    plot([s12 s12],[0 1],'k');
    
    plot([s21 s21],[0 1],'g');
    plot([s22 s22],[0 1],'g');
    
end;











