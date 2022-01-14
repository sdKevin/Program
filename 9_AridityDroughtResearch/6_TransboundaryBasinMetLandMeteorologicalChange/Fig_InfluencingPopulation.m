%% Figure Timeseries
clc; clear all; close all;
%% Read the boundary file
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\GlobalBasin.shp';
GlobalTransboundary = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary
%% Setting the input/output paths
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
InputPopulationPath{5} = 'D:\CMIP6\ProcessData\ImplicationResearch\Global Population Projection Grids Based on SSPs\SSP5\Total\Mat';

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
%% Calculating Drought Extent
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
            AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            BB_HR = interp2(lat_05deg,Lon_05deg,BB,lat,lon); % interpolate to the resolution of population
            CC = BB_HR >= 1; clear BB BB_HR
            if i_Path > 1
                if i_Year == 1
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2010.mat'));
                elseif i_Year == 6
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2020.mat'));
                elseif i_Year == 16
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2030.mat'));
                elseif i_Year == 26
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2040.mat'));
                elseif i_Year == 36
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2050.mat'));
                elseif i_Year == 46
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2060.mat'));
                elseif i_Year == 56
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2070.mat'));
                elseif i_Year == 66
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2080.mat'));
                elseif i_Year == 76
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2090.mat'));
                elseif i_Year == 86
                    load(strcat(InputPopulationPath{i_Path},'ssp1_2100.mat'));
                end
            end
            Met_Drought_Population_Year(i_Path).Population_Year.CompoundDrought(i_GCM,i_Year) = nansum(Population(CC&in_HR));
            Met_Drought_FractionalPopulation_Year(i_Path).FractionalPopulation_Year.CompoundDrought(i_GCM,i_Year) = nansum(Population(CC&in_HR))./nansum(Population(in_HR)) .* 100;
            clear CC
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM GCM_Ensemble Population
end










