%% Figure 3
% Risk Analysis: Hazard Layer, Exposure Layer and Vulnerability Layer
clc; clear all; close all;
%% (6.1) Load Data and Uniform Resolution
%% Nematodes Data, Extent: -88~88 0~360
Nematodes_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\Nematodes_HR.mat';
load(Nematodes_Path_Data);
lat_HR = lat; lon_HR = lon; clear lat lon Nematodes_Path_Data;
%% SoilMicroBiomass Data
SoilMicroBiomass_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\SoilMicroBiomass.mat';
load(SoilMicroBiomass_Path_Data);
SoilMicroBiomass_HR = interp2(lat,lon,SoilMicroBiomass,lat_HR,lon_HR);
clear lat lon SoilMicroBiomass SoilMicroBiomass_Path_Data
%% CroplandRatio Data
CroplandRatio_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\CroplandRatio.mat';
load(CroplandRatio_Path_Data);
CroplandRatio_HR = interp2(lat',lon',CroplandRatio',lat_HR,lon_HR);
clear lat lon CroplandRatio CroplandRatio_Path_Data
%% Runoff ssp585 Data
load LandInfo_05deg
Runoff_Path_Data = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp585.mat';
load(Runoff_Path_Data);
Mrro = nanmean(PerChange.PerChange_mrro,3);
clear PerChange elevation_05deg landmask_05deg Runoff_Path_Data
% Adjust to uniform Coordinate
A = Mrro(1:360,:); B = Mrro(361:end,:);
Mrro = [B;A]; clear A B
Mrro_HR = interp2(lat_05deg,lon_05deg,Mrro,lat_HR,lon_HR);
clear lat_05deg lon_05deg Mrro
%% Total Population ssp585 Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Total\Mat\ssp5_2100.mat';
load(Population_Path_Data);clear Population_Path_Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Total\Mat\lat.mat';
load(Population_Path_Data);clear Population_Path_Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Total\Mat\lon.mat';
load(Population_Path_Data);clear Population_Path_Data
% Adjust to uniform Coordinate
A = Population(1:1440,:); B = Population(1441:end,:);
Population = [B;A]; clear A B;
A = lat(1:1440,:); B = lat(1441:end,:);
lat = [B;A]; clear A B;
A = lon(1:1440,:); B = lon(1441:end,:);
lon = [B;A]; lon(lon<0) = lon(lon<0) + 360; clear A B;
Total_Population_HR = interp2(lat,lon,Population,lat_HR,lon_HR);
clear lat lon Population
%% Rural Population ssp585 Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Rural\Mat\ssp5rur2100.mat';
load(Population_Path_Data);clear Population_Path_Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Rural\Mat\lat.mat';
load(Population_Path_Data);clear Population_Path_Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Rural\Mat\lon.mat';
load(Population_Path_Data);clear Population_Path_Data
% Adjust to uniform Coordinate
A = Population(1:1440,:); B = Population(1441:end,:);
Population = [B;A]; clear A B
A = lat(1:1440,:); B = lat(1441:end,:);
lat = [B;A]; clear A B
A = lon(1:1440,:); B = lon(1441:end,:);
lon = [B;A]; lon(lon<0) = lon(lon<0)+360;clear A B
Rural_Population_HR = interp2(lat,lon,Population,lat_HR,lon_HR);
Ratio_Rural_Population_HR = Rural_Population_HR./Total_Population_HR;
Ratio_Rural_Population_HR(Total_Population_HR<1) = nan; % For No People Grid
clear lat lon Population Rural_Population_HR
%% Livestock
% Cattle
Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Cattle_HR.mat';
load(Path_Data);Cattle_HR = double(Cattle_HR);
clear lat lon Path_Data
% Chickens
Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Chickens_HR.mat';
load(Path_Data);Chickens_HR = double(Chickens_HR);
clear lat lon Path_Data
% Ducks
Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Ducks_HR.mat';
load(Path_Data);Ducks_HR = double(Ducks_HR);
clear lat lon Path_Data
% Goats
Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Goats_HR.mat';
load(Path_Data);Goats_HR = double(Goats_HR);
clear lat lon Path_Data
% Pigs
Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Pigs_HR.mat';
load(Path_Data);Pigs_HR = double(Pigs_HR);
clear lat lon Path_Data
% Sheep
Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Sheep_HR.mat';
load(Path_Data);Sheep_HR = double(Sheep_HR);
clear lat lon Path_Data
% Sum all different types of livestock
LiveStock_HR = Cattle_HR + Chickens_HR + Ducks_HR + Goats_HR + Pigs_HR + Sheep_HR;
clear Cattle_HR Chickens_HR Ducks_HR Goats_HR Pigs_HR Sheep_HR

% %% (6.2) Extract The Tibet Plateau outflow area
% % Path of Tibet Plateau outflow area Shapefile
% Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\BasinAsWhole_Topo_MergeOriginalData_inTibet.shp';
% Map_TibetPlateau = shaperead(Path_Shapefile);
% GridIndex_TibetPlateau = inpolygon(lon_HR , lat_HR ,...
%     Map_TibetPlateau(1).X,Map_TibetPlateau(1).Y);
% % Delete Other Area
% Nematodes_HR(~GridIndex_TibetPlateau) = nan;
% Mrro_HR(~GridIndex_TibetPlateau) = nan;
% % SoilMicroBiomass_HR(isnan(SoilMicroBiomass_HR)) = 1; %Fill the empty value to 1
% SoilMicroBiomass_HR(~GridIndex_TibetPlateau) = nan;
%% (6.2) Interpolate to Low Resolution
% From -88~88 to -60~88
lat_HR(1:3360,:) = [];
lon_HR(1:3360,:) = [];
CroplandRatio_HR(1:3360,:) = [];
LiveStock_HR(1:3360,:) = [];
Mrro_HR(1:3360,:) = [];
Nematodes_HR(1:3360,:) = [];
SoilMicroBiomass_HR(1:3360,:) = [];
Total_Population_HR(1:3360,:) = [];
Ratio_Rural_Population_HR(1:3360,:) = [];
% Interpolate the High Resoluition Image to Low Resolution
% Extent: -60~60 , 0~360; Resolution: 0.05 deg.
lat_con = -60 : 0.05 : 88; lon_con = 0:0.05:360;
[lon,lat] = meshgrid(lon_con,lat_con);clear lat_con lon_con;
CroplandRatio = interp2(lat_HR',lon_HR',CroplandRatio_HR',lat,lon);
LiveStock = interp2(lat_HR',lon_HR',LiveStock_HR',lat,lon);
Mrro = interp2(lat_HR',lon_HR',Mrro_HR',lat,lon);
Nematodes = interp2(lat_HR',lon_HR',Nematodes_HR',lat,lon);
SoilMicroBiomass = interp2(lat_HR',lon_HR',SoilMicroBiomass_HR',lat,lon);
Total_Population = interp2(lat_HR',lon_HR',Total_Population_HR',lat,lon);
Ratio_Rural_Population = interp2(lat_HR',lon_HR',Ratio_Rural_Population_HR',lat,lon);
clear lat_HR lon_HR CroplandRatio_HR LiveStock_HR Mrro_HR Nematodes_HR
clear SoilMicroBiomass_HR Total_Population_HR Ratio_Rural_Population_HR
%% (6.2) Generate Occurrence Probability of Hazard (Range: [0,1])
% HazardProbability represents the Occurrence probability of water
% transfering dangerous Soil microorganisms
% Fill the empty value to Mean Value and use Nematodes_HR mask as Land Mask
SoilMicroBiomass(isnan(SoilMicroBiomass)) = nanmean(nanmean(SoilMicroBiomass));
Mrro(isnan(Mrro)) = nanmean(nanmean(Mrro));
HazardProbability = Nematodes./nanmax(nanmax(Nematodes)) .* ...
    SoilMicroBiomass./nanmax(nanmax(SoilMicroBiomass)) .* ...
    Mrro./nanmax(nanmax(Mrro));
% Make HazardProbability > 0, where runoff change <0 will be 0, which means no
% possibility to transfer dangerous Soil microorganisms
HazardProbability(HazardProbability<0) = 0;
% Normalize HazardProbability to [0,1]
HazardProbability = HazardProbability./nanmax(nanmax(HazardProbability));
% Using 1-1./(e.^HazardProbability) to estimate the Occurrence probability
% of water transfering dangerous Soil microorganisms
HazardProbability = 1 - 1./exp(1).^HazardProbability;
clear Nematodes Mrro SoilMicroBiomass
%% (6.3) Calculate Exposure
Exposure = Total_Population./nanmax(nanmax(Total_Population)) +...
    LiveStock./nanmax(nanmax(LiveStock)) + CroplandRatio;
clear Total_Population LiveStock CroplandRatio
%% (6.3) Map Output
% Change from 0~360 to -180~180
A = HazardProbability(:,1:3601); B = HazardProbability(:,3602:end);
HazardProbability = [B,A]; clear A B
A = Exposure(:,1:3601); B = Exposure(:,3602:end);
Exposure = [B,A]; clear A B
A = Ratio_Rural_Population(:,1:3601); B = Ratio_Rural_Population(:,3602:end);
Ratio_Rural_Population = [B,A]; clear A B
% Interpolate the seam
HazardProbability(:,3585:3616) = ones(2961,32) .* ...
    nanmean(HazardProbability(:,[3584,3617]),2);
Exposure(:,3599:3602) = ones(2961,4) .* ...
    nanmean(Exposure(:,[3598,3603]),2);
Ratio_Rural_Population(:,3599:3602) = ones(2961,4) .* ...
    nanmean(Ratio_Rural_Population(:,[3598,3603]),2);
% output tiff extent -180~180
extent = [-180 , 180 , -60 , 88];
% Hazard Layer£º Hazard Probability
HazardProbability(isnan(HazardProbability)) = -1;
SaveData2GeoTIFF(['Fig3_OutputTable\HazardProbability.tif' ],...
    extent , HazardProbability);
% Exposure Layer: Exposure which includes total population, livestock and cropland
Exposure(isnan(Exposure)) = -1;
SaveData2GeoTIFF(['Fig3_OutputTable\Exposure.tif' ],...
    extent , Exposure);
% Vulnerability Layer: Ratio_Rural_Population
Ratio_Rural_Population(isnan(Ratio_Rural_Population)) = -1;
SaveData2GeoTIFF(['Fig3_OutputTable\Ratio_Rural_Population.tif' ],...
    extent , Ratio_Rural_Population);




% %% (6.4) Calculating Risk Probability
% Times = 10; % Times of Monte Carlo Simulation
% AssumeMaxProp = 0.0001; % (e.g., 0.0001 is 0.01%) Assuming the maximum probability of releasing Dangerous Soil microorganisms
% % Path of Tibet Watershed Shapefile
% Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData_inTibet.shp';
% RiskProbability = Fig3_RiskProbability(lat_HR , lon_HR , RiskIndex ,...
%     Times , AssumeMaxProp , GridIndex_TibetPlateau , Path_Shapefile);
