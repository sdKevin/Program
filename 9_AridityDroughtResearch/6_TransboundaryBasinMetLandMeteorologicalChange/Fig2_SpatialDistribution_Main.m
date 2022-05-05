%% Figure SpatialDistribution
clc; clear all; close all;
%% Setting the input/output paths
% CMIP6 Historical Data
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
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
Historical_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year
% ssp126
load(strcat(InputMetDroughtPath{2} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 2051-2100, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp126_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year
% ssp245
load(strcat(InputMetDroughtPath{3} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp245_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year
% ssp370
load(strcat(InputMetDroughtPath{4} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp370_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year
% ssp585
load(strcat(InputMetDroughtPath{5} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp585_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year

% Output tiff figure
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
Historical_Drought_Frequency(isnan(Historical_Drought_Frequency)) = -9999;
ssp126_Drought_Frequency(isnan(ssp126_Drought_Frequency)) = -9999;
ssp245_Drought_Frequency(isnan(ssp245_Drought_Frequency)) = -9999;
ssp370_Drought_Frequency(isnan(ssp370_Drought_Frequency)) = -9999;
ssp585_Drought_Frequency(isnan(ssp585_Drought_Frequency)) = -9999;
SaveData2GeoTIFF(['SpatialDistribution\Historical_Drought_Frequency'] , extent , Historical_Drought_Frequency');
SaveData2GeoTIFF(['SpatialDistribution\ssp126_Drought_Frequency'] , extent , ssp126_Drought_Frequency');
SaveData2GeoTIFF(['SpatialDistribution\ssp245_Drought_Frequency'] , extent , ssp245_Drought_Frequency');
SaveData2GeoTIFF(['SpatialDistribution\ssp370_Drought_Frequency'] , extent , ssp370_Drought_Frequency');
SaveData2GeoTIFF(['SpatialDistribution\ssp585_Drought_Frequency'] , extent , ssp585_Drought_Frequency');

% Recover NAN Data
Historical_Drought_Frequency(Historical_Drought_Frequency<0) = nan;
ssp126_Drought_Frequency(ssp126_Drought_Frequency<0) = nan;
ssp245_Drought_Frequency(ssp245_Drought_Frequency<0) = nan;
ssp370_Drought_Frequency(ssp370_Drought_Frequency<0) = nan;
ssp585_Drought_Frequency(ssp585_Drought_Frequency<0) = nan;

%% Drought Intensity
% Historical
load(strcat(InputMetDroughtPath{1} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,102:151) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
Historical_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year
% ssp126
load(strcat(InputMetDroughtPath{2} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 2051-2100, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp126_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year
% ssp245
load(strcat(InputMetDroughtPath{3} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp245_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year
% ssp370
load(strcat(InputMetDroughtPath{4} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp370_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year
% ssp585
load(strcat(InputMetDroughtPath{5} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp585_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year

% Output tiff figure
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
Historical_Drought_Intensity(isnan(Historical_Drought_Intensity)) = -9999;
ssp126_Drought_Intensity(isnan(ssp126_Drought_Intensity)) = -9999;
ssp245_Drought_Intensity(isnan(ssp245_Drought_Intensity)) = -9999;
ssp370_Drought_Intensity(isnan(ssp370_Drought_Intensity)) = -9999;
ssp585_Drought_Intensity(isnan(ssp585_Drought_Intensity)) = -9999;
SaveData2GeoTIFF(['SpatialDistribution\Historical_Drought_Intensity'] , extent , Historical_Drought_Intensity');
SaveData2GeoTIFF(['SpatialDistribution\ssp126_Drought_Intensity'] , extent , ssp126_Drought_Intensity');
SaveData2GeoTIFF(['SpatialDistribution\ssp245_Drought_Intensity'] , extent , ssp245_Drought_Intensity');
SaveData2GeoTIFF(['SpatialDistribution\ssp370_Drought_Intensity'] , extent , ssp370_Drought_Intensity');
SaveData2GeoTIFF(['SpatialDistribution\ssp585_Drought_Intensity'] , extent , ssp585_Drought_Intensity');

% Recover NAN Data
Historical_Drought_Intensity(Historical_Drought_Intensity<0) = nan;
ssp126_Drought_Intensity(ssp126_Drought_Intensity<0) = nan;
ssp245_Drought_Intensity(ssp245_Drought_Intensity<0) = nan;
ssp370_Drought_Intensity(ssp370_Drought_Intensity<0) = nan;
ssp585_Drought_Intensity(ssp585_Drought_Intensity<0) = nan;

%% Read the boundary file
% TWAP Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\TWAP\river_basins\river_basins.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

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

xlswrite(['Basins_TWAP.xlsx'] , Basin_Historical_Drought_Intensity , 'Sheet1' , 'L3:L288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp126_Drought_Intensity , 'Sheet1' , 'M3:M288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp245_Drought_Intensity , 'Sheet1' , 'N3:N288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp370_Drought_Intensity , 'Sheet1' , 'O3:O288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp585_Drought_Intensity , 'Sheet1' , 'P3:P288');

xlswrite(['Basins_TWAP.xlsx'] , Basin_Historical_Drought_Frequency , 'Sheet1' , 'U3:U288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp126_Drought_Frequency , 'Sheet1' , 'V3:V288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp245_Drought_Frequency , 'Sheet1' , 'W3:W288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp370_Drought_Frequency , 'Sheet1' , 'X3:X288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp585_Drought_Frequency , 'Sheet1' , 'Y3:Y288');

clear GlobalTransboundary Basin_Historical_Drought_Intensity Basin_ssp126_Drought_Intensity
clear Basin_ssp245_Drought_Intensity Basin_ssp370_Drought_Intensity Basin_ssp585_Drought_Intensity
clear Basin_Historical_Drought_Frequency Basin_ssp126_Drought_Frequency
clear Basin_ssp245_Drought_Frequency Basin_ssp370_Drought_Frequency Basin_ssp585_Drought_Frequency

% Munia Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\Basin.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

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

xlswrite(['Basins_Munia.xlsx'] , Basin_Historical_Drought_Intensity , 'Sheet1' , 'C3:C170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp126_Drought_Intensity , 'Sheet1' , 'D3:D170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp245_Drought_Intensity , 'Sheet1' , 'E3:E170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp370_Drought_Intensity , 'Sheet1' , 'F3:F170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp585_Drought_Intensity , 'Sheet1' , 'G3:G170');

xlswrite(['Basins_Munia.xlsx'] , Basin_Historical_Drought_Frequency , 'Sheet1' , 'L3:L170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp126_Drought_Frequency , 'Sheet1' , 'M3:M170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp245_Drought_Frequency , 'Sheet1' , 'N3:N170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp370_Drought_Frequency , 'Sheet1' , 'O3:O170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp585_Drought_Frequency , 'Sheet1' , 'P3:P170');

