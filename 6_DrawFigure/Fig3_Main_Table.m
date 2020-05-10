%% Figure 3 supplement Material
clc; clear all; close all;
% Path of Watershed-Country Shapefile
Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData_outTibet_Country.shp';
%% (1) Livestock
try
    % Cattle
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Cattle_HR.mat';
    load(Path_Data);
    Cattle = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Cattle_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Cattle' , 'Quantity' , 'N3:N44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Cattle'./nansum(nansum(Cattle_HR)).*100 , 'Percentage' , 'N3:N44');
    clear Cattle Path_Data lat lon Cattle_HR
    % Chickens
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Chickens_HR.mat';
    load(Path_Data);
    Chickens = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Chickens_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Chickens' , 'Quantity' , 'O3:O44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Chickens'./nansum(nansum(Chickens_HR)).*100 , 'Percentage' , 'O3:O44');
    clear Chickens Path_Data lat lon Chickens_HR
    % Ducks
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Ducks_HR.mat';
    load(Path_Data);
    Ducks = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Ducks_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Ducks' , 'Quantity' , 'P3:P44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Ducks'./nansum(nansum(Ducks_HR)).*100 , 'Percentage' , 'P3:P44');
    clear Ducks Path_Data lat lon Ducks_HR
    % Goats
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Goats_HR.mat';
    load(Path_Data);
    Goats = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Goats_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Goats' , 'Quantity' , 'Q3:Q44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Goats'./nansum(nansum(Goats_HR)).*100 , 'Percentage' , 'Q3:Q44');
    clear Goats Path_Data lat lon Goats_HR
    % Pigs
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Pigs_HR.mat';
    load(Path_Data);
    Pigs = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Pigs_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Pigs' , 'Quantity' , 'R3:R44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Pigs'./nansum(nansum(Pigs_HR)).*100 , 'Percentage' , 'R3:R44');
    clear Pigs Path_Data lat lon Pigs_HR
    % Sheep
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Sheep_HR.mat';
    load(Path_Data);
    Sheep = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Sheep_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Sheep' , 'Quantity' , 'S3:S44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Sheep'./nansum(nansum(Sheep_HR)).*100 , 'Percentage' , 'S3:S44');
    clear Sheep Path_Data lat lon Sheep_HR
catch
    disp('Error in (1)!');
end
%% (2) Crop
try
    % Cotton
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Cotton.mat';
    load(Path_Data);
    cotton = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Cotton);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , cotton' , 'Quantity' , 'T3:T44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , cotton'./nansum(nansum(Cotton)).*100 , 'Percentage' , 'T3:T44');
    clear cotton Path_Data lat lon Cotton
    % Maize
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Maize.mat';
    load(Path_Data);
    maize = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Maize);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , maize' , 'Quantity' , 'U3:U44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , maize'./nansum(nansum(Maize)).*100 , 'Percentage' , 'U3:U44');
    clear maize Path_Data lat lon Maize
    % Rice
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Rice.mat';
    load(Path_Data);
    rice = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Rice);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , rice' , 'Quantity' , 'V3:V44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , rice'./nansum(nansum(Rice)).*100 , 'Percentage' , 'V3:V44');
    clear rice Path_Data lat lon Rice
    % Rubber
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Rubber.mat';
    load(Path_Data);
    rubber = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Rubber);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , rubber' , 'Quantity' , 'W3:W44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , rubber'./nansum(nansum(Rubber)).*100 , 'Percentage' , 'W3:W44');
    clear rubber Path_Data lat lon Rubber
    % Soybean
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Soybean.mat';
    load(Path_Data);
    soybean = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Soybean);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , soybean' , 'Quantity' , 'X3:X44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , soybean'./nansum(nansum(Soybean)).*100 , 'Percentage' , 'X3:X44');
    clear soybean Path_Data lat lon Soybean
    % Sugarcane
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Sugarcane.mat';
    load(Path_Data);
    sugarcane = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Sugarcane);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , sugarcane' , 'Quantity' , 'Y3:Y44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , sugarcane'./nansum(nansum(Sugarcane)).*100 , 'Percentage' , 'Y3:Y44');
    clear sugarcane Path_Data lat lon Sugarcane
    % Wheat
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Wheat.mat';
    load(Path_Data);
    wheat = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Wheat);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , wheat' , 'Quantity' , 'Z3:Z44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , wheat'./nansum(nansum(Wheat)).*100 , 'Percentage' , 'Z3:Z44');
    clear wheat Path_Data lat lon Wheat
catch
    disp('Error in (2)!');
end
%% (3) Population (Total includes both urban and rural population)
try
    % ssp126
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\lat.mat';
    load(Path_Data);
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\lon.mat';
    load(Path_Data);
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\ssp1_2100.mat';
    load(Path_Data);
    population = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Population);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , population' , 'Quantity' , 'J3:J44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , population'./nansum(nansum(Population)).*100 , 'Percentage' , 'J3:J44');
    clear population Path_Data Population
    % ssp245
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP2\Total\Mat\ssp2_2100.mat';
    load(Path_Data);
    population = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Population);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , population' , 'Quantity' , 'K3:K44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , population'./nansum(nansum(Population)).*100 , 'Percentage' , 'K3:K44');
    clear population Path_Data Population
    % ssp370
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Total\Mat\ssp3_2100.mat';
    load(Path_Data);
    population = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Population);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , population' , 'Quantity' , 'L3:L44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , population'./nansum(nansum(Population)).*100 , 'Percentage' , 'L3:L44');
    clear population Path_Data Population
    % ssp585
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Total\Mat\ssp5_2100.mat';
    load(Path_Data);
    population = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Population);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , population' , 'Quantity' , 'M3:M44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , population'./nansum(nansum(Population)).*100 , 'Percentage' , 'M3:M44');
    clear lat lon population Path_Data Population
catch
    disp('Error in (3)!');
end
%% (4) Runoff
try
    % ssp126
    load LandInfo_05deg
    Path_Data = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp126.mat';
    load(Path_Data);
    Mrro = nanmean(PerChange.PerChange_mrro,3);
    % Adjust to uniform Coordinate
    A = Mrro(1:360,:); B = Mrro(361:end,:);
    Mrro = [B;A]; clear A B
    mrro = Fig3_InfoExtractMean(Path_Shapefile , lat_05deg , lon_05deg , Mrro);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , mrro' , 'Quantity' , 'F3:F44');
    clear mrro Path_Data Mrro PerChange elevation_05deg landmask_05deg
    % ssp245
    Path_Data = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp245.mat';
    load(Path_Data);
    Mrro = nanmean(PerChange.PerChange_mrro,3);
    % Adjust to uniform Coordinate
    A = Mrro(1:360,:); B = Mrro(361:end,:);
    Mrro = [B;A]; clear A B
    mrro = Fig3_InfoExtractMean(Path_Shapefile , lat_05deg , lon_05deg , Mrro);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , mrro' , 'Quantity' , 'G3:G44');
    clear mrro Path_Data Mrro PerChange elevation_05deg landmask_05deg
    % ssp370
    Path_Data = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp370.mat';
    load(Path_Data);
    Mrro = nanmean(PerChange.PerChange_mrro,3);
    % Adjust to uniform Coordinate
    A = Mrro(1:360,:); B = Mrro(361:end,:);
    Mrro = [B;A]; clear A B
    mrro = Fig3_InfoExtractMean(Path_Shapefile , lat_05deg , lon_05deg , Mrro);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , mrro' , 'Quantity' , 'H3:H44');
    clear mrro Path_Data Mrro PerChange elevation_05deg landmask_05deg
    % ssp585
    Path_Data = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp585.mat';
    load(Path_Data);
    Mrro = nanmean(PerChange.PerChange_mrro,3);
    % Adjust to uniform Coordinate
    A = Mrro(1:360,:); B = Mrro(361:end,:);
    Mrro = [B;A]; clear A B
    mrro = Fig3_InfoExtractMean(Path_Shapefile , lat_05deg , lon_05deg , Mrro);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , mrro' , 'Quantity' , 'I3:I44');
    clear lat_05deg lon_05deg mrro Path_Data Mrro PerChange elevation_05deg landmask_05deg
catch
    disp('Error in (4)!');
end
%% (5) BioMass
try
    % (5.1) Nematodes
    clc; clear all; close all;
    % Nematodes Data
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\Nematodes_HR.mat';
    load(Path_Data);
    % Path of Tibet Shapefile
    Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData_inTibet.shp';
    % Density of Nematodes in Tibet Plateau
    Tibet_Nematodes = Fig3_InfoExtractTibetMean(Path_Shapefile , lat , lon , Nematodes_HR);
    
    % Path of Watershed-Country Shapefile
    Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData_outTibet_Country.shp';
    % Density of Nematodes in downstream watershed
    Country_Nematodes = Fig3_InfoExtractMean(Path_Shapefile , lat , lon , Nematodes_HR);
    
    Nematodes_Gradient = Tibet_Nematodes - Country_Nematodes;
    
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Nematodes_Gradient' , 'Quantity' , 'E3:E44');
    clear Tibet_Nematodes Country_Nematodes Nematodes_Gradient
    clear Nematodes_HR Path_Data lat lon
    
    % (5.2) SoilMicroBiomass
    clc; clear all; close all;
    % SoilMicroBiomass Data
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\SoilMicroBiomass.mat';
    load(Path_Data);
    % Path of Tibet Shapefile
    Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData_inTibet.shp';
    % Density of SoilMicroBiomass in Tibet Plateau
    Tibet_SoilMicroBiomass = Fig3_InfoExtractTibetMean(Path_Shapefile , lat , lon , SoilMicroBiomass);
    
    % Path of Watershed-Country Shapefile
    Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData_outTibet_Country.shp';
    % Density of SoilMicroBiomass in downstream watershed
    Country_SoilMicroBiomass = Fig3_InfoExtractMean(Path_Shapefile , lat , lon , SoilMicroBiomass);
    
    SoilMicroBiomass_Gradient = Tibet_SoilMicroBiomass - Country_SoilMicroBiomass;
    
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , SoilMicroBiomass_Gradient' , 'Quantity' , 'D3:D44');
    clear Tibet_SoilMicroBiomass Country_SoilMicroBiomass SoilMicroBiomass_Gradient
    clear SoilMicroBiomass Path_Data lat lon
catch
    disp('Error in (5)!');
end
%% (6) Mean Risk Index
try
    clc; clear all; close all;
    %% Hazard Index Data, Extent: -88~88 0~360
    Hazard_Path_Data = 'D:\CMIP6\VariableStorage\ImplicationResearch\Hazard.mat';
    load(Hazard_Path_Data);clear Hazard_Path_Data;
    % Path of Asian Water Tower different watersheds Shapefile
    Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData.shp';
    Mean_Hazard_Index = Fig3_InfoExtractTibetMean(Path_Shapefile , lat , lon , Hazard);
    % Save Results to Table
    Index = [1,6,9,15,18,21,24,30,33,36,40,41,42];
    Pos = {'C3','C4','C5','C6','C7','C8','C9','C10','C11','C12','C13','C14','C15'};
    for ii = 1:length(Index)
        xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] ,...
            Mean_Hazard_Index(Index(ii))' ,...
            'Fig3' , Pos{ii});
    end
    clear ii Pos Index Path_Shapefile
    %% Exposure Index Data, Extent: -88~88 0~360
    Exposure_Path_Data = 'D:\CMIP6\VariableStorage\ImplicationResearch\Exposure.mat';
    load(Exposure_Path_Data);clear Exposure_Path_Data;
    % Path of Asian Water Tower different watersheds Shapefile
    Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData.shp';
    Mean_Exposure_Index = Fig3_InfoExtractTibetMean(Path_Shapefile , lat , lon , Exposure);
    % Save Results to Table
    Index = [1,6,9,15,18,21,24,30,33,36,40,41,42];
    Pos = {'D3','D4','D5','D6','D7','D8','D9','D10','D11','D12','D13','D14','D15'};
    for ii = 1:length(Index)
        xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] ,...
            Mean_Exposure_Index(Index(ii))' ,...
            'Fig3' , Pos{ii});
    end
    clear ii Pos Index Path_Shapefile
    %% Mean_Vulnerability_Index £º Ratio_Rural_Population Data, Extent: -88~88 0~360
    Ratio_Rural_Population_Path_Data = 'D:\CMIP6\VariableStorage\ImplicationResearch\Ratio_Rural_Population.mat';
    load(Ratio_Rural_Population_Path_Data);clear Ratio_Rural_Population_Path_Data;
    % Path of Asian Water Tower different watersheds Shapefile
    Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData.shp';
    Mean_Vulnerability_Index = Fig3_InfoExtractTibetMean(Path_Shapefile , lat , lon , Ratio_Rural_Population);
    % Save Results to Table
    Index = [1,6,9,15,18,21,24,30,33,36,40,41,42];
    Pos = {'E3','E4','E5','E6','E7','E8','E9','E10','E11','E12','E13','E14','E15'};
    for ii = 1:length(Index)
        xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] ,...
            Mean_Vulnerability_Index(Index(ii))' ,...
            'Fig3' , Pos{ii});
    end
    clear ii Pos Index Path_Shapefile
    %% Calculating Risk
    Risk = Hazard .* Exposure .* Ratio_Rural_Population;
    % Mean Risk Index
    Mean_Risk_Index = Fig3_InfoExtractTibetMean(Path_Shapefile , lat , lon , Risk);
    % Save Results to Table
    Index = [1,6,9,15,18,21,24,30,33,36,40,41,42];
    Pos = {'C3','C8','C11','C17','C20','C23','C26','C32','C35','C38','C42','C43','C44'};
    for ii = 1:length(Index)
        xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] ,...
            Mean_Risk_Index(Index(ii))' ,...
            'Quantity' , Pos{ii});
    end
    clear ii Pos Index Path_Shapefile
catch
    disp('Error in (6)!');
end
