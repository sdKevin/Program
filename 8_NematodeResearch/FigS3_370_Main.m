%% Figure 3
% Risk Analysis: Hazard Layer, Exposure Layer and Vulnerability Layer
clc; clear all; close all;
%% (6.1) Load Data and Uniform Resolution
%% Nematodes Data, Extent: -88~88 0~360
Nematodes_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\Nematodes_HR.mat';
load(Nematodes_Path_Data);
lat_HR = lat; lon_HR = lon; clear lat lon Nematodes_Path_Data;
%% Ecosystem Sensitivity
EcosystemSensitivity_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\Ecosystem_Sensitivity.mat';
load(EcosystemSensitivity_Path_Data);
EcosystemSensitivity_HR = interp2(lat,lon,Ecosystem_Sensitivity,lat_HR,lon_HR);
clear lat lon Ecosystem_Sensitivity EcosystemSensitivity_Path_Data
%% SoilMicroBiomass Data
% SoilMicroBiomass_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\SoilMicroBiomass.mat';
% load(SoilMicroBiomass_Path_Data);
% SoilMicroBiomass_HR = interp2(lat,lon,SoilMicroBiomass,lat_HR,lon_HR);
% clear lat lon SoilMicroBiomass SoilMicroBiomass_Path_Data
%% DEM Data
DEM_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\DEM\DEM_HR.mat';
load(DEM_Path_Data);
clear lat lon DEM_Path_Data
%% Percentage Change of Runoff ssp370 Data
load LandInfo_05deg
Runoff_Path_Data = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp370.mat';
load(Runoff_Path_Data);
PerChange_Mrro = nanmean(PerChange.PerChange_mrro,3);
clear PerChange elevation_05deg landmask_05deg Runoff_Path_Data
% Adjust to uniform Coordinate
A = PerChange_Mrro(1:360,:); B = PerChange_Mrro(361:end,:);
PerChange_Mrro = [B;A]; clear A B
PerChange_Mrro_HR = interp2(lat_05deg,lon_05deg,PerChange_Mrro,lat_HR,lon_HR);
clear lat_05deg lon_05deg PerChange_Mrro
%% Runoff ssp370 Data
load LandInfo_05deg
Runoff_Path_Data = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_Ensemble_Land_Var_Mrro.mat';
load(Runoff_Path_Data);
Mrro = nanmean(Ensemble_Land_Var_Mrro(:,:,56:85),3); Mrro(Mrro<0)=nan; %mean mrro over 2070-2099
clear Ensemble_Land_Var_Mrro elevation_05deg landmask_05deg Runoff_Path_Data
Mrro_HR = interp2(lat_05deg,lon_05deg,Mrro,lat_HR,lon_HR);
clear lat_05deg lon_05deg Mrro
%% LAI ssp370 Data
load LandInfo_05deg
LAI_Path_Data = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Veg\ScenarioMIP_ssp370\Veg_Var_ssp370_Ensemble_Veg_Var_LAI.mat';
load(LAI_Path_Data);
LAI = nanmean(Ensemble_Veg_Var_LAI(:,:,56:85),3); LAI(LAI<0)=nan; %mean mrro over 2070-2099
clear Ensemble_Veg_Var_LAI elevation_05deg landmask_05deg LAI_Path_Data
LAI_HR = interp2(lat_05deg,lon_05deg,LAI,lat_HR,lon_HR);
clear lat_05deg lon_05deg LAI
%% Total Population ssp370 Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Total\Mat\ssp3_2100.mat';
load(Population_Path_Data);clear Population_Path_Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Total\Mat\lat.mat';
load(Population_Path_Data);clear Population_Path_Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Total\Mat\lon.mat';
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
%% Rural Population ssp370 Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Rural\Mat\ssp3rur2100.mat';
load(Population_Path_Data);clear Population_Path_Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Rural\Mat\lat.mat';
load(Population_Path_Data);clear Population_Path_Data
Population_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Rural\Mat\lon.mat';
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
%% CroplandRatio Data
% CroplandRatio_Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\CroplandRatio.mat';
% load(CroplandRatio_Path_Data);
% CroplandRatio_HR = interp2(lat',lon',CroplandRatio',lat_HR,lon_HR);
% clear lat lon CroplandRatio CroplandRatio_Path_Data
%% Livestock
% % Cattle
% Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Cattle_HR.mat';
% load(Path_Data);Cattle_HR = double(Cattle_HR);
% clear lat lon Path_Data
% % Chickens
% Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Chickens_HR.mat';
% load(Path_Data);Chickens_HR = double(Chickens_HR);
% clear lat lon Path_Data
% % Ducks
% Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Ducks_HR.mat';
% load(Path_Data);Ducks_HR = double(Ducks_HR);
% clear lat lon Path_Data
% % Goats
% Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Goats_HR.mat';
% load(Path_Data);Goats_HR = double(Goats_HR);
% clear lat lon Path_Data
% % Pigs
% Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Pigs_HR.mat';
% load(Path_Data);Pigs_HR = double(Pigs_HR);
% clear lat lon Path_Data
% % Sheep
% Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Sheep_HR.mat';
% load(Path_Data);Sheep_HR = double(Sheep_HR);
% clear lat lon Path_Data
% % Sum all different types of livestock
% LiveStock_HR = Cattle_HR + Chickens_HR + Ducks_HR + Goats_HR + Pigs_HR + Sheep_HR;
% clear Cattle_HR Chickens_HR Ducks_HR Goats_HR Pigs_HR Sheep_HR

%% (6.2) Extract The Tibet Plateau outflow area
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
DEM_HR(1:3360,:) = [];
% CroplandRatio_HR(1:3360,:) = [];
% LiveStock_HR(1:3360,:) = [];
Mrro_HR(1:3360,:) = [];
LAI_HR(1:3360,:) = [];
PerChange_Mrro_HR(1:3360,:) = [];
Nematodes_HR(1:3360,:) = [];
EcosystemSensitivity_HR(1:3360,:) = [];
% SoilMicroBiomass_HR(1:3360,:) = [];
Total_Population_HR(1:3360,:) = [];
Ratio_Rural_Population_HR(1:3360,:) = [];
% Interpolate the High Resoluition Image to Low Resolution
% Extent: -60~60 , 0~360; Resolution: 0.05 deg.
lat_con = -60 : 0.05 : 88; lon_con = 0:0.05:360;
[lon,lat] = meshgrid(lon_con,lat_con);clear lat_con lon_con;
DEM = interp2(lat_HR',lon_HR',DEM_HR',lat,lon);
% CroplandRatio = interp2(lat_HR',lon_HR',CroplandRatio_HR',lat,lon);
% LiveStock = interp2(lat_HR',lon_HR',LiveStock_HR',lat,lon);
Mrro = interp2(lat_HR',lon_HR',Mrro_HR',lat,lon);
PerChange_Mrro = interp2(lat_HR',lon_HR',PerChange_Mrro_HR',lat,lon);
LAI = interp2(lat_HR',lon_HR',LAI_HR',lat,lon);
Nematodes = interp2(lat_HR',lon_HR',Nematodes_HR',lat,lon);
EcosystemSensitivity = interp2(lat_HR',lon_HR',EcosystemSensitivity_HR',lat,lon);
% SoilMicroBiomass = interp2(lat_HR',lon_HR',SoilMicroBiomass_HR',lat,lon);
Total_Population = interp2(lat_HR',lon_HR',Total_Population_HR',lat,lon);
Ratio_Rural_Population = interp2(lat_HR',lon_HR',Ratio_Rural_Population_HR',lat,lon);
clear lat_HR lon_HR DEM_HR CroplandRatio_HR LiveStock_HR Mrro_HR PerChange_Mrro_HR LAI_HR
clear Nematodes_HR EcosystemSensitivity_HR Total_Population_HR Ratio_Rural_Population_HR
%% (6.2) Deriving the Hazard index (Range: [0,1])
% Fill the empty value to Mean Value
% SoilMicroBiomass(isnan(SoilMicroBiomass)) = nanmean(nanmean(SoilMicroBiomass)); %SoilMicroBiomass was not used in this study 
PerChange_Mrro(isnan(PerChange_Mrro)) = nanmean(nanmean(PerChange_Mrro));
% Calculate stressor: F_Hazard
F_Hazard = Nematodes .* PerChange_Mrro;
% Make F_Hazard > 0, and if PerChange_Mrro <0, F_Hazard will be 0, which
% means no risk increasing
F_Hazard(F_Hazard<0) = 0;
% Calculating routed F_Hazard
[Route_F_Hazard , I] = d8alg(DEM , F_Hazard);
Route_F_Hazard(isnan(F_Hazard)) = nan; clear F_Hazard I
% Normalizing Route_F_Hazard by runoff
NF = Route_F_Hazard ./ Mrro;
% Standardize NF to [0,1] based on a cumulative distribution function (CDF)
A = sort(NF(:)); A(isnan(A)) = [];
for i_row = 1 : size(NF , 1)
    disp(strcat('Calculating to row NO.' , num2str(i_row)))
    for i_col = 1 : size(NF , 2)
        if isnan(NF(i_row,i_col))
            Hazard(i_row,i_col) = nan;
            continue;
        else
            Index = find(A==NF(i_row,i_col));
            Hazard(i_row,i_col) = min(Index)./length(A);
            clear Index
        end
    end
end
clear i_row i_col A Route_F_Hazard NF
save('D:\CMIP6\VariableStorage\ImplicationResearch\Hazard_ssp370.mat','Hazard','lat','lon');
clear Nematodes Mrro PerChange_Mrro SoilMicroBiomass DEM
%% (6.3) Deriving the Exposure index (Range: [0,1])
% Calculate exposure indicator (EIn)
EIn = Total_Population./nanmax(nanmax(Total_Population)) .* LAI./nanmax(nanmax(LAI));
% Standardize EIn to [0,1] based on a cumulative distribution function (CDF)
A = sort(EIn(:)); A(isnan(A)) = [];
for i_row = 1 : size(EIn , 1)
    disp(strcat('Calculating to row NO.' , num2str(i_row)))
    for i_col = 1 : size(EIn , 2)
        if isnan(EIn(i_row,i_col))
            Exposure(i_row,i_col) = nan;
            continue;
        else
            Index = find(A==EIn(i_row,i_col));
            Exposure(i_row,i_col) = min(Index)./length(A);
            clear Index
        end
    end
end
clear i_row i_col A EIn
save('D:\CMIP6\VariableStorage\ImplicationResearch\Exposure_ssp370.mat','Exposure','lat','lon')
clear Total_Population LAI
%% (6.3) Deriving the Vulnerability Index (Range: [0,1])
% Calculate vulnerability indicator (VIn)
VIn = Ratio_Rural_Population .* EcosystemSensitivity;
% Standardize VIn to [0,1] based on a cumulative distribution function (CDF)
A = sort(VIn(:)); A(isnan(A)) = [];
for i_row = 1 : size(VIn , 1)
    disp(strcat('Calculating to row NO.' , num2str(i_row)))
    for i_col = 1 : size(VIn , 2)
        if isnan(VIn(i_row,i_col))
            Vulnerability(i_row,i_col) = nan;
            continue;
        else
            Index = find(A==VIn(i_row,i_col));
            Vulnerability(i_row,i_col) = min(Index)./length(A);
            clear Index
        end
    end
end
clear i_row i_col A VIn
save('D:\CMIP6\VariableStorage\ImplicationResearch\Vulnerability_ssp370.mat','Vulnerability','lat','lon')
clear Ratio_Rural_Population EcosystemSensitivity
%% (6.3) Deriving the Risk Index (Range: [0,1])
% The risk indicator: RIn
RIn = Hazard .* Exposure .* Vulnerability;
% Standardize RIn to [0,1] based on a cumulative distribution function (CDF)
A = sort(RIn(:)); A(isnan(A)) = [];
for i_row = 1 : size(RIn , 1)
    disp(strcat('Calculating to row NO.' , num2str(i_row)))
    for i_col = 1 : size(RIn , 2)
        if isnan(RIn(i_row,i_col))
            Risk(i_row,i_col) = nan;
            continue;
        else
            Index = find(A==RIn(i_row,i_col));
            Risk(i_row,i_col) = min(Index)./length(A);
            clear Index
        end
    end
end
clear i_row i_col A RIn
save('D:\CMIP6\VariableStorage\ImplicationResearch\Risk_ssp370.mat','Risk','lat','lon')
%% Output Figure
% Change from 0~360 to -180~180
A = Hazard(:,1:3601); B = Hazard(:,3602:end);
Hazard = [B,A]; clear A B
A = Exposure(:,1:3601); B = Exposure(:,3602:end);
Exposure = [B,A]; clear A B
A = Vulnerability(:,1:3601); B = Vulnerability(:,3602:end);
Vulnerability = [B,A]; clear A B
A = Risk(:,1:3601); B = Risk(:,3602:end);
Risk = [B,A]; clear A B
% Interpolate the seam
Hazard(:,3585:3616) = ones(2961,32) .* ...
    Hazard(:,3583);
Exposure(:,3599:3602) = ones(2961,4) .* ...
    Exposure(:,3603);
Vulnerability(:,3599:3602) = ones(2961,4) .* ...
    nanmean(Vulnerability(:,[3598,3603]),2);
Risk(:,3585:3616) = ones(2961,32) .* ...
    Risk(:,3583);
% output tiff extent -180~180
extent = [-180 , 180 , -60 , 88];
% Risk Layer
Risk(isnan(Risk)) = -1;
SaveData2GeoTIFF(['Fig3_OutputTable\Risk_370.tif' ],...
    extent , Risk);
% Hazard Layer
Hazard(isnan(Hazard)) = -1;
SaveData2GeoTIFF(['Fig3_OutputTable\Hazard_370.tif' ],...
    extent , Hazard);
% Exposure Layer
Exposure(isnan(Exposure)) = -1;
SaveData2GeoTIFF(['Fig3_OutputTable\Exposure_370.tif' ],...
    extent , Exposure);
% Vulnerability Layer
Vulnerability(isnan(Vulnerability)) = -1;
SaveData2GeoTIFF(['Fig3_OutputTable\Vulnerability_370.tif' ],...
    extent , Vulnerability);
