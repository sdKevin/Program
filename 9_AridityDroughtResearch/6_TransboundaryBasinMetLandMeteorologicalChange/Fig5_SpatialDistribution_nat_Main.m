%% Figure SpatialDistribution
clc; clear all; close all;
%% Setting the input/output paths
% CMIP6 hist-nat Met Data
InputMetDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\hist_nat\Met_Land_hist_nat_';
% CMIP6 ssp245-nat Data
InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ssp245_nat\Met_Land_ssp245_nat_';
% CMIP6 piControl Data
InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\piControl\Met_Land_piControl_';

% Extract GlobalTransboundary0
load LandInfo_05deg.mat
Lon_05deg(1:360,:) = lon_05deg(361:end,:) - 360; Lon_05deg(361:720,:) = lon_05deg(1:360,:); clear lon_05deg% Adjust longitude from 0-360 to -180-180

%% Drought Frequency
% hist-nat
load(strcat(InputMetDroughtPath{1} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,102:151) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
hist_nat_Drought_Frequency = BB; hist_nat_Ensemble_Mean_DroughtFrequency_Year = Ensemble_Mean_DroughtFrequency_Year; clear BB Ensemble_Mean_DroughtFrequency_Year

% ssp245-nat
load(strcat(InputMetDroughtPath{2} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
% mean over 2051-2100, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,37:86) .*10 ,3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp245_nat_Drought_Frequency = BB; clear BB Ensemble_Mean_DroughtFrequency_Year

% piControl
load(strcat(InputMetDroughtPath{3} , 'Ensemble_Mean_DroughtFrequency_Year.mat'));
AA_Max = nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,1:50) .*10 ,3) ,...
    nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,51:100) .*10 ,3) , nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,101:150) .*10 ,3) ,...
    nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,151:200) .*10 ,3) , nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,201:250) .*10 ,3) ,...
    nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,251:300) .*10 ,3) , nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,301:350) .*10 ,3) ,...
    nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,351:400) .*10 ,3) , nanmax(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,401:450) .*10 ,3) ,...
    nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,451:500) .*10 ,3))))))))));
AA_Min = nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,1:50) .*10 ,3) ,...
    nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,51:100) .*10 ,3) , nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,101:150) .*10 ,3) ,...
    nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,151:200) .*10 ,3) , nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,201:250) .*10 ,3) ,...
    nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,251:300) .*10 ,3) , nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,301:350) .*10 ,3) ,...
    nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,351:400) .*10 ,3) , nanmin(nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,401:450) .*10 ,3) ,...
    nanmean(Ensemble_Mean_DroughtFrequency_Year.CompoundDrought(:,:,451:500) .*10 ,3))))))))));

BB_Max(1:360,:) = AA_Max(361:end,:); BB_Max(361:720,:) = AA_Max(1:360,:); clear AA_Max;  % Adjust longitude from 0-360 to -180-180
BB_Max(358,:) = BB_Max(357,:) + ~isnan(BB_Max(358,:)) .* 1 .* ((BB_Max(362,:)-BB_Max(357,:))./5); BB_Max(359,:) = BB_Max(357,:) + ~isnan(BB_Max(359,:)) .* 2 .* ((BB_Max(362,:)-BB_Max(357,:))./5); % interpolate the seam
BB_Max(360,:) = BB_Max(357,:) + ~isnan(BB_Max(360,:)) .* 3 .* ((BB_Max(362,:)-BB_Max(357,:))./5); BB_Max(361,:) = BB_Max(357,:) + ~isnan(BB_Max(361,:)) .* 4 .* ((BB_Max(362,:)-BB_Max(357,:))./5); % interpolate the seam
piControl_Drought_Frequency_Max = BB_Max; clear BB_Max Ensemble_Mean_DroughtFrequency_Year

BB_Min(1:360,:) = AA_Min(361:end,:); BB_Min(361:720,:) = AA_Min(1:360,:); clear AA_Min;  % Adjust longitude from 0-360 to -180-180
BB_Min(358,:) = BB_Min(357,:) + ~isnan(BB_Min(358,:)) .* 1 .* ((BB_Min(362,:)-BB_Min(357,:))./5); BB_Min(359,:) = BB_Min(357,:) + ~isnan(BB_Min(359,:)) .* 2 .* ((BB_Min(362,:)-BB_Min(357,:))./5); % interpolate the seam
BB_Min(360,:) = BB_Min(357,:) + ~isnan(BB_Min(360,:)) .* 3 .* ((BB_Min(362,:)-BB_Min(357,:))./5); BB_Min(361,:) = BB_Min(357,:) + ~isnan(BB_Min(361,:)) .* 4 .* ((BB_Min(362,:)-BB_Min(357,:))./5); % interpolate the seam
piControl_Drought_Frequency_Min = BB_Min; clear BB_Min Ensemble_Mean_DroughtFrequency_Year


% Output tiff figure
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
hist_nat_Drought_Frequency(isnan(hist_nat_Drought_Frequency)) = -9999;
ssp245_nat_Drought_Frequency(isnan(ssp245_nat_Drought_Frequency)) = -9999;
piControl_Drought_Frequency_Max(isnan(piControl_Drought_Frequency_Max)) = -9999;
piControl_Drought_Frequency_Min(isnan(piControl_Drought_Frequency_Min)) = -9999;

SaveData2GeoTIFF(['SpatialDistribution\hist_nat_Drought_Frequency'] , extent , hist_nat_Drought_Frequency');
SaveData2GeoTIFF(['SpatialDistribution\ssp245_nat_Drought_Frequency'] , extent , ssp245_nat_Drought_Frequency');
SaveData2GeoTIFF(['SpatialDistribution\piControl_Drought_Frequency_Max'] , extent , piControl_Drought_Frequency_Max');
SaveData2GeoTIFF(['SpatialDistribution\piControl_Drought_Frequency_Min'] , extent , piControl_Drought_Frequency_Min');

% Recover NAN Data
hist_nat_Drought_Frequency(hist_nat_Drought_Frequency<0) = nan;
ssp245_nat_Drought_Frequency(ssp245_nat_Drought_Frequency<0) = nan;
piControl_Drought_Frequency_Max(piControl_Drought_Frequency_Max<0) = nan;
piControl_Drought_Frequency_Min(piControl_Drought_Frequency_Min<0) = nan;

%% Drought Intensity
% hist-nat
load(strcat(InputMetDroughtPath{1} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,102:151) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
hist_nat_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year

% ssp245-nat
load(strcat(InputMetDroughtPath{2} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
% mean over 1951-2000, Unit: months per decade
AA = nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,37:86) , 3);
BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
BB(358,:) = BB(357,:) + ~isnan(BB(358,:)) .* 1 .* ((BB(362,:)-BB(357,:))./5); BB(359,:) = BB(357,:) + ~isnan(BB(359,:)) .* 2 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
BB(360,:) = BB(357,:) + ~isnan(BB(360,:)) .* 3 .* ((BB(362,:)-BB(357,:))./5); BB(361,:) = BB(357,:) + ~isnan(BB(361,:)) .* 4 .* ((BB(362,:)-BB(357,:))./5); % interpolate the seam
ssp245_nat_Drought_Intensity = BB; clear BB Ensemble_Mean_DroughtIntensity_Year

% piControl
load(strcat(InputMetDroughtPath{3} , 'Ensemble_Mean_DroughtIntensity_Year.mat'));
AA_Max = nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,1:50) ,3) ,...
    nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,51:100) ,3) , nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,101:150) ,3) ,...
    nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,151:200) ,3) , nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,201:250) ,3) ,...
    nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,251:300) ,3) , nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,301:350) ,3) ,...
    nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,351:400) ,3) , nanmax(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,401:450) ,3) ,...
    nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,451:500) ,3))))))))));
AA_Min = nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,1:50) ,3) ,...
    nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,51:100) ,3) , nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,101:150) ,3) ,...
    nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,151:200) ,3) , nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,201:250) ,3) ,...
    nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,251:300) ,3) , nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,301:350) ,3) ,...
    nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,351:400) ,3) , nanmin(nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,401:450) ,3) ,...
    nanmean(Ensemble_Mean_DroughtIntensity_Year.CompoundDrought(:,:,451:500) ,3))))))))));

BB_Max(1:360,:) = AA_Max(361:end,:); BB_Max(361:720,:) = AA_Max(1:360,:); clear AA_Max;  % Adjust longitude from 0-360 to -180-180
BB_Max(358,:) = BB_Max(357,:) + ~isnan(BB_Max(358,:)) .* 1 .* ((BB_Max(362,:)-BB_Max(357,:))./5); BB_Max(359,:) = BB_Max(357,:) + ~isnan(BB_Max(359,:)) .* 2 .* ((BB_Max(362,:)-BB_Max(357,:))./5); % interpolate the seam
BB_Max(360,:) = BB_Max(357,:) + ~isnan(BB_Max(360,:)) .* 3 .* ((BB_Max(362,:)-BB_Max(357,:))./5); BB_Max(361,:) = BB_Max(357,:) + ~isnan(BB_Max(361,:)) .* 4 .* ((BB_Max(362,:)-BB_Max(357,:))./5); % interpolate the seam
piControl_Drought_Intensity_Max = BB_Max; clear BB_Max Ensemble_Mean_DroughtIntensity_Year

BB_Min(1:360,:) = AA_Min(361:end,:); BB_Min(361:720,:) = AA_Min(1:360,:); clear AA_Min;  % Adjust longitude from 0-360 to -180-180
BB_Min(358,:) = BB_Min(357,:) + ~isnan(BB_Min(358,:)) .* 1 .* ((BB_Min(362,:)-BB_Min(357,:))./5); BB_Min(359,:) = BB_Min(357,:) + ~isnan(BB_Min(359,:)) .* 2 .* ((BB_Min(362,:)-BB_Min(357,:))./5); % interpolate the seam
BB_Min(360,:) = BB_Min(357,:) + ~isnan(BB_Min(360,:)) .* 3 .* ((BB_Min(362,:)-BB_Min(357,:))./5); BB_Min(361,:) = BB_Min(357,:) + ~isnan(BB_Min(361,:)) .* 4 .* ((BB_Min(362,:)-BB_Min(357,:))./5); % interpolate the seam
piControl_Drought_Intensity_Min = BB_Min; clear BB_Min Ensemble_Mean_DroughtIntensity_Year


% Output tiff figure
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
hist_nat_Drought_Intensity(isnan(hist_nat_Drought_Intensity)) = -9999;
ssp245_nat_Drought_Intensity(isnan(ssp245_nat_Drought_Intensity)) = -9999;
piControl_Drought_Intensity_Max(isnan(piControl_Drought_Intensity_Max)) = -9999;
piControl_Drought_Intensity_Min(isnan(piControl_Drought_Intensity_Min)) = -9999;

SaveData2GeoTIFF(['SpatialDistribution\hist_nat_Drought_Intensity'] , extent , hist_nat_Drought_Intensity');
SaveData2GeoTIFF(['SpatialDistribution\ssp245_nat_Drought_Intensity'] , extent , ssp245_nat_Drought_Intensity');
SaveData2GeoTIFF(['SpatialDistribution\piControl_Drought_Intensity_Max'] , extent , piControl_Drought_Intensity_Max');
SaveData2GeoTIFF(['SpatialDistribution\piControl_Drought_Intensity_Min'] , extent , piControl_Drought_Intensity_Min');

% Recover NAN Data
hist_nat_Drought_Intensity(hist_nat_Drought_Intensity<0) = nan;
ssp245_nat_Drought_Intensity(ssp245_nat_Drought_Intensity<0) = nan;
piControl_Drought_Intensity_Max(piControl_Drought_Intensity_Max<0) = nan;
piControl_Drought_Intensity_Min(piControl_Drought_Intensity_Min<0) = nan;

%% Read the boundary file
% TWAP Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\TWAP\river_basins\river_basins.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat_05deg , Lon_05deg , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_hist_nat_Drought_Frequency(i_basin,1) = nanmean(hist_nat_Drought_Frequency(in));
    Basin_ssp245_nat_Drought_Frequency(i_basin,1) = nanmean(ssp245_nat_Drought_Frequency(in));
    Basin_piControl_Max_Drought_Frequency(i_basin,1) = nanmean(piControl_Drought_Frequency_Max(in));
    Basin_piControl_Min_Drought_Frequency(i_basin,1) = nanmean(piControl_Drought_Frequency_Min(in));
    
    Basin_hist_nat_Drought_Intensity(i_basin,1) = nanmean(hist_nat_Drought_Intensity(in));
    Basin_ssp245_nat_Drought_Intensity(i_basin,1) = nanmean(ssp245_nat_Drought_Intensity(in));
    Basin_piControl_Max_Drought_Intensity(i_basin,1) = nanmean(piControl_Drought_Intensity_Max(in));
    Basin_piControl_Min_Drought_Intensity(i_basin,1) = nanmean(piControl_Drought_Intensity_Min(in));
    clear in
end
clear i_basin

xlswrite(['Basins_TWAP.xlsx'] , Basin_hist_nat_Drought_Intensity , 'Sheet1' , 'Q3:Q288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp245_nat_Drought_Intensity , 'Sheet1' , 'R3:R288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_piControl_Max_Drought_Intensity , 'Sheet1' , 'S3:S288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_piControl_Min_Drought_Intensity , 'Sheet1' , 'T3:T288');

xlswrite(['Basins_TWAP.xlsx'] , Basin_hist_nat_Drought_Frequency , 'Sheet1' , 'Z3:Z288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp245_nat_Drought_Frequency , 'Sheet1' , 'AA3:AA288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_piControl_Max_Drought_Frequency , 'Sheet1' , 'AB3:AB288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_piControl_Min_Drought_Frequency , 'Sheet1' , 'AC3:AC288');

clear GlobalTransboundary Basin_hist_nat_Drought_Intensity Basin_ssp245_nat_Drought_Intensity
clear Basin_hist_nat_Drought_Frequency Basin_ssp245_nat_Drought_Frequency
clear Basin_piControl_Max_Drought_Frequency Basin_piControl_Min_Drought_Frequency
clear Basin_piControl_Max_Drought_Intensity Basin_piControl_Min_Drought_Intensity


% Munia Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\Basin.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat_05deg , Lon_05deg , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_hist_nat_Drought_Frequency(i_basin,1) = nanmean(hist_nat_Drought_Frequency(in));
    Basin_ssp245_nat_Drought_Frequency(i_basin,1) = nanmean(ssp245_nat_Drought_Frequency(in));
    Basin_piControl_Max_Drought_Frequency(i_basin,1) = nanmean(piControl_Drought_Frequency_Max(in));
    Basin_piControl_Min_Drought_Frequency(i_basin,1) = nanmean(piControl_Drought_Frequency_Min(in));
    
    Basin_hist_nat_Drought_Intensity(i_basin,1) = nanmean(hist_nat_Drought_Intensity(in));
    Basin_ssp245_nat_Drought_Intensity(i_basin,1) = nanmean(ssp245_nat_Drought_Intensity(in));
    Basin_piControl_Max_Drought_Intensity(i_basin,1) = nanmean(piControl_Drought_Intensity_Max(in));
    Basin_piControl_Min_Drought_Intensity(i_basin,1) = nanmean(piControl_Drought_Intensity_Min(in));
    clear in
end
clear i_basin

xlswrite(['Basins_Munia.xlsx'] , Basin_hist_nat_Drought_Intensity , 'Sheet1' , 'H3:H170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp245_nat_Drought_Intensity , 'Sheet1' , 'I3:I170');
xlswrite(['Basins_Munia.xlsx'] , Basin_piControl_Max_Drought_Intensity , 'Sheet1' , 'J3:J170');
xlswrite(['Basins_Munia.xlsx'] , Basin_piControl_Min_Drought_Intensity , 'Sheet1' , 'K3:K170');

xlswrite(['Basins_Munia.xlsx'] , Basin_hist_nat_Drought_Frequency , 'Sheet1' , 'Q3:Q170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp245_nat_Drought_Frequency , 'Sheet1' , 'R3:R170');
xlswrite(['Basins_Munia.xlsx'] , Basin_piControl_Max_Drought_Frequency , 'Sheet1' , 'S3:S170');
xlswrite(['Basins_Munia.xlsx'] , Basin_piControl_Min_Drought_Frequency , 'Sheet1' , 'T3:T170');

