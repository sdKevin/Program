function Ensemble_Mean_PerChange = Fig4a_Plotting(PerChange , Path_Fig4_Output)
load LandInfo_05deg
% from 0-360 to -180~180
A = landmask_05deg(1:360 , :); B = landmask_05deg(361:end , :);
landmask_05deg = [B;A]; clear B A
A = lat_05deg(1:360 , :); B = lat_05deg(361:end , :);
lat_05deg = [B;A]; clear B A
A = lon_05deg(1:360 , :); B = lon_05deg(361:end , :) - 360;
lon_05deg = [B;A]; clear B A
% output tiff extent -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];

ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    %% AI_Jarvis Change
    Ensemble_Mean_PerChange_AI_Jarvis = nanmean(PerChange(i_ssp).PerChange.PerChange_AI_Jarvis,3);
    Ensemble_Mean_PerChange_AI_Jarvis = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_AI_Jarvis([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_AI_Jarvis,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_AI_Jarvis(:,:,i_GCM) .* Ensemble_Mean_PerChange_AI_Jarvis;
        A(A>0) = 1; A(A<=0) = 0;
        PerChange(i_ssp).PerChange.PerChange_AI_Jarvis(:,:,i_GCM) = A;
    end
    % consistency_PerChange_AI_Jarvis represents how many models predict the same trend
    consistency_PerChange_AI_Jarvis = nansum( PerChange(i_ssp).PerChange.PerChange_AI_Jarvis , 3);
    consistency_PerChange_AI_Jarvis = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),consistency_PerChange_AI_Jarvis([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % save matrix as tiff
    Ensemble_Mean_PerChange_AI_Jarvis(isnan(Ensemble_Mean_PerChange_AI_Jarvis))=-9999;
    consistency_PerChange_AI_Jarvis(isnan(consistency_PerChange_AI_Jarvis))=-9999;
    SaveData2GeoTIFF([Path_Fig4_Output 'PerChange_AI_Jarvis_' ssp{i_ssp}],...
        extent , Ensemble_Mean_PerChange_AI_Jarvis');
    SaveData2GeoTIFF([Path_Fig4_Output 'consistency_PerChange_AI_Jarvis_' ssp{i_ssp}],...
        extent , consistency_PerChange_AI_Jarvis');
    
    % Ouput Ensemble_Mean_PerChange for latitudinal and longitudinal
    % distribution analysis
    Ensemble_Mean_PerChange(i_ssp).lat_05deg = lat_05deg;
    Ensemble_Mean_PerChange(i_ssp).lon_05deg = lon_05deg;
    Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_AI_Jarvis = Ensemble_Mean_PerChange_AI_Jarvis;
    
    %% AI_Yang Change
    Ensemble_Mean_PerChange_AI_Yang = nanmean(PerChange(i_ssp).PerChange.PerChange_AI_Yang,3);
    Ensemble_Mean_PerChange_AI_Yang = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_AI_Yang([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_AI_Yang,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_AI_Yang(:,:,i_GCM) .* Ensemble_Mean_PerChange_AI_Yang;
        A(A>0) = 1; A(A<=0) = 0;
        PerChange(i_ssp).PerChange.PerChange_AI_Yang(:,:,i_GCM) = A;
    end
    % consistency_PerChange_AI_Yang represents how many models predict the same trend
    consistency_PerChange_AI_Yang = nansum( PerChange(i_ssp).PerChange.PerChange_AI_Yang , 3);
    consistency_PerChange_AI_Yang = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),consistency_PerChange_AI_Yang([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % save matrix as tiff
    Ensemble_Mean_PerChange_AI_Yang(isnan(Ensemble_Mean_PerChange_AI_Yang))=-9999;
    consistency_PerChange_AI_Yang(isnan(consistency_PerChange_AI_Yang))=-9999;
    SaveData2GeoTIFF([Path_Fig4_Output 'PerChange_AI_Yang_' ssp{i_ssp}],...
        extent , Ensemble_Mean_PerChange_AI_Yang');
    SaveData2GeoTIFF([Path_Fig4_Output 'consistency_PerChange_AI_Yang_' ssp{i_ssp}],...
        extent , consistency_PerChange_AI_Yang');
    
    % Ouput Ensemble_Mean_PerChange for latitudinal and longitudinal
    % distribution analysis
    Ensemble_Mean_PerChange(i_ssp).lat_05deg = lat_05deg;
    Ensemble_Mean_PerChange(i_ssp).lon_05deg = lon_05deg;
    Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_AI_Yang = Ensemble_Mean_PerChange_AI_Yang;
    
    %% AI_FAO Change
    Ensemble_Mean_PerChange_AI_FAO = nanmean(PerChange(i_ssp).PerChange.PerChange_AI_FAO,3);
    Ensemble_Mean_PerChange_AI_FAO = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_AI_FAO([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_AI_FAO,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_AI_FAO(:,:,i_GCM) .* Ensemble_Mean_PerChange_AI_FAO;
        A(A>0) = 1; A(A<=0) = 0;
        PerChange(i_ssp).PerChange.PerChange_AI_FAO(:,:,i_GCM) = A;
    end
    % consistency_PerChange_AI_FAO represents how many models predict the same trend
    consistency_PerChange_AI_FAO = nansum( PerChange(i_ssp).PerChange.PerChange_AI_FAO , 3);
    consistency_PerChange_AI_FAO = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),consistency_PerChange_AI_FAO([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % save matrix as tiff
    Ensemble_Mean_PerChange_AI_FAO(isnan(Ensemble_Mean_PerChange_AI_FAO))=-9999;
    consistency_PerChange_AI_FAO(isnan(consistency_PerChange_AI_FAO))=-9999;
    SaveData2GeoTIFF([Path_Fig4_Output 'PerChange_AI_FAO_' ssp{i_ssp}],...
        extent , Ensemble_Mean_PerChange_AI_FAO');
    SaveData2GeoTIFF([Path_Fig4_Output 'consistency_PerChange_AI_FAO_' ssp{i_ssp}],...
        extent , consistency_PerChange_AI_FAO');
    
    % Ouput Ensemble_Mean_PerChange for latitudinal and longitudinal
    % distribution analysis
    Ensemble_Mean_PerChange(i_ssp).lat_05deg = lat_05deg;
    Ensemble_Mean_PerChange(i_ssp).lon_05deg = lon_05deg;
    Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_AI_FAO = Ensemble_Mean_PerChange_AI_FAO;
end
end