function Fig2c_Plotting(GridSM_CMIP , Path_Fig2_Output)
load LandInfo_05deg
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];

A = landmask_05deg(1:360 , :); B = landmask_05deg(361:end , :);
landmask_05deg = [B;A]; clear B A
A = lat_05deg(1:360 , :); B = lat_05deg(361:end , :);
lat_05deg = [B;A]; clear B A
A = lon_05deg(1:360 , :); B = lon_05deg(361:end , :) - 360;
lon_05deg = [B;A]; clear B A

for ii = 1 : size(GridSM_CMIP(1).Ensemble_Land_Var_Mrso , 3)
    % ssp126 SM
    A = GridSM_CMIP(1).Ensemble_Land_Var_Mrso(1:360 , : , ii);
    B = GridSM_CMIP(1).Ensemble_Land_Var_Mrso(361:end , : , ii);
    GridSM_CMIP(1).Ensemble_Land_Var_Mrso(: , : , ii) = [B;A];
    % ssp245 SM
    A = GridSM_CMIP(2).Ensemble_Land_Var_Mrso(1:360 , : , ii);
    B = GridSM_CMIP(2).Ensemble_Land_Var_Mrso(361:end , : , ii);
    GridSM_CMIP(2).Ensemble_Land_Var_Mrso(: , : , ii) = [B;A];
    % ssp370 SM
    A = GridSM_CMIP(3).Ensemble_Land_Var_Mrso(1:360 , : , ii);
    B = GridSM_CMIP(3).Ensemble_Land_Var_Mrso(361:end , : , ii);
    GridSM_CMIP(3).Ensemble_Land_Var_Mrso(: , : , ii) = [B;A];
    % ssp585 SM
    A = GridSM_CMIP(4).Ensemble_Land_Var_Mrso(1:360 , : , ii);
    B = GridSM_CMIP(4).Ensemble_Land_Var_Mrso(361:end , : , ii);
    GridSM_CMIP(4).Ensemble_Land_Var_Mrso(: , : , ii) = [B;A];
end
for ii = 1 : size(GridSM_CMIP(5).Ensemble_Land_Var_Mrso , 3)
    % SM
    A = GridSM_CMIP(5).Ensemble_Land_Var_Mrso(1:360 , : , ii);
    B = GridSM_CMIP(5).Ensemble_Land_Var_Mrso(361:end , : , ii);
    GridSM_CMIP(5).Ensemble_Land_Var_Mrso(: , : , ii) = [B;A];
end

%% (2) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % SM (kg/(m2)) to mm
    SM_CMIP =  GridSM_CMIP(i_ssp).Ensemble_Land_Var_Mrso .* 1000 ./ 997;
    for i_lon = 1 : size(SM_CMIP,1)
        for i_lat = 1 : size(SM_CMIP,2)
            if ~isnan(SM_CMIP(i_lon , i_lat , 1))
                Y = SM_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_SM_CMIP_Year(i_lon,i_lat) = b(2);
                p_SM_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_SM_CMIP_Year(i_lon,i_lat) = nan;
                p_SM_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    
    % interpolate the seam
    k_SM_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),k_SM_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    p_SM_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),p_SM_CMIP_Year([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg;
    
    k_SM_CMIP_Year(isnan(k_SM_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig2_Output 'k_SM_' ssp{i_ssp}],extent,k_SM_CMIP_Year');
    p_SM_CMIP_Year(isnan(p_SM_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig2_Output 'p_SM_' ssp{i_ssp}],extent,p_SM_CMIP_Year');
    clear k_SM_CMIP_Year p_SM_CMIP_Year SM_CMIP
end

%% (3) linear regression of AI calculated by CMIP historical experiments
% SM (kg/(m2s)) to mm/year
SM_CMIP =  GridSM_CMIP(5).Ensemble_Land_Var_Mrso .* 1000 ./997;
for i_lon = 1 : size(SM_CMIP,1)
    for i_lat = 1 : size(SM_CMIP,2)
        if ~isnan(SM_CMIP(i_lon , i_lat , 1))
            Y = SM_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SM_CMIP_Year(i_lon,i_lat) = b(2);
            p_SM_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SM_CMIP_Year(i_lon,i_lat) = nan;
            p_SM_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon

% interpolate the seam
k_SM_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),k_SM_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;
p_SM_CMIP_Year = interp2(lat_05deg([1:358,362:end],:),...
    lon_05deg([1:358,362:end],:),p_SM_CMIP_Year([1:358,362:end],:),...
    lat_05deg,lon_05deg).*landmask_05deg;

k_SM_CMIP_Year(isnan(k_SM_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig2_Output 'k_SM_Historical'],extent,k_SM_CMIP_Year');
p_SM_CMIP_Year(isnan(p_SM_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig2_Output 'p_SM_Historical'],extent,p_SM_CMIP_Year');
clear k_SM_CMIP_Year p_SM_CMIP_Year SM_CMIP
end
