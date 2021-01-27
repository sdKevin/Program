function Ensemble_Mean_PerChange = Fig3a_Plotting(PerChange , Path_Fig3_Output)
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
    %% pr Change
    Ensemble_Mean_PerChange_pr = nanmean(PerChange(i_ssp).PerChange.PerChange_pr,3);
    Ensemble_Mean_PerChange_pr = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_pr([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_pr,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_pr(:,:,i_GCM) .* Ensemble_Mean_PerChange_pr;
        A(A>0) = 1; A(A<=0) = 0;
        PerChange(i_ssp).PerChange.PerChange_pr(:,:,i_GCM) = A;
    end
    % consistency_PerChange_pr represents how many models predict the same trend
    consistency_PerChange_pr = nansum( PerChange(i_ssp).PerChange.PerChange_pr , 3);
    consistency_PerChange_pr = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),consistency_PerChange_pr([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % save matrix as tiff
    Ensemble_Mean_PerChange_pr(isnan(Ensemble_Mean_PerChange_pr))=-9999;
    consistency_PerChange_pr(isnan(consistency_PerChange_pr))=-9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'PerChange_pr_' ssp{i_ssp}],...
        extent , Ensemble_Mean_PerChange_pr');
    SaveData2GeoTIFF([Path_Fig3_Output 'consistency_PerChange_pr_' ssp{i_ssp}],...
        extent , consistency_PerChange_pr');
    
    %% pr_evspsbl Change
    Ensemble_Mean_PerChange_pr_evspsbl = nanmean(PerChange(i_ssp).PerChange.PerChange_pr_evspsbl,3);
    Ensemble_Mean_PerChange_pr_evspsbl = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_pr_evspsbl([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_pr_evspsbl,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_pr_evspsbl(:,:,i_GCM) .* Ensemble_Mean_PerChange_pr_evspsbl;
        A(A>0) = 1; A(A<=0) = 0;
        PerChange(i_ssp).PerChange.PerChange_pr_evspsbl(:,:,i_GCM) = A;
    end
    % consistency_PerChange_pr_evspsbl represents how many models predict the same trend
    consistency_PerChange_pr_evspsbl = nansum( PerChange(i_ssp).PerChange.PerChange_pr_evspsbl , 3);
    consistency_PerChange_pr_evspsbl = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),consistency_PerChange_pr_evspsbl([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % save matrix as tiff
    Ensemble_Mean_PerChange_pr_evspsbl(isnan(Ensemble_Mean_PerChange_pr_evspsbl))=-9999;
    consistency_PerChange_pr_evspsbl(isnan(consistency_PerChange_pr_evspsbl))=-9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'PerChange_pr_evspsbl_' ssp{i_ssp}],...
        extent , Ensemble_Mean_PerChange_pr_evspsbl');
    SaveData2GeoTIFF([Path_Fig3_Output 'consistency_PerChange_pr_evspsbl_' ssp{i_ssp}],...
        extent , consistency_PerChange_pr_evspsbl');
    
    %% mrro Change
    Ensemble_Mean_PerChange_mrro = nanmean(PerChange(i_ssp).PerChange.PerChange_mrro,3);
    Ensemble_Mean_PerChange_mrro = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_mrro([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_mrro,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_mrro(:,:,i_GCM) .* Ensemble_Mean_PerChange_mrro;
        A(A>0) = 1; A(A<=0) = 0;
        PerChange(i_ssp).PerChange.PerChange_mrro(:,:,i_GCM) = A;
    end
    % consistency_PerChange_mrro represents how many models predict the same trend
    consistency_PerChange_mrro = nansum( PerChange(i_ssp).PerChange.PerChange_mrro , 3);
    consistency_PerChange_mrro = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),consistency_PerChange_mrro([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % save matrix as tiff
    Ensemble_Mean_PerChange_mrro(isnan(Ensemble_Mean_PerChange_mrro))=-9999;
    consistency_PerChange_mrro(isnan(consistency_PerChange_mrro))=-9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'PerChange_mrro_' ssp{i_ssp}],...
        extent , Ensemble_Mean_PerChange_mrro');
    SaveData2GeoTIFF([Path_Fig3_Output 'consistency_PerChange_mrro_' ssp{i_ssp}],...
        extent , consistency_PerChange_mrro');
    
    %% mrso Change
    Ensemble_Mean_PerChange_mrso = nanmean(PerChange(i_ssp).PerChange.PerChange_mrso,3);
    Ensemble_Mean_PerChange_mrso = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_mrso([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_mrso,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_mrso(:,:,i_GCM) .* Ensemble_Mean_PerChange_mrso;
        A(A>0) = 1; A(A<=0) = 0;
        PerChange(i_ssp).PerChange.PerChange_mrso(:,:,i_GCM) = A;
    end
    % consistency_PerChange_mrso represents how many models predict the same trend
    consistency_PerChange_mrso = nansum( PerChange(i_ssp).PerChange.PerChange_mrso , 3);
    consistency_PerChange_mrso = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),consistency_PerChange_mrso([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % save matrix as tiff
    Ensemble_Mean_PerChange_mrso(isnan(Ensemble_Mean_PerChange_mrso))=-9999;
    consistency_PerChange_mrso(isnan(consistency_PerChange_mrso))=-9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'PerChange_mrso_' ssp{i_ssp}],...
        extent , Ensemble_Mean_PerChange_mrso');
    SaveData2GeoTIFF([Path_Fig3_Output 'consistency_PerChange_mrso_' ssp{i_ssp}],...
        extent , consistency_PerChange_mrso');
    
    % Ouput Ensemble_Mean_PerChange for latitudinal and longitudinal
    % distribution analysis
    Ensemble_Mean_PerChange(i_ssp).lat_05deg = lat_05deg;
    Ensemble_Mean_PerChange(i_ssp).lon_05deg = lon_05deg;
    Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_pr = Ensemble_Mean_PerChange_pr;
    Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_pr_evspsbl = Ensemble_Mean_PerChange_pr_evspsbl;
    Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_mrro = Ensemble_Mean_PerChange_mrro;
    Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_mrso = Ensemble_Mean_PerChange_mrso;
end
end