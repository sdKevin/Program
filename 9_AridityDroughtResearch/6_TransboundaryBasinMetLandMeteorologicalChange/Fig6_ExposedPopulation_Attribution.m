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
% CMIP6 ScenarioMIP ssp245 Data
InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_';
InputPopulationPath{2} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP2\Total\Mat\';
% CMIP6 hist-nat Data
InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\hist_nat\Met_Land_hist_nat_';
% CMIP6 ssp245-nat ssp245 Data
InputMetDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ssp245_nat\Met_Land_ssp245_nat_';
% CMIP6 piControl Data
InputMetDroughtPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\piControl\Met_Land_piControl_';

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
    if i_Path < 3
        % Name of Global Climate Model
        GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-MM'};
    else
        % Name of Global Climate Model
        GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};
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
            if i_Path == 1 || i_Path == 3 || i_Path == 4 || i_Path == 5
                load(InputPopulationPath{1});
            end
            if i_Path == 2
                AA = '2';
                if i_Year == 1
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2010.mat'));
                elseif i_Year == 6
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2020.mat'));
                elseif i_Year == 16
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2030.mat'));
                elseif i_Year == 26
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2040.mat'));
                elseif i_Year == 36
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2050.mat'));
                elseif i_Year == 46
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2060.mat'));
                elseif i_Year == 56
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2070.mat'));
                elseif i_Year == 66
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2080.mat'));
                elseif i_Year == 76
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2090.mat'));
                elseif i_Year == 86
                    load(strcat(InputPopulationPath{2},'ssp',AA,'_2100.mat'));
                end
                clear AA
            end
            
            % Met_Drought_Population_Year : the number of people experiencing compound drought per year
            Met_Drought_Population_Attribution_Year(i_Path).Population_Year.CompoundDrought(i_GCM,i_Year) = nansum(Population(CC&in_HR));
            % Met_Drought_FractionalPopulation_Year : the ratio of people experiencing compound drought for each year
            Met_Drought_FractionalPopulation_Attribution_Year(i_Path).FractionalPopulation_Year.CompoundDrought(i_GCM,i_Year) = nansum(Population(CC&in_HR))./nansum(Population(in_HR)) .* 100;
            clear CC
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM GCM_Ensemble Population
end

% Fix future population
for i_Path = 2
    % Name of Global Climate Model
    GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-MM'};
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
            load(InputPopulationPath{1});
            % Met_Drought_Population_Year : the number of people experiencing compound drought per year
            Met_Drought_Population_Attribution_Year(6).Population_Year.CompoundDrought(i_GCM,i_Year) = nansum(Population(CC&in_HR));
            % Met_Drought_FractionalPopulation_Year : the ratio of people experiencing compound drought for each year
            Met_Drought_FractionalPopulation_Attribution_Year(6).FractionalPopulation_Year.CompoundDrought(i_GCM,i_Year) = nansum(Population(CC&in_HR))./nansum(Population(in_HR)) .* 100;
            clear CC
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM GCM_Ensemble Population
end
save('Population_Attribution','Met_Drought_FractionalPopulation_Attribution_Year','Met_Drought_Population_Attribution_Year');

clc; clear all; close all;
load Population_Attribution
Fig6_ExposedPopulation_Timeseries_Attribution(Met_Drought_Population_Attribution_Year , Met_Drought_FractionalPopulation_Attribution_Year)

% Plot Contribution
figure
subplot(2,3,3)
Contribution = [(194-184)/(461-161)*100 , 22.4/(461-161)*100 , (461-349)/(461-161)*100 , 100-(194-184)/(461-161)*100-22.4/(461-161)*100-(461-349)/(461-161)*100];

explode = [1 1 1 0];
F1 = donut(Contribution(1,:),explode);
colormap([99,100,173;125,125,125;60,124,98;159,73,116]./255);
F1(2).Color = [99,100,173]./255; F1(4).Color = [125,125,125]./255; F1(6).Color = [60,124,98]./255; F1(8).Color = [159,73,116]./255;
legend({'','','Population growth',''},...
    'Color','None','EdgeColor','None','TextColor',[60,124,98]./255)

%% £¨2£© Calculating population exposed to Compound Drought
clc; clear all; close all;
%% £¨2.1£© Setting the input/output paths
% CMIP6 Historical Population Data
InputPopulationPath{1} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\ssp1_2010.mat';
% CMIP6 ScenarioMIP ssp245 Data
InputMetDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_';
% CMIP6 hist-nat Data
InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\hist_nat\Met_Land_hist_nat_';
% CMIP6 ssp245-nat Data
InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ssp245_nat\Met_Land_ssp245_nat_';
% CMIP6 piControl Data
InputMetDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\piControl\Met_Land_piControl_';

% Coordinate information of population data
load('D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\lat.mat');
load('D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP1\Total\Mat\lon.mat');
% Coordinate information of CMIP6 outputs
load LandInfo_05deg.mat
Lon_05deg(1:360,:) = lon_05deg(361:end,:) - 360; Lon_05deg(361:720,:) = lon_05deg(1:360,:); clear lon_05deg % Adjust longitude from 0-360 to -180-180

%% £¨2.2£© Calculating Population exposed to Compound Drought
% hist-nat 1951-2000
% Name of Global Climate Model
GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};
for i_GCM = 1 : length(GCM_Ensemble)
    GCM = GCM_Ensemble{i_GCM};
    load(strcat(InputMetDroughtPath{2} , GCM , '_DroughtFrequency_Year.mat'));
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

% Output tiff figure
% mean over different GCMs
AA = nanmean(Met_Drought_Population_Year(1).Population_Year.CompoundDrought , 4);
% mean over 2051-2100, Unit: persons per km2 per year exposed to Compound Drought
AAA = nanmean(AA , 3); ExposedPopulation_Hist_nat = nanmean(AA , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\hist_nat_PopulationExposurePerYear(over1951-2000)'] , extent , flipud(AAA'));
clear AA AAA

% ssp245-nat
% Name of Global Climate Model
GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};
for i_GCM = 1 : length(GCM_Ensemble)
    GCM = GCM_Ensemble{i_GCM};
    load(strcat(InputMetDroughtPath{3} , GCM , '_DroughtFrequency_Year.mat'));
    for i_Year = 37 : size(DroughtFrequency_Year.CompoundDrought,3) % 2051-2100
        % Read Drought Data
        AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
        BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
        BB_HR = interp2(lat_05deg,Lon_05deg,BB,lat,lon); % interpolate to the resolution of population
        CC = BB_HR >= 1; clear BB BB_HR; % CC indicates compound drought happens
        % Read Population Data
        load(InputPopulationPath{1});
        Met_Drought_Population_Year(2).Population_Year.CompoundDrought(:,:,i_Year-36,i_GCM) = Population.*double(CC);
        clear CC
    end
    clear GCM i_Year DroughtFrequency_Year
end
clear i_GCM GCM_Ensemble Population
% Output ssp245-nat tiff figure
% mean over different GCMs
AA = nanmean(Met_Drought_Population_Year(2).Population_Year.CompoundDrought , 4);
% mean over 2051-2100, Unit: persons per km2 per year exposed to Compound Drought
AAA = nanmean(AA , 3); ExposedPopulation_ssp245_nat = nanmean(AA , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp245_nat_PopulationExposurePerYear(over2051-2100)'] , extent , flipud(AAA'));
clear AA AAA

% piControl
% Name of Global Climate Model
GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};
for i_GCM = 1 : length(GCM_Ensemble)
    GCM = GCM_Ensemble{i_GCM};
    load(strcat(InputMetDroughtPath{4} , GCM , '_DroughtFrequency_Year.mat'));
    for i_Year = 1 : size(DroughtFrequency_Year.CompoundDrought,3) % All 500 years
        % Read Drought Data
        AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
        BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
        BB_HR = interp2(lat_05deg,Lon_05deg,BB,lat,lon); % interpolate to the resolution of population
        CC = BB_HR >= 1; clear BB BB_HR; % CC indicates compound drought happens
        % Read Population Data
        load(InputPopulationPath{1});
        Met_Drought_Population_Year(3).Population_Year.CompoundDrought(:,:,i_Year,i_GCM) = Population.*double(CC);
        clear CC
    end
    clear GCM i_Year DroughtFrequency_Year
end
clear i_GCM GCM_Ensemble Population
% Output piControl tiff figure
% mean over different GCMs
AA_piControl = nanmean(Met_Drought_Population_Year(3).Population_Year.CompoundDrought , 4);
% Change represents changes between each 50 year data
Change = [];
for iii = 1 : floor(size(AA_piControl,3)/50)-1
    Num = 1:50:size(AA_piControl,3);
    AA = nanmean(AA_piControl(:,:,Num(iii):Num(iii)+49) ,3);
    for ii = 1 : floor(size(AA_piControl,3)/50)-iii
        Change = cat(3 , Change , AA - nanmean(AA_piControl(:,:,Num(iii+ii):Num(iii+ii)+49) ,3));
    end
    clear AA
end
Change = abs(Change); % Since the change of every 50 year can be both positive and negative
AAA = nanmean(Change,3); ExposedPopulation_piControl_MeanChange = nanmean(Change,3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\piControl_MeanChange_PopulationExposurePerYear(over2051-2100)'] , extent , flipud(AAA'));
clear AA AAA

% Fix future population
% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
for i_GCM = 1 : length(GCM_Ensemble)
    GCM = GCM_Ensemble{i_GCM};
    load(strcat(InputMetDroughtPath{1} , GCM , '_DroughtFrequency_Year.mat'));
    for i_Year = 37 : size(DroughtFrequency_Year.CompoundDrought,3) % 2051-2100
        % Read Drought Data
        AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
        BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
        BB_HR = interp2(lat_05deg,Lon_05deg,BB,lat,lon); % interpolate to the resolution of population
        CC = BB_HR >= 1; clear BB BB_HR; % CC indicates compound drought happens
        % Read Population Data
        load(InputPopulationPath{1});
        Met_Drought_Population_Year(4).Population_Year.CompoundDrought(:,:,i_Year-36,i_GCM) = Population.*double(CC);
        clear CC
    end
    clear GCM i_Year DroughtFrequency_Year
end
clear i_GCM GCM_Ensemble Population
% Output piControl tiff figure
% mean over different GCMs
AA = nanmean(Met_Drought_Population_Year(4).Population_Year.CompoundDrought , 4);
% mean over all 2051-2100 years, Unit: persons per km2 per year exposed to Compound Drought
AAA = nanmean(AA , 3); ExposedPopulation_ssp245_fix_POP = nanmean(AA , 3);
% Output tiff figure
extent = [-179.9375 , 179.9375 , -55.8125 , 83.6875];
AAA(isnan(AAA)) = -9999;
SaveData2GeoTIFF(['ExposedPopulation\ssp245_fixPOP_PopulationExposurePerYear(over2051-2100)'] , extent , flipud(AAA'));
clear AA AAA

%% £¨3.2£© Read the boundary file
% TWAP Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\TWAP\river_basins\river_basins.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat , lon , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_Hist_nat_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_Hist_nat(in));
    Basin_ssp245_nat_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp245_nat(in));
    Basin_piControl_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_piControl_MeanChange(in));
    Basin_ssp245_fix_POP_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp245_fix_POP(in));
    clear in
end
clear i_basin

xlswrite(['Basins_TWAP.xlsx'] , Basin_Hist_nat_ExposedPopulation , 'Sheet1' , 'AN3:AN288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp245_nat_ExposedPopulation , 'Sheet1' , 'AO3:AO288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_piControl_ExposedPopulation , 'Sheet1' , 'AP3:AP288');
xlswrite(['Basins_TWAP.xlsx'] , Basin_ssp245_fix_POP_ExposedPopulation , 'Sheet1' , 'AQ3:AQ288');

clear GlobalTransboundary Basin_Hist_nat_ExposedPopulation Basin_ssp245_nat_ExposedPopulation
clear Basin_piControl_ExposedPopulation  Basin_ssp245_fix_POP_ExposedPopulation

% Munia Boundary
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\Basin.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary

for i_basin = 1 : size(GlobalTransboundary,1)
    in = inpolygon(lat , lon , GlobalTransboundary(i_basin).Y , GlobalTransboundary(i_basin).X);
    Basin_Hist_nat_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_Hist_nat(in));
    Basin_ssp245_nat_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp245_nat(in));
    Basin_piControl_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_piControl_MeanChange(in));
    Basin_ssp245_fix_POP_ExposedPopulation(i_basin,1) = nansum(ExposedPopulation_ssp245_fix_POP(in));
    clear in
end
clear i_basin

xlswrite(['Basins_Munia.xlsx'] , Basin_Hist_nat_ExposedPopulation , 'Sheet1' , 'AE3:AE170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp245_nat_ExposedPopulation , 'Sheet1' , 'AF3:AF170');
xlswrite(['Basins_Munia.xlsx'] , Basin_piControl_ExposedPopulation , 'Sheet1' , 'AG3:AG170');
xlswrite(['Basins_Munia.xlsx'] , Basin_ssp245_fix_POP_ExposedPopulation , 'Sheet1' , 'AH3:AH170');

clear GlobalTransboundary Basin_Hist_nat_ExposedPopulation Basin_ssp245_nat_ExposedPopulation
clear Basin_piControl_ExposedPopulation  Basin_ssp245_fix_POP_ExposedPopulation
