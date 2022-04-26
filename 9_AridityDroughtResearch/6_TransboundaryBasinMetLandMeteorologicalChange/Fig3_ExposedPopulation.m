%% £¨1£© Calculating Time Series of Population exposed to Compound Drought
clc; clear all; close all;
%% £¨1.1£© Read the boundary file
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\GlobalBasin.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary
%% £¨1.2£© Setting the input/output paths
% CMIP6 Historical Met Data
InputMetDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\Met_Land_Historical_';
InputPopulationPath{1} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\ssp1_2010.mat';
% CMIP6 ScenarioMIP ssp126 Data
InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\Met_Land_ssp126_';
InputPopulationPath{2} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\';
% CMIP6 ScenarioMIP ssp245 Data
InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_';
InputPopulationPath{3} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP2\Total\Mat\';
% CMIP6 ScenarioMIP ssp370 Data
InputMetDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\Met_Land_ssp370_';
InputPopulationPath{4} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Total\Mat\';
% CMIP6 ScenarioMIP ssp585 Data
InputMetDroughtPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\Met_Land_ssp585_';
InputPopulationPath{5} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Total\Mat\';

% Extract GlobalTransboundary
% Coordinate information of CMIP6 output
load LandInfo_05deg.mat
Lon_05deg(1:360,:) = lon_05deg(361:end,:) - 360; Lon_05deg(361:720,:) = lon_05deg(1:360,:); % Adjust longitude from 0-360 to -180-180
in = inpolygon(lat_05deg , Lon_05deg , GlobalTransboundary.Y , GlobalTransboundary.X); clear lon_05deg;
% Coordinate information of population data
load('D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\lat.mat');
load('D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\lon.mat');
in_HR = inpolygon(lat , lon , GlobalTransboundary.Y , GlobalTransboundary.X);
save in_HR in_HR

%% £¨1.3£© Calculating Population exposed to Compound Drought for each year
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
    if i_Path == 1
        load(InputPopulationPath{i_Path});
    end
    for i_GCM = 1 : length(GCM_Ensemble)
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputMetDroughtPath{i_Path} , GCM , '_DroughtFrequency_Year.mat'));
        for i_Year = 1 : size(DroughtFrequency_Year.CompoundDrought,3)
            % Read Drought Data
            AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            BB_HR = interp2(lat_05deg,Lon_05deg,BB,lat,lon); % interpolate to the resolution of population
            CC = BB_HR >= 1; clear BB BB_HR; % CC indicates compound drought happens
            % Read Population Data
            if i_Path > 1
                if i_Path==5
                    AA = num2str(i_Path);
                else
                    AA = num2str(i_Path-1);
                end
                if i_Year == 1
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2010.mat'));
                elseif i_Year == 6
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2020.mat'));
                elseif i_Year == 16
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2030.mat'));
                elseif i_Year == 26
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2040.mat'));
                elseif i_Year == 36
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2050.mat'));
                elseif i_Year == 46
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2060.mat'));
                elseif i_Year == 56
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2070.mat'));
                elseif i_Year == 66
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2080.mat'));
                elseif i_Year == 76
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2090.mat'));
                elseif i_Year == 86
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2100.mat'));
                end
                clear AA
            end
            % Met_Drought_Population_Year : the number of people experiencing compound drought per year
            Met_Drought_Population_Year(i_Path).Population_Year.CompoundDrought(i_GCM,i_Year) = nansum(Population(CC&in_HR));
            % Met_Drought_FractionalPopulation_Year : the ratio of people experiencing compound drought for each year
            Met_Drought_FractionalPopulation_Year(i_Path).FractionalPopulation_Year.CompoundDrought(i_GCM,i_Year) = nansum(Population(CC&in_HR))./nansum(Population(in_HR)) .* 100;
            clear CC
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM GCM_Ensemble Population
end
save('Population','Met_Drought_FractionalPopulation_Year','Met_Drought_Population_Year');

clc; clear all; close all;
load Population
Fig3_ExposedPopulation_Timeseries(Met_Drought_Population_Year , Met_Drought_FractionalPopulation_Year)


%% £¨2£© Calculating the spatial distribution of historicl and future Population
clc; clear all; close all;
%% £¨2.1£© Setting the input/output paths
% CMIP6 Historical Met Data
InputMetDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\Met_Land_Historical_';
InputPopulationPath{1} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\ssp1_2010.mat';
% CMIP6 ScenarioMIP ssp126 Data
InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\Met_Land_ssp126_';
InputPopulationPath{2} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\';
% CMIP6 ScenarioMIP ssp245 Data
InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_';
InputPopulationPath{3} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP2\Total\Mat\';
% CMIP6 ScenarioMIP ssp370 Data
InputMetDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\Met_Land_ssp370_';
InputPopulationPath{4} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP3\Total\Mat\';
% CMIP6 ScenarioMIP ssp585 Data
InputMetDroughtPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\Met_Land_ssp585_';
InputPopulationPath{5} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Total\Mat\';
% Coordinate information of population data
load('D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\lat.mat');
load('D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\lon.mat');

%% £¨2.2£© Spatial Distribution of Total Population
% Historical
load(strcat(InputPopulationPath{1})); AA = Population; Population_Historical = Population;
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AA(isnan(AA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\historical_Population2010'] , extent , flipud(AA'));
clear AA Population

% ssp126
load(strcat(InputPopulationPath{2} , 'ssp1_2060.mat')); FuturePopulation(:,:,1) = Population; clear Population;
load(strcat(InputPopulationPath{2} , 'ssp1_2070.mat')); FuturePopulation(:,:,2) = Population; clear Population;
load(strcat(InputPopulationPath{2} , 'ssp1_2080.mat')); FuturePopulation(:,:,3) = Population; clear Population;
load(strcat(InputPopulationPath{2} , 'ssp1_2090.mat')); FuturePopulation(:,:,4) = Population; clear Population;
load(strcat(InputPopulationPath{2} , 'ssp1_2100.mat')); FuturePopulation(:,:,5) = Population; clear Population;
% mean over 2051-2100, Unit: persons per km2
AA = nanmean(FuturePopulation , 3); Population_ssp126 = nanmean(FuturePopulation , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AA(isnan(AA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp126_PopulationMeanOver2051-2100'] , extent , flipud(AA'));
clear AA FuturePopulation

% ssp245
load(strcat(InputPopulationPath{3} , 'ssp2_2060.mat')); FuturePopulation(:,:,1) = Population; clear Population;
load(strcat(InputPopulationPath{3} , 'ssp2_2070.mat')); FuturePopulation(:,:,2) = Population; clear Population;
load(strcat(InputPopulationPath{3} , 'ssp2_2080.mat')); FuturePopulation(:,:,3) = Population; clear Population;
load(strcat(InputPopulationPath{3} , 'ssp2_2090.mat')); FuturePopulation(:,:,4) = Population; clear Population;
load(strcat(InputPopulationPath{3} , 'ssp2_2100.mat')); FuturePopulation(:,:,5) = Population; clear Population;
% mean over 2051-2100, Unit: persons per km2
AA = nanmean(FuturePopulation , 3); Population_ssp245 = nanmean(FuturePopulation , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AA(isnan(AA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp245_PopulationMeanOver2051-2100'] , extent , flipud(AA'));
clear AA FuturePopulation

% ssp370
load(strcat(InputPopulationPath{4} , 'ssp3_2060.mat')); FuturePopulation(:,:,1) = Population; clear Population;
load(strcat(InputPopulationPath{4} , 'ssp3_2070.mat')); FuturePopulation(:,:,2) = Population; clear Population;
load(strcat(InputPopulationPath{4} , 'ssp3_2080.mat')); FuturePopulation(:,:,3) = Population; clear Population;
load(strcat(InputPopulationPath{4} , 'ssp3_2090.mat')); FuturePopulation(:,:,4) = Population; clear Population;
load(strcat(InputPopulationPath{4} , 'ssp3_2100.mat')); FuturePopulation(:,:,5) = Population; clear Population;
% mean over 2051-2100, Unit: persons per km2
AA = nanmean(FuturePopulation , 3); Population_ssp370 = nanmean(FuturePopulation , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AA(isnan(AA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp370_PopulationMeanOver2051-2100'] , extent , flipud(AA'));
clear AA FuturePopulation

% ssp585
load(strcat(InputPopulationPath{5} , 'ssp5_2060.mat')); FuturePopulation(:,:,1) = Population; clear Population;
load(strcat(InputPopulationPath{5} , 'ssp5_2070.mat')); FuturePopulation(:,:,2) = Population; clear Population;
load(strcat(InputPopulationPath{5} , 'ssp5_2080.mat')); FuturePopulation(:,:,3) = Population; clear Population;
load(strcat(InputPopulationPath{5} , 'ssp5_2090.mat')); FuturePopulation(:,:,4) = Population; clear Population;
load(strcat(InputPopulationPath{5} , 'ssp5_2100.mat')); FuturePopulation(:,:,5) = Population; clear Population;
% mean over 2051-2100, Unit: persons per km2
AA = nanmean(FuturePopulation , 3); Population_ssp585 = nanmean(FuturePopulation , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AA(isnan(AA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp585_PopulationMeanOver2051-2100'] , extent , flipud(AA'));
clear AA FuturePopulation

%% £¨2.3£© Counting population for different basins
% Read the TWAP Boundary file
Path_GlobalTransboundary = 'G:\TransboundaryRivers\TWAP\river_basins\river_basins.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat , lon , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_Historical_Population(i_basin,1) = nansum(Population_Historical(in));
    Basin_ssp126_Population(i_basin,1) = nansum(Population_ssp126(in));
    Basin_ssp245_Population(i_basin,1) = nansum(Population_ssp245(in));
    Basin_ssp370_Population(i_basin,1) = nansum(Population_ssp370(in));
    Basin_ssp585_Population(i_basin,1) = nansum(Population_ssp585(in));
    clear in
end
clear i_basin

xlswrite(['Basins_TWAP.xlsx'] , Basin_Historical_Population , 'Sheet1' , 'V3:V288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp126_Population , 'Sheet1' , 'W3:W288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp245_Population , 'Sheet1' , 'X3:X288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp370_Population , 'Sheet1' , 'Y3:Y288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp585_Population , 'Sheet1' , 'Z3:Z288');

clear GlobalTransboundary Basin_Historical_Population Basin_ssp126_Population
clear Basin_ssp245_Population  Basin_ssp370_Population Basin_ssp585_Population

% Read the Munia Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\Basin.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat , lon , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_Historical_Population(i_basin,1) = nansum(Population_Historical(in));
    Basin_ssp126_Population(i_basin,1) = nansum(Population_ssp126(in));
    Basin_ssp245_Population(i_basin,1) = nansum(Population_ssp245(in));
    Basin_ssp370_Population(i_basin,1) = nansum(Population_ssp370(in));
    Basin_ssp585_Population(i_basin,1) = nansum(Population_ssp585(in));
    clear in
end
clear i_basin

xlswrite(['Basins_Munia.xlsx'] , Basin_Historical_Population , 'Sheet1' , 'M3:M170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp126_Population , 'Sheet1' , 'N3:N170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp245_Population , 'Sheet1' , 'O3:O170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp370_Population , 'Sheet1' , 'P3:P170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp585_Population , 'Sheet1' , 'Q3:Q170');

clear GlobalTransboundary Basin_Historical_Population Basin_ssp126_Population
clear Basin_ssp245_Population  Basin_ssp370_Population Basin_ssp585_Population
clear Population_Historical Population_ssp126 Population_ssp245
clear Population_ssp370 Population_ssp585

%% £¨3£© Calculating population exposed to Compound Drought
% Coordinate information of CMIP6 outputs
load LandInfo_05deg.mat
Lon_05deg(1:360,:) = lon_05deg(361:end,:) - 360; Lon_05deg(361:720,:) = lon_05deg(1:360,:); clear lon_05deg % Adjust longitude from 0-360 to -180-180

% historical 1951-2000
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
for i_GCM = 1 : length(GCM_Ensemble)
    GCM = GCM_Ensemble{i_GCM};
    load(strcat(InputMetDroughtPath{1} , GCM , '_DroughtFrequency_Year.mat'));
    for i_Year = 102 : 151 % 1951-2000
        % Read Drought Data
        AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
        BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
        BB_HR = interp2(lat_05deg,Lon_05deg,BB,lat,lon); % interpolate to the resolution of population
        CC = BB_HR >= 1; clear BB BB_HR; % CC indicates compound drought happens
        % Read Population Data
        load(InputPopulationPath{1});
        Met_Drought_Population_Year(1).Population_Year.CompoundDrought(:,:,i_Year-101,i_GCM) = Population.*double(CC);
        clear CC
    end
    clear GCM i_Year DroughtFrequency_Year
end
clear i_GCM GCM_Ensemble Population

%% (3.1) Output tiff figure
% mean over different GCMs
AA = nanmean(Met_Drought_Population_Year(1).Population_Year.CompoundDrought , 4);
% mean over 2051-2100, Unit: persons per km2 per year exposed to Compound Drought
AAA = nanmean(AA , 3); ExposedPopulation_Historical = nanmean(AA , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\historical_PopulationExposurePerYear(over1951-2000)'] , extent , flipud(AAA'));
clear AA AAA

% ssp
for i_Path = 2 : length(InputMetDroughtPath)
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
        for i_Year = 37 : size(DroughtFrequency_Year.CompoundDrought,3) % 2051-2100
            % Read Drought Data
            AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            BB_HR = interp2(lat_05deg,Lon_05deg,BB,lat,lon); % interpolate to the resolution of population
            CC = BB_HR >= 1; clear BB BB_HR; % CC indicates compound drought happens
            % Read Population Data
            if i_Path > 1
                if i_Path==5
                    AA = num2str(i_Path);
                else
                    AA = num2str(i_Path-1);
                end
                if i_Year >= 36 && i_Year < 46
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2050.mat'));
                elseif i_Year >= 46 && i_Year < 56
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2060.mat'));
                elseif i_Year >= 56 && i_Year < 66
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2070.mat'));
                elseif i_Year >= 66 && i_Year < 76
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2080.mat'));
                elseif i_Year >= 76 && i_Year < 86
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2090.mat'));
                elseif i_Year == 86
                    load(strcat(InputPopulationPath{i_Path},'ssp',AA,'_2100.mat'));
                end
                clear AA
            end
            Met_Drought_Population_Year(i_Path).Population_Year.CompoundDrought(:,:,i_Year-36,i_GCM) = Population.*double(CC);
            clear CC
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM GCM_Ensemble Population
end
clear i_Path
% Output ssp126 tiff figure
% mean over different GCMs
AA = nanmean(Met_Drought_Population_Year(2).Population_Year.CompoundDrought , 4);
% mean over 2051-2100, Unit: persons per km2 per year exposed to Compound Drought
AAA = nanmean(AA , 3);  ExposedPopulation_ssp126 = nanmean(AA , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp126_PopulationExposurePerYear(over2051-2100)'] , extent , flipud(AAA'));
clear AA AAA
% Output ssp245 tiff figure
% mean over different GCMs
AA = nanmean(Met_Drought_Population_Year(3).Population_Year.CompoundDrought , 4);
% mean over 2051-2100, Unit: persons per km2 per year exposed to Compound Drought
AAA = nanmean(AA , 3); ExposedPopulation_ssp245 = nanmean(AA , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp245_PopulationExposurePerYear(over2051-2100)'] , extent , flipud(AAA'));
clear AA AAA
% Output ssp370 tiff figure
% mean over different GCMs
AA = nanmean(Met_Drought_Population_Year(4).Population_Year.CompoundDrought , 4);
% mean over 2051-2100, Unit: persons per km2 per year exposed to Compound Drought
AAA = nanmean(AA , 3); ExposedPopulation_ssp370 = nanmean(AA , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp370_PopulationExposurePerYear(over2051-2100)'] , extent , flipud(AAA'));
clear AA AAA
% Output ssp585 tiff figure
% mean over different GCMs
AA = nanmean(Met_Drought_Population_Year(5).Population_Year.CompoundDrought , 4);
% mean over 2051-2100, Unit: persons per km2 per year exposed to Compound Drought
AAA = nanmean(AA , 3); ExposedPopulation_ssp585 = nanmean(AA , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp585_PopulationExposurePerYear(over2051-2100)'] , extent , flipud(AAA'));
clear AA AAA

%% £¨3.2£© Read the boundary file
% TWAP Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\TWAP\river_basins\river_basins.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat , lon , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_Historical_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_Historical(in));
    Basin_ssp126_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp126(in));
    Basin_ssp245_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp245(in));
    Basin_ssp370_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp370(in));
    Basin_ssp585_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp585(in));
    clear in
end
clear i_basin

xlswrite(['Basins_TWAP.xlsx'] , Basin_Historical_ExposedPopulation , 'Sheet1' , 'AA3:AA288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp126_ExposedPopulation , 'Sheet1' , 'AB3:AB288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp245_ExposedPopulation , 'Sheet1' , 'AC3:AC288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp370_ExposedPopulation , 'Sheet1' , 'AD3:AD288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp585_ExposedPopulation , 'Sheet1' , 'AE3:AE288');

clear GlobalTransboundary Basin_Historical_ExposedPopulation Basin_ssp126_ExposedPopulation
clear Basin_ssp245_ExposedPopulation  Basin_ssp370_ExposedPopulation Basin_ssp585_ExposedPopulation

% Munia Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\Basin.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat , lon , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_Historical_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_Historical(in));
    Basin_ssp126_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp126(in));
    Basin_ssp245_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp245(in));
    Basin_ssp370_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp370(in));
    Basin_ssp585_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp585(in));
    clear in
end
clear i_basin

xlswrite(['Basins_Munia.xlsx'] , Basin_Historical_ExposedPopulation , 'Sheet1' , 'R3:R170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp126_ExposedPopulation , 'Sheet1' , 'S3:S170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp245_ExposedPopulation , 'Sheet1' , 'T3:T170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp370_ExposedPopulation , 'Sheet1' , 'U3:U170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp585_ExposedPopulation , 'Sheet1' , 'V3:V170');

clear GlobalTransboundary Basin_Historical_ExposedPopulation Basin_ssp126_ExposedPopulation
clear Basin_ssp245_ExposedPopulation  Basin_ssp370_ExposedPopulation Basin_ssp585_ExposedPopulation
clear ExposedPopulation_Historical ExposedPopulation_ssp126 ExposedPopulation_ssp245
clear ExposedPopulation_ssp370 ExposedPopulation_ssp585



