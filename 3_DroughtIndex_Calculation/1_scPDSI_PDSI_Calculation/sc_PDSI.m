%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
function [SCPDSI,par] = sc_PDSI(DATA,cal_year_beg, cal_year_end, dur_mode, dur_cal_range)
%The self-calibrating Palmer drought severity index
% Input Data
% DATA : Monthly Data matrix,including [year,month,monthly potential evapotranspiration,
%        monthly precipitation,available water capacity].
%        unit of monthly precipitation,potential evapotranspiration,available water capacity: mm
% cal_year_beg : Start year of calibration period
% cal_year_end : End year of calibration period
% dur_mode : the mode of lengths for the regression between the length and (cumulative) 
%            severity of the most extreme drought. Recommended to be set to 1.
% dur_cal_range : The method in defining the driest and wettest spells. Recommended to be set to 1.

% Output Data
% SCPDSI: The value of the self-calibrating Palmer drought severity index.
% par: The parameters of the self-calibrating Palmer drought severity index.

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
    SCPDSI = nan;
    par = [nan,nan,nan,nan];
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
    [z, k, d, Phat] = Z_index_scPDSI(P, PET, ET, PR, R, PRO, RO, PL, L, cal_index_beg, cal_index_end);
    
    % Duration factors calculation
    if cal_index_end == 0
        [md, bd, mw, bw] = DurFact(z, dur_mode, dur_cal_range);
    else
        z_cal = z(cal_index_beg:cal_index_end);
        [md, bd, mw, bw] = DurFact(z_cal, dur_mode, dur_cal_range);
    end
    
    % Calculate the PDSI using the moisture anomalies, namely Z index, and duration factors
    [ProbO, XO1,XO2,XO3,XO] = calcAllx( z,mw, bw,md, bd);
    x = reshape(XO,[],1);
    
    % Find the 98th and 2d percentile values of the PDSI
    if cal_index_end == 0
        x_cal = x;
    else
        x_cal = x(cal_index_beg:cal_index_end);
    end
    x_high = x_cal(x_cal>0);
    x_low = x_cal(x_cal<0);
    high = prctile(x_cal,98);
    low = prctile(x_cal,2);
    % Choose the suitable the 98th and 2d percentile values
    % Mainly used to deal with outliers in extreme dry areas, such as
    % Sahara Desert, Northwest China
    high_th = 98;
    while high <=3 && high_th <= 100
        high = prctile(x_high,high_th);
        high_th = high_th + 0.5;
    end
    
    low_th = 2;
    while low >=-3 && low_th >= 0
        low = prctile(x_low,low_th);
        low_th = low_th - 0.5;
    end

    % To calculate climate characteristic, K
    for i = 1 : length(d)
        if d(i) <= 0
            K(i,1) = k(i)*(-4/low);
        else
            K(i,1) = k(i)*(4/high);
        end
    end
    
    % To calculate the new moisture anomalies
    Z = d.*K;
    
    % To calculate the new SPDI
    [ProbO, XO1,XO2,XO3,XO] = calcAllx(Z,mw, bw,md, bd);
    SCPDSI = reshape(XO,[],1);
    par = [md, bd, mw, bw];
end
end
