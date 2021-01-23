%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
% To calibrate duration factors
function [md, bd, mw, bw] = DurFact(z, dur_mode, dur_cal_range)
% Input Data
% z : the moisture anomalies.
% dur_mode : the mode of lengths for the regression between the length and (cumulative)
%            severity of the most extreme drought. Recommended to be set to 1.
% dur_cal_range : The method in defining the driest and wettest spells. Recommended to be set to 1.

% Output Data
% md, bd, mw, bw :  m is the slope of the line and b is the intercept. d
% and w are dry spell and wet spell, respectively.

if dur_cal_range == 1
    len = [3,6,9,12,18,24,30,36,42,48];
else
    len = [3:3:18];
end

dry_spells = zeros(size(len));
wet_spells = zeros(size(len));

% only the negative (positive) Z values
z_neg = z; z_neg(z_neg>0) = 0;
z_pos = z; z_pos(z_pos<0) = 0;

for i = 1 : length(len)
    if dur_mode == 1
        try
            %  uses only the negative (positive) Z values for the summation for dry (wet) spells
            dry_spells(i) = sum_z(z_neg,len(i),-1);
            wet_spells(i) = sum_z(z_pos,len(i),1);
        catch
            continue
        end
        
    else
        % uses all the Z values in the summation and finds the smallest
        %sum as the Z©\sum value for the driest spell and the largest
        %sum as the Z©\sum value for the wettest spell for a given time length
        dry_spells(i) = sum_z(z,len(i),-1);
        wet_spells(i) = sum_z(z,len(i),1);
    end
end

% Use linear regression to find parameters namely m and b, for dry spell
[md, bd] = LeastSquares(len, dry_spells, 0.85);

md = md / -4;
bd = bd / -4;

% Use linear regression to find parameters namely m and b, for wet spell
[mw, bw] = LeastSquares(len,wet_spells, 0.85);

mw = mw / 4;
bw = bw / 4;


z1 = (z<0);
num_neg = length(find(z1==1));
z2 = (z>0);
num_pos = length(find(z2==1));
if num_neg/length(z) > 0.9
    mw = md;
    bw = bd;
elseif num_pos/length(z) > 0.9
    md = mw;
    bd = bw;
end
end