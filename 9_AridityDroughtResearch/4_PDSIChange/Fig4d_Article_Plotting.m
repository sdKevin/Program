function Fig4d_Article_Plotting(GridPDSI_Princeton_CMIP , Path_Fig6a_Output)
load LandInfo_05deg
%% Severe Drought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];

A = landmask_05deg(1:360 , :); B = landmask_05deg(361:end , :);
landmask_05deg = [B;A]; clear B A
A = lat_05deg(1:360 , :); B = lat_05deg(361:end , :);
lat_05deg = [B;A]; clear B A
A = lon_05deg(1:360 , :); B = lon_05deg(361:end , :) - 360;
lon_05deg = [B;A]; clear B A

for ii = 1 : size(GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC , 3)
    % SevereDrought_pdsi_PM_RC
    A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(: , : , ii) = [B;A];
    % SevereDrought_pdsi_PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % SevereDrought_pdsi_PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC , 3)
    % ssp126
    % PM_RC
    A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp245
    % PM_RC
    A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp370
    % PM_RC
    A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp585
    % PM_RC
    A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC , 3)
    % SevereDrought_pdsi_PM_RC
    A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(361:end , : , ii);
    GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(: , : , ii) = [B;A];
    % SevereDrought_pdsi_PM_RC_CO2_Jarvis_H
    A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % SevereDrought_pdsi_PM_RC_CO2_Yang
    A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
%% (2) linear regression of PDSI calculated by [Princeton 1948-2014]
% (2.1) PM_RC
SevereDrought_PDSI_PM_RC_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC;
for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_Princeton,1)
    for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_Princeton,2)
        if ~isnan(SevereDrought_PDSI_PM_RC_Princeton(i_lon , i_lat , 1))
            Y = SevereDrought_PDSI_PM_RC_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
            p_SevereDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% (2.2) PM_RC_CO2_Yang
SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton,1)
    for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton,2)
        if ~isnan(SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , 1))
            Y = SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
            p_SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% (2.3) PM_RC_CO2_Jarvis_H
SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton,1)
    for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton,2)
        if ~isnan(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , 1))
            Y = SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
            p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

Index = p_SevereDrought_PDSI_PM_RC_Princeton_Year<0.01;
AA = [roundn(k_SevereDrought_PDSI_PM_RC_Princeton_Year(Index),-2),roundn(k_SevereDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(Index),-2)];
BB = [roundn(k_SevereDrought_PDSI_PM_RC_Princeton_Year(Index),-2),roundn(k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(Index),-2)];
CC = unique(AA,'rows'); DD = unique(BB,'rows');
transparentScatter(DD(:,1),DD(:,2),[102,189,99]./255,0.6,1,25,[-0.25 0.25]); hold on;
transparentScatter(CC(:,1),CC(:,2),[116,173,209]./255,0.5,1,25,[-0.25 0.25]);
clear AA BB CC DD

%% (3) linear regression of PDSI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 4
    % (3.1) PM_RC
    SevereDrought_PDSI_PM_RC_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC;
    for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_CMIP,1)
        for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_CMIP,2)
            if ~isnan(SevereDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , 1))
                Y = SevereDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_SevereDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
                p_SevereDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_SevereDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
                p_SevereDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_SevereDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_SevereDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_SevereDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_SevereDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    
    % (3.2) PM_RC_CO2_Yang
    SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang;
    for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP,1)
        for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP,2)
            if ~isnan(SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
                Y = SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
                p_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
                p_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    
    % (3.3) PM_RC_CO2_Jarvis_H
    SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
    for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
        for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
            if ~isnan(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
                Y = SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
                p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
                p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    
end

Index = p_SevereDrought_PDSI_PM_RC_CMIP_Year<0.01;
AA = [roundn(k_SevereDrought_PDSI_PM_RC_CMIP_Year(Index),-2),roundn(k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(Index),-2)];
BB = [roundn(k_SevereDrought_PDSI_PM_RC_CMIP_Year(Index),-2),roundn(k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(Index),-2)];
CC = unique(AA,'rows'); DD = unique(BB,'rows');
transparentScatter(DD(:,1),DD(:,2),[68,190,160]./255,.8,1,4,[-0.23 0.23]);
transparentScatter(CC(:,1),CC(:,2),[35,97,127]./255,.7,1,4,[-0.23 0.23]); hold on;
clear AA BB CC DD

%% (4) linear regression of PDSI calculated by CMIP historical experiments
% (4.1) PM_RC
SevereDrought_PDSI_PM_RC_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC;
for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_CMIP,1)
    for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_CMIP,2)
        if ~isnan(SevereDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , 1))
            Y = SevereDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            p_SevereDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_SevereDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_SevereDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_SevereDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_SevereDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

% (4.2) PM_RC_CO2_Yang
SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP,1)
    for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP,2)
        if ~isnan(SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
            Y = SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            p_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;


% (4.3) PM_RC_CO2_Jarvis_H
SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
    for i_lat = 1 : size(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
        if ~isnan(SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
            Y = SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

xlim([-0.206 0.206]); ylim()
plot([-0.206 0.206],[-0.206 0.206],'r','LineWidth',2.5);
plot([0 0],[-0.206 0.206],'Color',[0.2 0.2 0.2],'LineWidth',2.5);
plot([-0.206 0.206],[0 0],'Color',[0.2 0.2 0.2],'LineWidth',2.5);

Index = p_SevereDrought_PDSI_PM_RC_CMIP_Year<0.01;
AA = [roundn(k_SevereDrought_PDSI_PM_RC_CMIP_Year(Index),-2),roundn(k_SevereDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(Index),-2)];
BB = [roundn(k_SevereDrought_PDSI_PM_RC_CMIP_Year(Index),-2),roundn(k_SevereDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(Index),-2)];
CC = unique(AA,'rows'); DD = unique(BB,'rows');
transparentScatter(DD(:,1),DD(:,2),[0.2 0.2 0.2],1,1,3,[-0.2 0.2]);
transparentScatter(CC(:,1),CC(:,2),[0 0 0],0.7,1,3,[-0.12 0.12]);
clear AA BB CC DD

box on
set(gca,'ylim',[-0.206 0.206],'xlim',[-0.206 0.206],'LineWidth',2.5,'FontSize',24,'FontName','Arial');
xlabel('ETrc');
ylabel('ETrc-Yang and ETrc-Jarvis');





































































% %% Moderate Drought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% (1) Adjust map range from 0~360 to -180~180
% extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
% for ii = 1 : size(GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC , 3)
%     % ModerateDrought_pdsi_PM_RC
%     A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % ModerateDrought_pdsi_PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
% end
% clear ii A B
% for ii = 1 : size(GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC , 3)
%     % ssp126
%     % PM_RC
%     A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
%     % ssp245
%     % PM_RC
%     A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
%     % ssp370
%     % PM_RC
%     A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
%     % ssp585
%     % PM_RC
%     A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
% end
% clear ii A B
% for ii = 1 : size(GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC , 3)
%     % ModerateDrought_pdsi_PM_RC
%     A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % ModerateDrought_pdsi_PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
% end
% clear ii A B
% %% (2) linear regression of PDSI calculated by [Princeton 1948-2014]
% % (2.1) PM_RC
% ModerateDrought_PDSI_PM_RC_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC;
% for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_Princeton,1)
%     for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_Princeton,2)
%         if ~isnan(ModerateDrought_PDSI_PM_RC_Princeton(i_lon , i_lat , 1))
%             Y = ModerateDrought_PDSI_PM_RC_Princeton(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1948:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_ModerateDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = b(2);
%             p_ModerateDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_ModerateDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
%             p_ModerateDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% k_ModerateDrought_PDSI_PM_RC_Princeton_Year(isnan(k_ModerateDrought_PDSI_PM_RC_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_Princeton'],extent,k_ModerateDrought_PDSI_PM_RC_Princeton_Year');
% p_ModerateDrought_PDSI_PM_RC_Princeton_Year(isnan(p_ModerateDrought_PDSI_PM_RC_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_Princeton'],extent,p_ModerateDrought_PDSI_PM_RC_Princeton_Year');
% clear k_ModerateDrought_PDSI_PM_RC_Princeton_Year p_ModerateDrought_PDSI_PM_RC_Princeton_Year ModerateDrought_PDSI_PM_RC_Princeton
% % (2.2) PM_RC_CO2_Yang
% ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang;
% for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton,1)
%     for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton,2)
%         if ~isnan(ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , 1))
%             Y = ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1948:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = b(2);
%             p_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
%             p_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% k_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(k_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton'],extent,k_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year');
% p_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(p_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton'],extent,p_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year');
% clear k_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year p_ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year ModerateDrought_PDSI_PM_RC_CO2_Yang_Princeton
% % (2.3) PM_RC_CO2_Jarvis_H
% ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H;
% for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton,1)
%     for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton,2)
%         if ~isnan(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , 1))
%             Y = ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1948:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = b(2);
%             p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
%             p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
% p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
% clear k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton
% 
% %% (3) linear regression of PDSI calculated by CMIP scenarios
% ssp = {'ssp126','ssp245','ssp370','ssp585'};
% for i_ssp = 1 : length(ssp)
%     % (3.1) PM_RC
%     ModerateDrought_PDSI_PM_RC_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC;
%     for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_CMIP,1)
%         for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_CMIP,2)
%             if ~isnan(ModerateDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , 1))
%                 Y = ModerateDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , :);
%                 Y = Y(:);
%                 x = [2015:2100];
%                 X = [ones(length(Y),1) , x'];
%                 [b,bint,r,rint,stats] = regress(Y,X);
%                 k_ModerateDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
%                 p_ModerateDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
%                 clear x Y X b bint r rint stats
%             else
%                 k_ModerateDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
%                 p_ModerateDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
%             end
%         end
%     end
%     clear i_lat i_lon
%     
%     % interpolate the seam
%     k_ModerateDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),k_ModerateDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     p_ModerateDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),p_ModerateDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     
%     k_ModerateDrought_PDSI_PM_RC_CMIP_Year(isnan(k_ModerateDrought_PDSI_PM_RC_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_' ssp{i_ssp}],extent,k_ModerateDrought_PDSI_PM_RC_CMIP_Year');
%     p_ModerateDrought_PDSI_PM_RC_CMIP_Year(isnan(p_ModerateDrought_PDSI_PM_RC_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_' ssp{i_ssp}],extent,p_ModerateDrought_PDSI_PM_RC_CMIP_Year');
%     clear k_ModerateDrought_PDSI_PM_RC_CMIP_Year p_ModerateDrought_PDSI_PM_RC_CMIP_Year ModerateDrought_PDSI_PM_RC_CMIP
%     % (3.2) PM_RC_CO2_Yang
%     ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang;
%     for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP,1)
%         for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP,2)
%             if ~isnan(ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
%                 Y = ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
%                 Y = Y(:);
%                 x = [2015:2100];
%                 X = [ones(length(Y),1) , x'];
%                 [b,bint,r,rint,stats] = regress(Y,X);
%                 k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
%                 p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
%                 clear x Y X b bint r rint stats
%             else
%                 k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
%                 p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
%             end
%         end
%     end
%     clear i_lat i_lon
%     
%     % interpolate the seam
%     k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     
%     k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year');
%     p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year');
%     clear k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP
%     % (3.3) PM_RC_CO2_Jarvis_H
%     ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H;
%     for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
%         for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
%             if ~isnan(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
%                 Y = ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
%                 Y = Y(:);
%                 x = [2015:2100];
%                 X = [ones(length(Y),1) , x'];
%                 [b,bint,r,rint,stats] = regress(Y,X);
%                 k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
%                 p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
%                 clear x Y X b bint r rint stats
%             else
%                 k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
%                 p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
%             end
%         end
%     end
%     clear i_lat i_lon
%     
%     % interpolate the seam
%     k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     
%     k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
%     p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
%     clear k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP
% end
% 
% %% (4) linear regression of PDSI calculated by CMIP historical experiments
% % (4.1) PM_RC
% ModerateDrought_PDSI_PM_RC_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC;
% for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_CMIP,1)
%     for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_CMIP,2)
%         if ~isnan(ModerateDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , 1))
%             Y = ModerateDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1850:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_ModerateDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
%             p_ModerateDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_ModerateDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
%             p_ModerateDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% 
% % interpolate the seam
% k_ModerateDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),k_ModerateDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% p_ModerateDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),p_ModerateDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% 
% k_ModerateDrought_PDSI_PM_RC_CMIP_Year(isnan(k_ModerateDrought_PDSI_PM_RC_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_Historical'],extent,k_ModerateDrought_PDSI_PM_RC_CMIP_Year');
% p_ModerateDrought_PDSI_PM_RC_CMIP_Year(isnan(p_ModerateDrought_PDSI_PM_RC_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_Historical'],extent,p_ModerateDrought_PDSI_PM_RC_CMIP_Year');
% clear k_ModerateDrought_PDSI_PM_RC_CMIP_Year p_ModerateDrought_PDSI_PM_RC_CMIP_Year ModerateDrought_PDSI_PM_RC_CMIP
% % (4.2) PM_RC_CO2_Yang
% ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang;
% for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP,1)
%     for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP,2)
%         if ~isnan(ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
%             Y = ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1850:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
%             p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
%             p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% 
% % interpolate the seam
% k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% 
% k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_CO2_Yang_Historical'],extent,k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year');
% p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_CO2_Yang_Historical'],extent,p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year');
% clear k_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year p_ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year ModerateDrought_PDSI_PM_RC_CO2_Yang_CMIP
% % (4.3) PM_RC_CO2_Jarvis_H
% ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H;
% for i_lon = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
%     for i_lat = 1 : size(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
%         if ~isnan(ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
%             Y = ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1850:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
%             p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
%             p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% 
% % interpolate the seam
% k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% 
% k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
% p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
% clear k_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year ModerateDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP
% 
% %% Mild Drought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% (1) Adjust map range from 0~360 to -180~180
% extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
% for ii = 1 : size(GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC , 3)
%     % MildDrought_pdsi_PM_RC
%     A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % MildDrought_pdsi_PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % MildDrought_pdsi_PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
% end
% clear ii A B
% for ii = 1 : size(GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC , 3)
%     % ssp126
%     % PM_RC
%     A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
%     % ssp245
%     % PM_RC
%     A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
%     % ssp370
%     % PM_RC
%     A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
%     % ssp585
%     % PM_RC
%     A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
% end
% clear ii A B
% for ii = 1 : size(GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC , 3)
%     % MildDrought_pdsi_PM_RC
%     A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(: , : , ii) = [B;A];
%     % MildDrought_pdsi_PM_RC_CO2_Jarvis_H
%     A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
%     % MildDrought_pdsi_PM_RC_CO2_Yang
%     A = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(1:360 , : , ii);
%     B = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(361:end , : , ii);
%     GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
% end
% clear ii A B
% %% (2) linear regression of PDSI calculated by [Princeton 1948-2014]
% % (2.1) PM_RC
% MildDrought_PDSI_PM_RC_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC;
% for i_lon = 1 : size(MildDrought_PDSI_PM_RC_Princeton,1)
%     for i_lat = 1 : size(MildDrought_PDSI_PM_RC_Princeton,2)
%         if ~isnan(MildDrought_PDSI_PM_RC_Princeton(i_lon , i_lat , 1))
%             Y = MildDrought_PDSI_PM_RC_Princeton(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1948:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_MildDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = b(2);
%             p_MildDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_MildDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
%             p_MildDrought_PDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% k_MildDrought_PDSI_PM_RC_Princeton_Year(isnan(k_MildDrought_PDSI_PM_RC_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_Princeton'],extent,k_MildDrought_PDSI_PM_RC_Princeton_Year');
% p_MildDrought_PDSI_PM_RC_Princeton_Year(isnan(p_MildDrought_PDSI_PM_RC_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_Princeton'],extent,p_MildDrought_PDSI_PM_RC_Princeton_Year');
% clear k_MildDrought_PDSI_PM_RC_Princeton_Year p_MildDrought_PDSI_PM_RC_Princeton_Year MildDrought_PDSI_PM_RC_Princeton
% % (2.2) PM_RC_CO2_Yang
% MildDrought_PDSI_PM_RC_CO2_Yang_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang;
% for i_lon = 1 : size(MildDrought_PDSI_PM_RC_CO2_Yang_Princeton,1)
%     for i_lat = 1 : size(MildDrought_PDSI_PM_RC_CO2_Yang_Princeton,2)
%         if ~isnan(MildDrought_PDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , 1))
%             Y = MildDrought_PDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1948:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = b(2);
%             p_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
%             p_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% k_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(k_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton'],extent,k_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year');
% p_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(p_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton'],extent,p_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year');
% clear k_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year p_MildDrought_PDSI_PM_RC_CO2_Yang_Princeton_Year MildDrought_PDSI_PM_RC_CO2_Yang_Princeton
% % (2.3) PM_RC_CO2_Jarvis_H
% MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton =  GridPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H;
% for i_lon = 1 : size(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton,1)
%     for i_lat = 1 : size(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton,2)
%         if ~isnan(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , 1))
%             Y = MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1948:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = b(2);
%             p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
%             p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
% p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
% clear k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton_Year MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Princeton
% 
% %% (3) linear regression of PDSI calculated by CMIP scenarios
% ssp = {'ssp126','ssp245','ssp370','ssp585'};
% for i_ssp = 1 : length(ssp)
%     % (3.1) PM_RC
%     MildDrought_PDSI_PM_RC_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC;
%     for i_lon = 1 : size(MildDrought_PDSI_PM_RC_CMIP,1)
%         for i_lat = 1 : size(MildDrought_PDSI_PM_RC_CMIP,2)
%             if ~isnan(MildDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , 1))
%                 Y = MildDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , :);
%                 Y = Y(:);
%                 x = [2015:2100];
%                 X = [ones(length(Y),1) , x'];
%                 [b,bint,r,rint,stats] = regress(Y,X);
%                 k_MildDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
%                 p_MildDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
%                 clear x Y X b bint r rint stats
%             else
%                 k_MildDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
%                 p_MildDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
%             end
%         end
%     end
%     clear i_lat i_lon
%     
%     % interpolate the seam
%     k_MildDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),k_MildDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     p_MildDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),p_MildDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     
%     k_MildDrought_PDSI_PM_RC_CMIP_Year(isnan(k_MildDrought_PDSI_PM_RC_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_' ssp{i_ssp}],extent,k_MildDrought_PDSI_PM_RC_CMIP_Year');
%     p_MildDrought_PDSI_PM_RC_CMIP_Year(isnan(p_MildDrought_PDSI_PM_RC_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_' ssp{i_ssp}],extent,p_MildDrought_PDSI_PM_RC_CMIP_Year');
%     clear k_MildDrought_PDSI_PM_RC_CMIP_Year p_MildDrought_PDSI_PM_RC_CMIP_Year MildDrought_PDSI_PM_RC_CMIP
%     % (3.2) PM_RC_CO2_Yang
%     MildDrought_PDSI_PM_RC_CO2_Yang_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang;
%     for i_lon = 1 : size(MildDrought_PDSI_PM_RC_CO2_Yang_CMIP,1)
%         for i_lat = 1 : size(MildDrought_PDSI_PM_RC_CO2_Yang_CMIP,2)
%             if ~isnan(MildDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
%                 Y = MildDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
%                 Y = Y(:);
%                 x = [2015:2100];
%                 X = [ones(length(Y),1) , x'];
%                 [b,bint,r,rint,stats] = regress(Y,X);
%                 k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
%                 p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
%                 clear x Y X b bint r rint stats
%             else
%                 k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
%                 p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
%             end
%         end
%     end
%     clear i_lat i_lon
%     
%     % interpolate the seam
%     k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     
%     k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year');
%     p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year');
%     clear k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year MildDrought_PDSI_PM_RC_CO2_Yang_CMIP
%     % (3.3) PM_RC_CO2_Jarvis_H
%     MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP = GridPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H;
%     for i_lon = 1 : size(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
%         for i_lat = 1 : size(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
%             if ~isnan(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
%                 Y = MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
%                 Y = Y(:);
%                 x = [2015:2100];
%                 X = [ones(length(Y),1) , x'];
%                 [b,bint,r,rint,stats] = regress(Y,X);
%                 k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
%                 p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
%                 clear x Y X b bint r rint stats
%             else
%                 k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
%                 p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
%             end
%         end
%     end
%     clear i_lat i_lon
%     
%     % interpolate the seam
%     k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%         lon_05deg([1:358,362:end],:),p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
%         lat_05deg,lon_05deg).*landmask_05deg;
%     
%     k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
%     p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
%     SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
%     clear k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP
% end
% 
% %% (4) linear regression of PDSI calculated by CMIP historical experiments
% % (4.1) PM_RC
% MildDrought_PDSI_PM_RC_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC;
% for i_lon = 1 : size(MildDrought_PDSI_PM_RC_CMIP,1)
%     for i_lat = 1 : size(MildDrought_PDSI_PM_RC_CMIP,2)
%         if ~isnan(MildDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , 1))
%             Y = MildDrought_PDSI_PM_RC_CMIP(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1850:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_MildDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
%             p_MildDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_MildDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
%             p_MildDrought_PDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% 
% % interpolate the seam
% k_MildDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),k_MildDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% p_MildDrought_PDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),p_MildDrought_PDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% 
% k_MildDrought_PDSI_PM_RC_CMIP_Year(isnan(k_MildDrought_PDSI_PM_RC_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_Historical'],extent,k_MildDrought_PDSI_PM_RC_CMIP_Year');
% p_MildDrought_PDSI_PM_RC_CMIP_Year(isnan(p_MildDrought_PDSI_PM_RC_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_Historical'],extent,p_MildDrought_PDSI_PM_RC_CMIP_Year');
% clear k_MildDrought_PDSI_PM_RC_CMIP_Year p_MildDrought_PDSI_PM_RC_CMIP_Year MildDrought_PDSI_PM_RC_CMIP
% % (4.2) PM_RC_CO2_Yang
% MildDrought_PDSI_PM_RC_CO2_Yang_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang;
% for i_lon = 1 : size(MildDrought_PDSI_PM_RC_CO2_Yang_CMIP,1)
%     for i_lat = 1 : size(MildDrought_PDSI_PM_RC_CO2_Yang_CMIP,2)
%         if ~isnan(MildDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
%             Y = MildDrought_PDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1850:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
%             p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
%             p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% 
% % interpolate the seam
% k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% 
% k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_CO2_Yang_Historical'],extent,k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year');
% p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_CO2_Yang_Historical'],extent,p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year');
% clear k_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year p_MildDrought_PDSI_PM_RC_CO2_Yang_CMIP_Year MildDrought_PDSI_PM_RC_CO2_Yang_CMIP
% % (4.3) PM_RC_CO2_Jarvis_H
% MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP = GridPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H;
% for i_lon = 1 : size(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
%     for i_lat = 1 : size(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
%         if ~isnan(MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
%             Y = MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
%             Y = Y(:);
%             x = [1850:2014];
%             X = [ones(length(Y),1) , x'];
%             [b,bint,r,rint,stats] = regress(Y,X);
%             k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
%             p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
%             clear x Y X b bint r rint stats
%         else
%             k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
%             p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
%         end
%     end
% end
% clear i_lat i_lon
% 
% % interpolate the seam
% k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
%     lon_05deg([1:358,362:end],:),p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
%     lat_05deg,lon_05deg).*landmask_05deg;
% 
% k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
% p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
% SaveData2GeoTIFF([Path_Fig6a_Output 'p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
% clear k_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP_Year MildDrought_PDSI_PM_RC_CO2_Jarvis_H_CMIP
end
