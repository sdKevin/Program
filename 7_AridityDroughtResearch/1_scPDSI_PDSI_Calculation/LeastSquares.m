%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
% To calibrate duration factors
function [slope, intercept] = LeastSquares(x,y, threshold)

x = reshape(x,length(x),1);
y = reshape(y,length(y),1);
cor_value = corr(x,y);
n = length(x);
X = [ones(size(x)) x];
b = regress(y,X);
i = n -1;
slope = b(2);
while abs(cor_value) < threshold && i > 3
    this_x = x([1:end-1]);
    this_y = y([1:end-1]);
    this_X = [ones(size(this_x)) this_x];
    bb = regress(this_y,this_X);
    
    cor_value = corr(this_x,this_y);
    
    x = this_x;
    y = this_y;
    n = length(x);
    i = n - 1;
    slope = bb(2);
end

if slope > 0
    y_inter = y - slope * x;
    j = find(y_inter == nanmax(y_inter));
    intercept = y_inter(j);
else
    y_inter = y - slope * x;
    j = find(y_inter == nanmin(y_inter));
    intercept = y_inter(j);
end