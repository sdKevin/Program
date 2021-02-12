function Fig6b_Plotting(GridscPDSI_Princeton_CMIP , Path_Fig6b_Output)
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

for ii = 1 : size(GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC , 3)
    % SevereDrought_scpdsi_PM_RC
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % SevereDrought_scpdsi_PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC , 3)
    % ssp126
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp245
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp370
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp585
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC , 3)
    % SevereDrought_scpdsi_PM_RC
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % SevereDrought_scpdsi_PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
%% (2) linear regression of scPDSI calculated by [Princeton 1948-2014]
% (2.1) PM_RC
SevereDrought_scPDSI_PM_RC_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC;
for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_Princeton,1)
    for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_Princeton,2)
        if ~isnan(SevereDrought_scPDSI_PM_RC_Princeton(i_lon , i_lat , 1))
            Y = SevereDrought_scPDSI_PM_RC_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
            p_SevereDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_SevereDrought_scPDSI_PM_RC_Princeton_Year(isnan(k_SevereDrought_scPDSI_PM_RC_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_Princeton'],extent,k_SevereDrought_scPDSI_PM_RC_Princeton_Year');
p_SevereDrought_scPDSI_PM_RC_Princeton_Year(isnan(p_SevereDrought_scPDSI_PM_RC_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_Princeton'],extent,p_SevereDrought_scPDSI_PM_RC_Princeton_Year');
clear k_SevereDrought_scPDSI_PM_RC_Princeton_Year p_SevereDrought_scPDSI_PM_RC_Princeton_Year SevereDrought_scPDSI_PM_RC_Princeton
% (2.2) PM_RC_CO2_Yang
SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton,1)
    for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton,2)
        if ~isnan(SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , 1))
            Y = SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
            p_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(k_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton'],extent,k_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year');
p_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(p_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton'],extent,p_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year');
clear k_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year p_SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year SevereDrought_scPDSI_PM_RC_CO2_Yang_Princeton
% (2.3) PM_RC_CO2_Jarvis_H
SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton,1)
    for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton,2)
        if ~isnan(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , 1))
            Y = SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
            p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
clear k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton

%% (3) linear regression of scPDSI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % (3.1) PM_RC
    SevereDrought_scPDSI_PM_RC_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC;
    for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_CMIP,1)
        for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_CMIP,2)
            if ~isnan(SevereDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , 1))
                Y = SevereDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_SevereDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
                p_SevereDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_SevereDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
                p_SevereDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_SevereDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_SevereDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_SevereDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_SevereDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    k_SevereDrought_scPDSI_PM_RC_CMIP_Year(isnan(k_SevereDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_' ssp{i_ssp}],extent,k_SevereDrought_scPDSI_PM_RC_CMIP_Year');
    p_SevereDrought_scPDSI_PM_RC_CMIP_Year(isnan(p_SevereDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_' ssp{i_ssp}],extent,p_SevereDrought_scPDSI_PM_RC_CMIP_Year');
    clear k_SevereDrought_scPDSI_PM_RC_CMIP_Year p_SevereDrought_scPDSI_PM_RC_CMIP_Year SevereDrought_scPDSI_PM_RC_CMIP
    % (3.2) PM_RC_CO2_Yang
    SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang;
    for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP,1)
        for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP,2)
            if ~isnan(SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
                Y = SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
                p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
                p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
    p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
    clear k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP
    % (3.3) PM_RC_CO2_Jarvis_H
    SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H;
    for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
        for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
            if ~isnan(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
                Y = SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
                p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
                p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
    p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
    clear k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP
end

%% (4) linear regression of scPDSI calculated by CMIP historical experiments
% (4.1) PM_RC
SevereDrought_scPDSI_PM_RC_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC;
for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_CMIP,1)
    for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_CMIP,2)
        if ~isnan(SevereDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , 1))
            Y = SevereDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            p_SevereDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_SevereDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_SevereDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_SevereDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_SevereDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_SevereDrought_scPDSI_PM_RC_CMIP_Year(isnan(k_SevereDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_Historical'],extent,k_SevereDrought_scPDSI_PM_RC_CMIP_Year');
p_SevereDrought_scPDSI_PM_RC_CMIP_Year(isnan(p_SevereDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_Historical'],extent,p_SevereDrought_scPDSI_PM_RC_CMIP_Year');
clear k_SevereDrought_scPDSI_PM_RC_CMIP_Year p_SevereDrought_scPDSI_PM_RC_CMIP_Year SevereDrought_scPDSI_PM_RC_CMIP
% (4.2) PM_RC_CO2_Yang
SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP,1)
    for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP,2)
        if ~isnan(SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
            Y = SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_CO2_Yang_Historical'],extent,k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_CO2_Yang_Historical'],extent,p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
clear k_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year p_SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year SevereDrought_scPDSI_PM_RC_CO2_Yang_CMIP
% (4.3) PM_RC_CO2_Jarvis_H
SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.SevereDrought_scpdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
    for i_lat = 1 : size(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
        if ~isnan(SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
            Y = SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
            p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
clear k_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year SevereDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP

%% Moderate Drought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC , 3)
    % ModerateDrought_scpdsi_PM_RC
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % ModerateDrought_scpdsi_PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC , 3)
    % ssp126
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp245
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp370
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp585
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC , 3)
    % ModerateDrought_scpdsi_PM_RC
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % ModerateDrought_scpdsi_PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
%% (2) linear regression of scPDSI calculated by [Princeton 1948-2014]
% (2.1) PM_RC
ModerateDrought_scPDSI_PM_RC_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC;
for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_Princeton,1)
    for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_Princeton,2)
        if ~isnan(ModerateDrought_scPDSI_PM_RC_Princeton(i_lon , i_lat , 1))
            Y = ModerateDrought_scPDSI_PM_RC_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_ModerateDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = b(2);
            p_ModerateDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_ModerateDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
            p_ModerateDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_ModerateDrought_scPDSI_PM_RC_Princeton_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_Princeton'],extent,k_ModerateDrought_scPDSI_PM_RC_Princeton_Year');
p_ModerateDrought_scPDSI_PM_RC_Princeton_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_Princeton'],extent,p_ModerateDrought_scPDSI_PM_RC_Princeton_Year');
clear k_ModerateDrought_scPDSI_PM_RC_Princeton_Year p_ModerateDrought_scPDSI_PM_RC_Princeton_Year ModerateDrought_scPDSI_PM_RC_Princeton
% (2.2) PM_RC_CO2_Yang
ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton,1)
    for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton,2)
        if ~isnan(ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , 1))
            Y = ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = b(2);
            p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
            p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton'],extent,k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year');
p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton'],extent,p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year');
clear k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year ModerateDrought_scPDSI_PM_RC_CO2_Yang_Princeton
% (2.3) PM_RC_CO2_Jarvis_H
ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton,1)
    for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton,2)
        if ~isnan(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , 1))
            Y = ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = b(2);
            p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
            p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
clear k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton

%% (3) linear regression of scPDSI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % (3.1) PM_RC
    ModerateDrought_scPDSI_PM_RC_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC;
    for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_CMIP,1)
        for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_CMIP,2)
            if ~isnan(ModerateDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , 1))
                Y = ModerateDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_ModerateDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
                p_ModerateDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_ModerateDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
                p_ModerateDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_ModerateDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_ModerateDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_ModerateDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_ModerateDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;

    k_ModerateDrought_scPDSI_PM_RC_CMIP_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_' ssp{i_ssp}],extent,k_ModerateDrought_scPDSI_PM_RC_CMIP_Year');
    p_ModerateDrought_scPDSI_PM_RC_CMIP_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_' ssp{i_ssp}],extent,p_ModerateDrought_scPDSI_PM_RC_CMIP_Year');
    clear k_ModerateDrought_scPDSI_PM_RC_CMIP_Year p_ModerateDrought_scPDSI_PM_RC_CMIP_Year ModerateDrought_scPDSI_PM_RC_CMIP
    % (3.2) PM_RC_CO2_Yang
    ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang;
    for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP,1)
        for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP,2)
            if ~isnan(ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
                Y = ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
                p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
                p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
    p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
    clear k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP
    % (3.3) PM_RC_CO2_Jarvis_H
    ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H;
    for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
        for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
            if ~isnan(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
                Y = ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
                p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
                p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
    p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
    clear k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP
end

%% (4) linear regression of scPDSI calculated by CMIP historical experiments
% (4.1) PM_RC
ModerateDrought_scPDSI_PM_RC_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC;
for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_CMIP,1)
    for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_CMIP,2)
        if ~isnan(ModerateDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , 1))
            Y = ModerateDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_ModerateDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
            p_ModerateDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_ModerateDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            p_ModerateDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_ModerateDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_ModerateDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_ModerateDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_ModerateDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_ModerateDrought_scPDSI_PM_RC_CMIP_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_Historical'],extent,k_ModerateDrought_scPDSI_PM_RC_CMIP_Year');
p_ModerateDrought_scPDSI_PM_RC_CMIP_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_Historical'],extent,p_ModerateDrought_scPDSI_PM_RC_CMIP_Year');
clear k_ModerateDrought_scPDSI_PM_RC_CMIP_Year p_ModerateDrought_scPDSI_PM_RC_CMIP_Year ModerateDrought_scPDSI_PM_RC_CMIP
% (4.2) PM_RC_CO2_Yang
ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP,1)
    for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP,2)
        if ~isnan(ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
            Y = ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
            p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Historical'],extent,k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_Historical'],extent,p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
clear k_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year p_ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year ModerateDrought_scPDSI_PM_RC_CO2_Yang_CMIP
% (4.3) PM_RC_CO2_Jarvis_H
ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_scpdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
    for i_lat = 1 : size(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
        if ~isnan(ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
            Y = ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
            p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
clear k_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year ModerateDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP

%% Mild Drought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC , 3)
    % MildDrought_scpdsi_PM_RC
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % MildDrought_scpdsi_PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % MildDrought_scpdsi_PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC , 3)
    % ssp126
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp245
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp370
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp585
    % PM_RC
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
for ii = 1 : size(GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC , 3)
    % MildDrought_scpdsi_PM_RC
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC(: , : , ii) = [B;A];
    % MildDrought_scpdsi_PM_RC_CO2_Jarvis_H
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % MildDrought_scpdsi_PM_RC_CO2_Yang
    A = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(361:end , : , ii);
    GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
%% (2) linear regression of scPDSI calculated by [Princeton 1948-2014]
% (2.1) PM_RC
MildDrought_scPDSI_PM_RC_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC;
for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_Princeton,1)
    for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_Princeton,2)
        if ~isnan(MildDrought_scPDSI_PM_RC_Princeton(i_lon , i_lat , 1))
            Y = MildDrought_scPDSI_PM_RC_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_MildDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = b(2);
            p_MildDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_MildDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
            p_MildDrought_scPDSI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_MildDrought_scPDSI_PM_RC_Princeton_Year(isnan(k_MildDrought_scPDSI_PM_RC_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_Princeton'],extent,k_MildDrought_scPDSI_PM_RC_Princeton_Year');
p_MildDrought_scPDSI_PM_RC_Princeton_Year(isnan(p_MildDrought_scPDSI_PM_RC_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_Princeton'],extent,p_MildDrought_scPDSI_PM_RC_Princeton_Year');
clear k_MildDrought_scPDSI_PM_RC_Princeton_Year p_MildDrought_scPDSI_PM_RC_Princeton_Year MildDrought_scPDSI_PM_RC_Princeton
% (2.2) PM_RC_CO2_Yang
MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton,1)
    for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton,2)
        if ~isnan(MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , 1))
            Y = MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = b(2);
            p_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
            p_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(k_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton'],extent,k_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year');
p_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year(isnan(p_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton'],extent,p_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year');
clear k_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year p_MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton_Year MildDrought_scPDSI_PM_RC_CO2_Yang_Princeton
% (2.3) PM_RC_CO2_Jarvis_H
MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton =  GridscPDSI_Princeton_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton,1)
    for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton,2)
        if ~isnan(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , 1))
            Y = MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = b(2);
            p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
            p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton'],extent,p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year');
clear k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton_Year MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Princeton

%% (3) linear regression of scPDSI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % (3.1) PM_RC
    MildDrought_scPDSI_PM_RC_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC;
    for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_CMIP,1)
        for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_CMIP,2)
            if ~isnan(MildDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , 1))
                Y = MildDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_MildDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
                p_MildDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_MildDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
                p_MildDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_MildDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_MildDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_MildDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_MildDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;

    k_MildDrought_scPDSI_PM_RC_CMIP_Year(isnan(k_MildDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_' ssp{i_ssp}],extent,k_MildDrought_scPDSI_PM_RC_CMIP_Year');
    p_MildDrought_scPDSI_PM_RC_CMIP_Year(isnan(p_MildDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_' ssp{i_ssp}],extent,p_MildDrought_scPDSI_PM_RC_CMIP_Year');
    clear k_MildDrought_scPDSI_PM_RC_CMIP_Year p_MildDrought_scPDSI_PM_RC_CMIP_Year MildDrought_scPDSI_PM_RC_CMIP
    % (3.2) PM_RC_CO2_Yang
    MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang;
    for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP,1)
        for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP,2)
            if ~isnan(MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
                Y = MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
                p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
                p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
    p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
    clear k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP
    % (3.3) PM_RC_CO2_Jarvis_H
    MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP = GridscPDSI_Princeton_CMIP(i_ssp+1).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H;
    for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
        for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
            if ~isnan(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
                Y = MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
                p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
                p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
    p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
    clear k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP
end

%% (4) linear regression of scPDSI calculated by CMIP historical experiments
% (4.1) PM_RC
MildDrought_scPDSI_PM_RC_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC;
for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_CMIP,1)
    for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_CMIP,2)
        if ~isnan(MildDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , 1))
            Y = MildDrought_scPDSI_PM_RC_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_MildDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
            p_MildDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_MildDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            p_MildDrought_scPDSI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_MildDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_MildDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_MildDrought_scPDSI_PM_RC_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_MildDrought_scPDSI_PM_RC_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_MildDrought_scPDSI_PM_RC_CMIP_Year(isnan(k_MildDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_Historical'],extent,k_MildDrought_scPDSI_PM_RC_CMIP_Year');
p_MildDrought_scPDSI_PM_RC_CMIP_Year(isnan(p_MildDrought_scPDSI_PM_RC_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_Historical'],extent,p_MildDrought_scPDSI_PM_RC_CMIP_Year');
clear k_MildDrought_scPDSI_PM_RC_CMIP_Year p_MildDrought_scPDSI_PM_RC_CMIP_Year MildDrought_scPDSI_PM_RC_CMIP
% (4.2) PM_RC_CO2_Yang
MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Yang;
for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP,1)
    for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP,2)
        if ~isnan(MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
            Y = MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
            p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_CO2_Yang_Historical'],extent,k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_CO2_Yang_Historical'],extent,p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year');
clear k_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year p_MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP_Year MildDrought_scPDSI_PM_RC_CO2_Yang_CMIP
% (4.3) PM_RC_CO2_Jarvis_H
MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP = GridscPDSI_Princeton_CMIP(6).Ensemble_Mean_DroughtFrequency_Year.MildDrought_scpdsi_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,1)
    for i_lat = 1 : size(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP,2)
        if ~isnan(MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
            Y = MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
            p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig6b_Output 'p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_Historical'],extent,p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year');
clear k_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year p_MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP_Year MildDrought_scPDSI_PM_RC_CO2_Jarvis_H_CMIP
end
