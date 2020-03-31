clc; clear all; close all;

%% Setting the input/output paths
% CMIP6 Historical Meteorological Data
InputETrcPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Historical\ETrc_Historical_';
InputMetPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Historical\Met_Var_Historical_';
OutputPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_';
% CMIP6 ScenarioMIP ssp126 Meteorological Data
InputETrcPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_';
InputMetPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_';
OutputPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_';
% CMIP6 ScenarioMIP ssp245 Meteorological Data
InputETrcPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_';
InputMetPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_';
OutputPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_';
% CMIP6 ScenarioMIP ssp370 Meteorological Data
InputETrcPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_';
InputMetPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_';
OutputPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_';
% CMIP6 ScenarioMIP ssp585 Meteorological Data
InputETrcPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_';
InputMetPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_';
OutputPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_';

for i_Path = 1 : length(InputETrcPath)
    if i_Path == 4
        % Name of Global Climate Model
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    else
        % Name of Global Climate Model
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    end
    % global land surface Area including both land and water (km^2)
    load EarthLandArea_05deg % Land and Water Area V4.11, download from https://sedac.ciesin.columbia.edu/data/set/gpw-v4-land-water-area-rev11
    load LandInfo_05deg.mat
    %% GCM AI Calculation
    for i_GCM = 1 : length(GCM_Ensemble)
        % Load GCM yearly ETrc data
        load([InputETrcPath{i_Path} , GCM_Ensemble{i_GCM} , '.mat'])
        % Load GCM yearly Met data
        load([InputMetPath{i_Path} , GCM_Ensemble{i_GCM} , '.mat'])
        % Convert ETrc from mm/day to mm/year
        ETrc.PM_RC = ETrc.PM_RC .* 365;
        ETrc.PM_RC_CO2_Jarvis_H = ETrc.PM_RC_CO2_Jarvis_H .* 365;
        ETrc.PM_RC_CO2_Yang = ETrc.PM_RC_CO2_Yang .* 365;
        % Convert pr from kg/(m2s) to mm/year
        Met_Var.pr = Met_Var.pr .* 1000 .* 31536000 ./ 997;
        for ii = 1 : size(Met_Var.pr , 3)
            Grid_AI.PM_RC(:,:,ii) = Met_Var.pr(:,:,ii) ./ ETrc.PM_RC(:,:,ii);
            Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii) = Met_Var.pr(:,:,ii) ./ ETrc.PM_RC_CO2_Jarvis_H(:,:,ii);
            Grid_AI.PM_RC_CO2_Yang(:,:,ii) = Met_Var.pr(:,:,ii) ./ ETrc.PM_RC_CO2_Yang(:,:,ii);
        end
        clear ii
        % Yearly Grid to Yearly series Considering Each Grid has different surface area
        for ii = 1 : size( ETrc.PM_RC , 3)
            Cold_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg([(ETrc.PM_RC(:,1:250,ii))<450,(ETrc.PM_RC(:,251:end,ii))<400]))...
                ./ nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;%EarthLandArea_05deg extent>landmask_05deg
            DryLand_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC(:,:,ii))<0.65))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            HumidLand_PM_RC(i_GCM,ii) = 100 - Cold_PM_RC(i_GCM,ii) - DryLand_PM_RC(i_GCM,ii);
            
            Cold_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg([(ETrc.PM_RC_CO2_Jarvis_H(:,1:250,ii))<450,(ETrc.PM_RC_CO2_Jarvis_H(:,251:end,ii))<400]))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DryLand_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii))<0.65))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            HumidLand_PM_RC_CO2_Jarvis_H(i_GCM,ii) = 100 - Cold_PM_RC_CO2_Jarvis_H(i_GCM,ii) - DryLand_PM_RC_CO2_Jarvis_H(i_GCM,ii);
            
            Cold_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg([(ETrc.PM_RC_CO2_Yang(:,1:250,ii))<450,(ETrc.PM_RC_CO2_Yang(:,251:end,ii))<400]))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DryLand_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Yang(:,:,ii))<0.65))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            HumidLand_PM_RC_CO2_Yang(i_GCM,ii) = 100 - Cold_PM_RC_CO2_Yang(i_GCM,ii) - DryLand_PM_RC_CO2_Yang(i_GCM,ii);
        end
        clear ii ETrc Met_Var
        save([OutputPath{i_Path} , GCM_Ensemble{i_GCM}] , 'Grid_AI');
        clear Grid_AI
    end
    save([OutputPath{i_Path} 'DryWetRegion_Year'],...
        'Cold_PM_RC','DryLand_PM_RC','HumidLand_PM_RC',...
        'Cold_PM_RC_CO2_Jarvis_H','DryLand_PM_RC_CO2_Jarvis_H','HumidLand_PM_RC_CO2_Jarvis_H',...
        'Cold_PM_RC_CO2_Yang','DryLand_PM_RC_CO2_Yang','HumidLand_PM_RC_CO2_Yang')
    clear i_GCM
end
clear i_Path

%% Princeton AI Calculation
clc; clear all; close all;

%% Setting the input/output paths
InputETrcPath = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Princeton\ETrc_Princeton';
InputMetPath = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Princeton\Met_Var_Princeton';
OutputPath = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Princeton\';

load(InputETrcPath); load(InputMetPath)
% global land surface Area including both land and water (km^2)
load EarthLandArea_05deg % Land and Water Area V4.11, download from https://sedac.ciesin.columbia.edu/data/set/gpw-v4-land-water-area-rev11
load LandInfo_05deg.mat
% ETrc from mm/day to mm/year
ETrc.PM_RC = ETrc.PM_RC .* 365;
ETrc.PM_RC_CO2_Jarvis_H = ETrc.PM_RC_CO2_Jarvis_H .* 365;
ETrc.PM_RC_CO2_Yang = ETrc.PM_RC_CO2_Yang .* 365;
% pr from kg/(m2s) to mm/year
Met_Var.pr = Met_Var.pr .* 1000 .* 31536000 ./ 997;
for ii = 1 : size(Met_Var.pr , 3)
    Grid_AI.PM_RC(:,:,ii) = Met_Var.pr(:,:,ii) ./ ETrc.PM_RC(:,:,ii);
    Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii) = Met_Var.pr(:,:,ii) ./ ETrc.PM_RC_CO2_Jarvis_H(:,:,ii);
    Grid_AI.PM_RC_CO2_Yang(:,:,ii) = Met_Var.pr(:,:,ii) ./ ETrc.PM_RC_CO2_Yang(:,:,ii);
end
clear ii% Yearly Grid to Yearly series
for ii = 1 : size( ETrc.PM_RC,3)
    Cold_PM_RC(1,ii) = nansum(EarthLandArea_05deg([(ETrc.PM_RC(:,1:250,ii))<450,(ETrc.PM_RC(:,251:end,ii))<400]))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DryLand_PM_RC(1,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC(:,:,ii))<0.65))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    HumidLand_PM_RC(1,ii) = 100 - Cold_PM_RC(1,ii) - DryLand_PM_RC(1,ii);
    
    Cold_PM_RC_CO2_Jarvis_H(1,ii) = nansum(EarthLandArea_05deg([(ETrc.PM_RC_CO2_Jarvis_H(:,1:250,ii))<450,(ETrc.PM_RC_CO2_Jarvis_H(:,251:end,ii))<400]))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DryLand_PM_RC_CO2_Jarvis_H(1,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii))<0.65))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    HumidLand_PM_RC_CO2_Jarvis_H(1,ii) = 100 - Cold_PM_RC_CO2_Jarvis_H(1,ii) - DryLand_PM_RC_CO2_Jarvis_H(1,ii);
    
    Cold_PM_RC_CO2_Yang(1,ii) = nansum(EarthLandArea_05deg([(ETrc.PM_RC_CO2_Yang(:,1:250,ii))<450,(ETrc.PM_RC_CO2_Yang(:,251:end,ii))<400]))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DryLand_PM_RC_CO2_Yang(1,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Yang(:,:,ii))<0.65))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    HumidLand_PM_RC_CO2_Yang(1,ii) = 100 - Cold_PM_RC_CO2_Yang(1,ii) - DryLand_PM_RC_CO2_Yang(1,ii);
end
clear ii ETrc Met_Var
save([OutputPath 'AI_Princeton'] , 'Grid_AI');
clear Grid_AI
save([OutputPath 'DryWetRegion_Year_Princeton'],...
    'Cold_PM_RC','DryLand_PM_RC','HumidLand_PM_RC',...
    'Cold_PM_RC_CO2_Jarvis_H','DryLand_PM_RC_CO2_Jarvis_H','HumidLand_PM_RC_CO2_Jarvis_H',...
    'Cold_PM_RC_CO2_Yang','DryLand_PM_RC_CO2_Yang','HumidLand_PM_RC_CO2_Yang')
