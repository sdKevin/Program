function Date_Ser= DateGens(YearRange)
%--------------------------generate YYYY MM DD
% YearRange, years ranges e.g., [1999;2004]
Date_Ser=[];
for num=1:length(YearRange);
    year_ser=YearRange(num)*ones(12,1);
    month_ser=[1:12]';
    Date_Ser=[Date_Ser;[year_ser,month_ser]];
end
end