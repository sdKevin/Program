%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
function SPEI = SPEIcc(DATA,cal_year_beg, cal_year_end,scale,nseas)
%Standardized precipitation evapotranspiration index 
% Input Data
% DATA : Monthly Data matrix,including [year,month,monthly precipitation,
%        monthly potential evapotranspiration].
%        unit of monthly precipitation and potential evapotranspiration : mm
% cal_year_beg : Start year of calibration period
% cal_year_end : End year of calibration period
% scale : 1,3,12,48...
% nseas : number of season (monthly=12)

% Output Data
% SPI:the value of the Standardized precipitation evapotranspiration index 
%% Input data
pre=DATA(:,3); % precipitation
pe=DATA(:,4);% potential evapotranspiration
X=pre-pe; % The diff between precipitation and potential evapotranspiration
% The starting serial number of calibration period
cal_index_beg = find((DATA(:,1) == cal_year_beg) & (DATA(:,2) == 1));
% Precipitation data throughout the period
cal_index_end = find((DATA(:,1) == cal_year_end) & (DATA(:,2) == 12));
% Diff data during the calibration period
X_cal = X(cal_index_beg:cal_index_end);

%% Diff accumulation
%(1)calibration period
Dd=[];
for i=1:scale
    Dd=[Dd,X_cal(i:length(X_cal)-scale+i)];
end
D_cal=sum(Dd,2);
%(2) Whole period
Dd=[];
for i=1:scale
    Dd=[Dd,X(i:length(X)-scale+i)];
end
D=sum(Dd,2);

%% Calculation of the Standardized Precipitation evapotranspiration Index 
for is=1:nseas % Season by season calculation
    % (1) Parameter calibration
    % The serial number of calibration period in season
    tind_cal=is:nseas:length(D_cal);
    % The diff of calibration period in season
    Xn_cal=D_cal(tind_cal);
    D_s=sort(Xn_cal);
    n_cal=length(Xn_cal);
    % Parameter calibration
    for i=1:3
        for j=1:n_cal
            ww(j)=((1-(j-0.35)/n_cal)^(i-1))*D_s(j);
        end
        w(i)=sum(ww)/n_cal;
    end
    belta=(2*w(2)-w(1))/(6*w(2)-w(1)-6*w(3));
    alpha=(w(1)-2*w(2))*belta/(gamma(1+1/belta)*gamma(1-1/belta));
    gama=w(1)-alpha*gamma(1+1/belta)*gamma(1-1/belta);
     % (2) Full sequence calculation
    tind=is:nseas:length(D);
    Xn=D(tind);
    n=length(Xn);
    for i=1:n
        F=(1+(alpha/(Xn(i)-gama))^belta)^(-1);
        P=1-F;
        if P<=0.5
            W=sqrt(-2*log(P));
            SPEI(tind(i))=W-(2.515517+0.802853*W+0.010328*W^2)/(1+1.432788*W+0.189269*W^2+0.001308*W^3);
        else
            W=sqrt(-2*log(1-P));
            SPEI(tind(i))=(2.515517+0.802853*W+0.010328*W^2)/(1+1.432788*W+0.189269*W^2+0.001308*W^3)-W;
        end
    end
end
SPEI_k=zeros(1,scale-1);% The SPEI value of the (scale-1) months is set to 0.
SPEI = real(SPEI);
SPEI=[SPEI_k,SPEI];
end