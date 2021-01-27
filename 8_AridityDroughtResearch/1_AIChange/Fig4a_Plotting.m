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
    %% AI Change
    Ensemble_Mean_PerChange_AI = nanmean(PerChange(i_ssp).PerChange.PerChange_AI,3);
    Ensemble_Mean_PerChange_AI = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_AI([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_AI,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_AI(:,:,i_GCM) .* Ensemble_Mean_PerChange_AI;
        A(A>0) = 1; A(A<=0) = 0;
        PerChange(i_ssp).PerChange.PerChange_AI(:,:,i_GCM) = A;
    end
    % consistency_PerChange_AI represents how many models predict the same trend
    consistency_PerChange_AI = nansum( PerChange(i_ssp).PerChange.PerChange_AI , 3);
    consistency_PerChange_AI = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),consistency_PerChange_AI([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % save matrix as tiff
    Ensemble_Mean_PerChange_AI(isnan(Ensemble_Mean_PerChange_AI))=-9999;
    consistency_PerChange_AI(isnan(consistency_PerChange_AI))=-9999;
    SaveData2GeoTIFF([Path_Fig4_Output 'PerChange_AI_' ssp{i_ssp}],...
        extent , Ensemble_Mean_PerChange_AI');
    SaveData2GeoTIFF([Path_Fig4_Output 'consistency_PerChange_AI_' ssp{i_ssp}],...
        extent , consistency_PerChange_AI');
    
    % Ouput Ensemble_Mean_PerChange for latitudinal and longitudinal
    % distribution analysis
    Ensemble_Mean_PerChange(i_ssp).lat_05deg = lat_05deg;
    Ensemble_Mean_PerChange(i_ssp).lon_05deg = lon_05deg;
    Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange_AI;
end
end