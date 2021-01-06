%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
function [pdsi] = PDSI(DATA,cal_year_beg, cal_year_end)
%The Palmer drought severity index
% Input Data
% DATA : Monthly Data matrix,including [year,month,monthly potential evapotranspiration,
%        monthly precipitation,available water capacity].
%        unit of monthly precipitation,potential evapotranspiration,available water capacity: mm
% cal_year_beg : Start year of calibration period
% cal_year_end : End year of calibration period

% Output Data
% pdsi: The value of the Palmer drought severity index.

%% Input data
% The data is sorted in ascending order of year and month
DATA=sortrows(DATA,[1 2]);
% The full sequence of the monthly potential evapotranspiration
% /25.4 is to to convert mm to inch
PET = DATA(1:end,3)/25.4;
% The full sequence of the monthly precipitation
P = DATA(1:end,4)/25.4;
% The available water capacity
AWC=unique(DATA(:,5));
AWC=AWC/25.4;

% The starting serial number of calibration period
cal_index_beg = find((DATA(:,1) == cal_year_beg) & (DATA(:,2) == 1));
% The ending serial number of calibration period
cal_index_end = find((DATA(:,1) == cal_year_end) & (DATA(:,2) == 12));

% If the calibration period is a full sequence, cal_index_end is marked as 0
if cal_index_end == length(P) && cal_index_beg == 1
    cal_index_end = 0;
end

% If the annual precipitation is 0, no calculation is performed
if nanmean(P) == 0
    pdsi = nan;
else
    % The first year data is repeated twice to spin-up
    P_tem = [P(1:12);P(1:12);P];
    PET_tem = [PET(1:12);PET(1:12);PET];
    
    % Water balance calculation
    [ET,PR,R,RO,PRO,L,PL] = WaterBalance(AWC,PET_tem,P_tem);
    % Delete the data of the spin-up period
    ET(1:24) = [];
    PR(1:24) = [];
    R(1:24) = [];
    RO(1:24) = [];
    PRO(1:24) = [];
    L(1:24) = [];
    PL(1:24) = [];
    
    % the moisture anomalies,Z index calculation
    [z, k, d, Phat] = Z_index_PDSI(P, PET, ET, PR, R, PRO, RO, PL, L, cal_index_beg, cal_index_end);
    % Palmer parameter.
    md = 0.309;
    bd = 2.691;
    mw = 0.309;
    bw = 2.691;
     % To calculate the PDSI
    [ProbO, XO1,XO2,XO3,XO] = calcAllx( z,mw, bw,md, bd);
    pdsi = reshape(XO,[],1);
end
end
