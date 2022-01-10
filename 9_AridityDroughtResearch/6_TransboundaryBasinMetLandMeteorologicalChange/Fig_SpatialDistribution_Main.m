%% Figure SpatialDistribution
clc; clear all; close all;
%% Read the boundary file
Path_GlobalTransboundary = 'G:\TransboundaryRivers\TWAP\river_basins\river_basins.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary
%% Setting the input/output paths
% CMIP6 Historical Met Data
InputMetDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\Met_Land_Historical_';
% CMIP6 ScenarioMIP ssp126 Data
InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\Met_Land_ssp126_';
% CMIP6 ScenarioMIP ssp245 Data
InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_';
% CMIP6 ScenarioMIP ssp370 Data
InputMetDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\Met_Land_ssp370_';
% CMIP6 ScenarioMIP ssp585 Data
InputMetDroughtPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\Met_Land_ssp585_';

% Extract GlobalTransboundary
load LandInfo_05deg.mat
Lon_05deg(1:360,:) = lon_05deg(361:end,:) - 360; Lon_05deg(361:720,:) = lon_05deg(1:360,:); clear lon_05deg% Adjust longitude from 0-360 to -180-180

%% Drought Frequency
% Historical
load(strcat(InputMetDroughtPath{1} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,102:151) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
Historical_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year
% ssp126
load(strcat(InputMetDroughtPath{2} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 2051-2100, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
ssp126_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year
% ssp245
load(strcat(InputMetDroughtPath{3} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
ssp245_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year
% ssp370
load(strcat(InputMetDroughtPath{4} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
ssp370_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year
% ssp585
load(strcat(InputMetDroughtPath{5} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
ssp585_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year

%% Drought Intensity
% Historical
load(strcat(InputMetDroughtPath{1} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,102:151) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
Historical_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year
% ssp126
load(strcat(InputMetDroughtPath{2} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 2051-2100, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
ssp126_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year
% ssp245
load(strcat(InputMetDroughtPath{3} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
ssp245_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year
% ssp370
load(strcat(InputMetDroughtPath{4} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
ssp370_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year
% ssp585
load(strcat(InputMetDroughtPath{5} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(359,:) = nanmean(BB(354:358,:)); BB(360,:) = nanmean(BB(355:359,:)); BB(361,:) = mean(BB(362:366,:)); % interpolate the seam
ssp585_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year



for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat_05deg , Lon_05deg , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_Historical_Drought_Frequency(i_basin,1) = nanmean(Historical_Drought_Frequency(in));
    Basin_ssp126_Drought_Frequency(i_basin,1) = nanmean(ssp126_Drought_Frequency(in));
    Basin_ssp245_Drought_Frequency(i_basin,1) = nanmean(ssp245_Drought_Frequency(in));
    Basin_ssp370_Drought_Frequency(i_basin,1) = nanmean(ssp370_Drought_Frequency(in));
    Basin_ssp585_Drought_Frequency(i_basin,1) = nanmean(ssp585_Drought_Frequency(in));
    Basin_Historical_Drought_Intensity(i_basin,1) = nanmean(Historical_Drought_Intensity(in));
    Basin_ssp126_Drought_Intensity(i_basin,1) = nanmean(ssp126_Drought_Intensity(in));
    Basin_ssp245_Drought_Intensity(i_basin,1) = nanmean(ssp245_Drought_Intensity(in));
    Basin_ssp370_Drought_Intensity(i_basin,1) = nanmean(ssp370_Drought_Intensity(in));
    Basin_ssp585_Drought_Intensity(i_basin,1) = nanmean(ssp585_Drought_Intensity(in));
    clear in
end
clear i_basin

xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_Historical_Drought_Intensity , 'Sheet1' , 'F3:F288');
xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_ssp126_Drought_Intensity , 'Sheet1' , 'G3:G288');
xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_ssp245_Drought_Intensity , 'Sheet1' , 'H3:H288');
xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_ssp370_Drought_Intensity , 'Sheet1' , 'I3:I288');
xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_ssp585_Drought_Intensity , 'Sheet1' , 'J3:J288');

xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_Historical_Drought_Frequency , 'Sheet1' , 'K3:K288');
xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_ssp126_Drought_Frequency , 'Sheet1' , 'L3:L288');
xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_ssp245_Drought_Frequency , 'Sheet1' , 'M3:M288');
xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_ssp370_Drought_Frequency , 'Sheet1' , 'N3:N288');
xlswrite(['UNTransboundary_CompoundDrought.xlsx'] , Basin_ssp585_Drought_Frequency , 'Sheet1' , 'O3:O288');































for i_Path = 1 : length(InputMetDroughtPath)
    
    
    
    
    
    
    
    %     if i_Path == 4
    %         % Name of Global Climate Model
    %         GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    %             'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    %             'GISS-E2-1-G','INM-CM4-8',...
    %             'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    %             'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    %     else
    %         % Name of Global Climate Model, since HadGEM3-GC31-LL model does
    %         % not have ssp370
    %         GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    %             'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    %             'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    %             'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    %             'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    %     end
    %     for i_GCM = 1 : length(GCM_Ensemble)
    %         GCM = GCM_Ensemble{i_GCM};
    %         load(strcat(InputMetDroughtPath{i_Path} , GCM , '_DroughtFrequency_Year.mat'));
    %         for i_Year = 1 : size(DroughtFrequency_Year.CompoundDrought,3)
    %             AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
    %             BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
    %             Met_Drought_Frequency_Year(i_Path).DroughtFrequency_Year.CompoundDrought(i_GCM,i_Year) = nanmean(BB(in));
    %             clear BB
    %         end
    %         clear GCM i_Year DroughtFrequency_Year
    %     end
    %     clear i_GCM
end






























%% Figure SpatialDistribution
clc; clear all; close all;
%% Read the boundary file
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\Basin.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary
%% Setting the input/output paths
% CMIP6 Historical Met Data
InputMetDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\Met_Land_Historical_';
% CMIP6 ScenarioMIP ssp126 Data
InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\Met_Land_ssp126_';
% CMIP6 ScenarioMIP ssp245 Data
InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_';
% CMIP6 ScenarioMIP ssp370 Data
InputMetDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\Met_Land_ssp370_';
% CMIP6 ScenarioMIP ssp585 Data
InputMetDroughtPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\Met_Land_ssp585_';

% Extract GlobalTransboundary
load LandInfo_05deg.mat
Lon_05deg(1:360,:) = lon_05deg(361:end,:) - 360; Lon_05deg(361:720,:) = lon_05deg(1:360,:); % Adjust longitude from 0-360 to -180-180
in = inpolygon(lat_05deg , Lon_05deg , GlobalTransboundary.Y , GlobalTransboundary.X); clear Lon_05deg;

%% Calculating Drought Frequency
for i_Path = 1 : length(InputMetDroughtPath)
    if i_Path == 4
        % Name of Global Climate Model
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'GISS-E2-1-G','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    else
        % Name of Global Climate Model, since HadGEM3-GC31-LL model does
        % not have ssp370
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    end
    for i_GCM = 1 : length(GCM_Ensemble)
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputMetDroughtPath{i_Path} , GCM , '_DroughtFrequency_Year.mat'));
        for i_Year = 1 : size(DroughtFrequency_Year.CompoundDrought,3)
            AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            Met_Drought_Frequency_Year(i_Path).DroughtFrequency_Year.CompoundDrought(i_GCM,i_Year) = nanmean(BB(in));
            clear BB
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM
end

%% Calculating Drought Extent
load EarthLandArea_05deg.mat
XX(1:360,:) = EarthLandArea_05deg(361:end,:) - 360; XX(361:720,:) = EarthLandArea_05deg(1:360,:); % Adjust longitude from 0-360 to -180-180
EarthLandArea_05deg = XX; clear XX;
for i_Path = 1 : length(InputMetDroughtPath)
    if i_Path == 4
        % Name of Global Climate Model
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'GISS-E2-1-G','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    else
        % Name of Global Climate Model, since HadGEM3-GC31-LL model does
        % not have ssp370
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    end
    for i_GCM = 1 : length(GCM_Ensemble)
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputMetDroughtPath{i_Path} , GCM , '_DroughtFrequency_Year.mat'));
        for i_Year = 1 : size(DroughtFrequency_Year.CompoundDrought,3)
            AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            CC = BB >= 1; clear BB
            Met_Drought_Extent_Year(i_Path).DroughtExtent_Year.CompoundDrought(i_GCM,i_Year) = nansum(EarthLandArea_05deg(CC&in))./nansum(EarthLandArea_05deg(in)) .* 100;
            clear CC BB
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM
end

%% Calculating Drought Intensity
for i_Path = 1 : length(InputMetDroughtPath)
    if i_Path == 4
        % Name of Global Climate Model
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'GISS-E2-1-G','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    else
        % Name of Global Climate Model, since HadGEM3-GC31-LL model does
        % not have ssp370
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    end
    for i_GCM = 1 : length(GCM_Ensemble)
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputMetDroughtPath{i_Path} , GCM , '_DroughtIntensity_Month_Year.mat'));
        for i_Year = 1 : size(DroughtIntensity_Year.CompoundDrought,3)
            AA = DroughtIntensity_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            Met_Drought_Intensity_Year(i_Path).DroughtIntensity_Year.CompoundDrought(i_GCM,i_Year) = nanmean(BB(in));
            clear BB
        end
        clear GCM i_Year DroughtIntensity_Year DroughtIntensity_Month
    end
    clear i_GCM
end
save('Met_Drought_Frequency_Intensity_Extent' , 'Met_Drought_Frequency_Year' , 'Met_Drought_Intensity_Year' , 'Met_Drought_Extent_Year');

%% Plotting
clc; clear all; close all;
load Met_Drought_Frequency_Intensity_Extent
subplot(3,1,1)
Fig_Timeseries_Intensity(Met_Drought_Intensity_Year)
subplot(3,1,2)
Fig_Timeseries_Extent(Met_Drought_Extent_Year)
subplot(3,1,3)
Fig_Timeseries_Frequency(Met_Drought_Frequency_Year)



























