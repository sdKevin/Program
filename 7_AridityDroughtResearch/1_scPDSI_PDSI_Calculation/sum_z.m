%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
function result = sum_z(data,len,sign)
% the summation for dry (wet) spells
A1=[];
for is=1:len
    A1=[A1,data(is:length(data)-len+is)];
end
Sum_A = sum(A1,2);
% if sign is equal to 1, the wet spell is calculated.
% if sign is equal to others, the dry spell is calculated.
% highest reasonable is the highest (or lowest)
% value that is not due to some freak anomaly in the data.
% "freak anomaly" is defined as a value that is either
% 1) 25% higher than the 98th percentile
% 2) 25% lower than the 2nd percentile
if sign == 1
    percentile = prctile(Sum_A,98);
    ratio = Sum_A/percentile;
    loc = find(ratio<1.25);
    SSum_A = Sum_A(loc);
    result = nanmax(SSum_A);
else
    percentile = prctile(Sum_A,2);
    ratio = Sum_A/percentile;
    loc = find(ratio<1.25);
    SSum_A = Sum_A(loc);
    result = nanmin(SSum_A);
end
end