function Fig4c_Article_Plotting(GridPDSI_Princeton_CMIP , Path_Fig3_Output)
load LandInfo_05deg
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];

A = landmask_05deg(1:360 , :); B = landmask_05deg(361:end , :);
landmask_05deg = [B;A]; clear B A
A = lat_05deg(1:360 , :); B = lat_05deg(361:end , :);
lat_05deg = [B;A]; clear B A
A = lon_05deg(1:360 , :); B = lon_05deg(361:end , :) - 360;
lon_05deg = [B;A]; clear B A

for ii = 1 : size(GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC , 3)
    % pdsi_PM_RC
    A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC(: , : , ii) = [B;A];
    % pdsi_PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % pdsi_PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC , 3)
    % ssp126
    % PM_RC
    A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(2).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp245
    % PM_RC
    A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(3).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp370
    % PM_RC
    A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(4).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp585
    % PM_RC
    A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(5).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC , 3)
    % pdsi_PM_RC
    A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC(: , : , ii) = [B;A];
    % pdsi_PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % pdsi_PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
%% (2) linear regression of PDSI calculated by [Princeton 1948-2014]
% (2.1) PM_RC
PDSI_PM_RC_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC;
for i_lon = 1 : size(PDSI_PM_RC_Princeton,1)
    for i_lat = 1 : size(PDSI_PM_RC_Princeton,2)
        if ~isnan(PDSI_PM_RC_Princeton(i_lon , i_lat , 1))
            Y = PDSI_PM_RC_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = b(2);
            p_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
            p_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
% (2.2) PM_RC_CO2_Yang
PDSI_PM_RC_CO2_Yang_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(PDSI_PM_RC_CO2_Yang_Princeton,1)
    for i_lat = 1 : size(PDSI_PM_RC_CO2_Yang_Princeton,2)
        if ~isnan(PDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , 1))
            Y = PDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = b(2);
            p_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
            p_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
% (2.3) PM_RC_CO2_Jarvis_H
PDSI_PM_RC_CO2_Jarvis_H_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(PDSI_PM_RC_CO2_Jarvis_H_Princeton,1)
    for i_lat = 1 : size(PDSI_PM_RC_CO2_Jarvis_H_Princeton,2)
        if ~isnan(PDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , 1))
            Y = PDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = b(2);
            p_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
            p_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

Index = p_PDSI_PM_RC_Princeton_Year<0.01;
AA = [roundn(k_PDSI_PM_RC_Princeton_Year(Index),-2),roundn(k_PDSI_PM_RC_CO2_Yang_Princeton_Year(Index),-2)];
BB = [roundn(k_PDSI_PM_RC_Princeton_Year(Index),-2),roundn(k_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(Index),-2)];
CC = unique(AA,'rows'); DD = unique(BB,'rows');
transparentScatter(DD(:,1),DD(:,2),[102,189,99]./255,0.6,1,25,[-0.25 0.25]); hold on;
transparentScatter(CC(:,1),CC(:,2),[116,173,209]./255,0.5,1,25,[-0.25 0.25]);
clear AA BB CC DD

%% (3) linear regression of PDSI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 4
    % (3.1) PM_RC
    PDSI_PM_RC_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_PDSI.pdsi_PM_RC;
    for i_lon = 1 : size(PDSI_PM_RC_CMIP,1)
        for i_lat = 1 : size(PDSI_PM_RC_CMIP,2)
            if ~isnan(PDSI_PM_RC_CMIP(i_lon , i_lat , 1))
                Y = PDSI_PM_RC_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
                p_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
                p_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    % (3.2) PM_RC_CO2_Yang
    PDSI_PM_RC_CO2_Yang_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang;
    for i_lon = 1 : size(PDSI_PM_RC_CO2_Yang_CMIP,1)
        for i_lat = 1 : size(PDSI_PM_RC_CO2_Yang_CMIP,2)
            if ~isnan(PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
                Y = PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
                p_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
                p_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    % (3.3) PM_RC_CO2_Jarvis_H
    PDSI_PM_RC_CO2_Jarvis_H_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H;
    for i_lon = 1 : size(PDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
        for i_lat = 1 : size(PDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
            if ~isnan(PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
                Y = PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
                p_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
                p_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
end

Index = p_PDSI_PM_RC_CMIP_Year<0.01;
AA = [roundn(k_PDSI_PM_RC_CMIP_Year(Index),-2),roundn(k_PDSI_PM_RC_CO2_Yang_CMIP_Year(Index),-2)];
BB = [roundn(k_PDSI_PM_RC_CMIP_Year(Index),-2),roundn(k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(Index),-2)];
CC = unique(AA,'rows'); DD = unique(BB,'rows');
transparentScatter(DD(:,1),DD(:,2),[68,190,160]./255,0.8,1,4,[-0.23 0.23]);
transparentScatter(CC(:,1),CC(:,2),[35,97,127]./255,0.7,1,4,[-0.23 0.23]); hold on;
clear AA BB CC DD

%% (4) linear regression of PDSI calculated by CMIP historical experiments
% (4.1) PM_RC
PDSI_PM_RC_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC;
for i_lon = 1 : size(PDSI_PM_RC_CMIP,1)
    for i_lat = 1 : size(PDSI_PM_RC_CMIP,2)
        if ~isnan(PDSI_PM_RC_CMIP(i_lon , i_lat , 1))
            Y = PDSI_PM_RC_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
            p_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            p_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

% (4.2) PM_RC_CO2_Yang
PDSI_PM_RC_CO2_Yang_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(PDSI_PM_RC_CO2_Yang_CMIP,1)
    for i_lat = 1 : size(PDSI_PM_RC_CO2_Yang_CMIP,2)
        if ~isnan(PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
            Y = PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
            p_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            p_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

% (4.3) PM_RC_CO2_Jarvis_H
PDSI_PM_RC_CO2_Jarvis_H_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(PDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
    for i_lat = 1 : size(PDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
        if ~isnan(PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
            Y = PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
            p_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            p_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;


xlim([-0.206 0.206]); ylim()
plot([-0.206 0.206],[-0.206 0.206],'r','LineWidth',2.5);
plot([0 0],[-0.206 0.206],'Color',[0.2 0.2 0.2],'LineWidth',2.5);
plot([-0.206 0.206],[0 0],'Color',[0.2 0.2 0.2],'LineWidth',2.5);

Index = p_PDSI_PM_RC_CMIP_Year<0.01;
AA = [roundn(k_PDSI_PM_RC_CMIP_Year(Index),-2),roundn(k_PDSI_PM_RC_CO2_Yang_CMIP_Year(Index),-2)];
BB = [roundn(k_PDSI_PM_RC_CMIP_Year(Index),-2),roundn(k_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(Index),-2)];
CC = unique(AA,'rows'); DD = unique(BB,'rows');
transparentScatter(DD(:,1),DD(:,2),[0.2 0.2 0.2],1,1,3,[-0.2 0.2]);
transparentScatter(CC(:,1),CC(:,2),[0 0 0],0.7,1,3,[-0.12 0.12]);
clear AA BB CC DD

box on
set(gca,'ylim',[-0.206 0.206],'xlim',[-0.206 0.206],'LineWidth',2.5,'FontSize',24,'FontName','Arial');
xlabel('ETrc');
ylabel('ETrc-Yang and ETrc-Jarvis');
end
