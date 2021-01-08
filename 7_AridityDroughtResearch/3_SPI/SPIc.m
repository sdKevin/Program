%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
function SPI=SPIc(DATA,cal_year_beg, cal_year_end,scale,nseas)
%Standardized Precipitation Index 
% Input Data
% DATA : Monthly Data matrix,including [year,month,monthly precipitation].
%        unit of monthly precipitation: mm
% cal_year_beg : Start year of calibration period
% cal_year_end : End year of calibration period
% scale : 1,3,12,48...
% nseas : number of season (monthly=12)

% Output Data
% SPI:the value of the Standardized Precipitation Index 

%% Input data
% The starting serial number of calibration period
cal_index_beg = find((DATA(:,1) == cal_year_beg) & (DATA(:,2) == 1));
% The ending serial number of calibration period
cal_index_end = find((DATA(:,1) == cal_year_end) & (DATA(:,2) == 12));
% Precipitation data throughout the period
Pr = DATA(:,3);
% Precipitation data during the calibration period
Pr_cal = Pr(cal_index_beg:cal_index_end);

%% Precipitation accumulation
%(1)calibration period
A1=[];
for is=1:scale, A1=[A1,Pr_cal(is:length(Pr_cal)-scale+is)];end
XS_cal=sum(A1,2);
%(2) Whole period
A1=[];
for is=1:scale, A1=[A1,Pr(is:length(Pr)-scale+is)];end
XS=sum(A1,2);
 
%% Calculation of the Standardized Precipitation Index 
for is=1:nseas %Season by season calculation
    % (1) Parameter calibration
    % The serial number of calibration period in season
    tind_cal=is:nseas:length(XS_cal);
    % The precipitation of calibration period in season
    Xn_cal=XS_cal(tind_cal);
    % The serial number of calibration period in season when the
    % precipitation is equal to zero.
    [zeroa]=find(Xn_cal==0); 
    % No-zero precipitation serial
    Xn_nozero=Xn_cal;Xn_nozero(zeroa)=[];
    q=length(zeroa)/length(Xn_cal);
    parm=gamfit(Xn_nozero);
    % (2) Full sequence calculation
    tind=is:nseas:length(XS);
    Xn=XS(tind);
    Gam_xs=q+(1-q)*gamcdf(Xn,parm(1),parm(2));
    Z(tind)=norminv(Gam_xs); % the value of the Standardized Precipitation Index
end
SPI_k=zeros(1,scale-1);% The SPI value of the (scale-1) months is set to 0.
SPI=[SPI_k,Z];