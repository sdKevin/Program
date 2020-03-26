clc; clear all; close all;

%% Setting the input/output paths
InputPath_Yearly = 'D:\CMIP6\Output\Output_Yearly';
OutputPath_Yearly = 'D:\CMIP6\Output\Output_Yearly';

% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','UKESM1-0-LL'};
% global land surface Area including both land and water (km^2)
load EarthLandArea_05deg % Land and Water Area V4.11, download from https://sedac.ciesin.columbia.edu/data/set/gpw-v4-land-water-area-rev11

load('..\ETrc_Calculation\LandInfo_05deg.mat')
%% GCM AI Calculation
for i_GCM = 1 : length(GCM_Ensemble)
    % Load GCM yearly ETrc data
    load([InputPath_Yearly , '\ETrc_GridYear_' , GCM_Ensemble{i_GCM} , '.mat'])
    % Load GCM yearly pr data
    load([InputPath_Yearly , '\pr_GridYear_' , GCM_Ensemble{i_GCM} , '.mat'])
    % pr from kg/(m2s) to mm/year
    for ii = 1 : size(pr_GridYear , 3)
        Grid_AI.PM_RC(:,:,ii) = pr_GridYear(:,:,ii) .* 1000 .* 31536000 ./ 997 ./ ETrc_GridYear.PM_RC(:,:,ii);
        Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii) = pr_GridYear(:,:,ii) .* 1000 .* 31536000 ./ 997 ./ ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,ii);
        Grid_AI.PM_RC_CO2_Yang(:,:,ii) = pr_GridYear(:,:,ii) .* 1000 .* 31536000 ./ 997 ./ ETrc_GridYear.PM_RC_CO2_Yang(:,:,ii);
    end
    clear ii
    % Yearly Grid to Yearly series Considering Each Grid has different surface area
    for ii = 1 : size( ETrc_GridYear.PM_RC,3)
        Cold_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC(:,1:250,ii))<450,(ETrc_GridYear.PM_RC(:,251:end,ii))<400]))...
            ./ nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;%EarthLandArea_05deg extent>landmask_05deg
        DryLand_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC(:,:,ii))<0.65))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        HumidLand_PM_RC(i_GCM,ii) = 100 - Cold_PM_RC(i_GCM,ii) - DryLand_PM_RC(i_GCM,ii);
        
        Cold_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,1:250,ii))<450,(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,251:end,ii))<400]))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        DryLand_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii))<0.65))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        HumidLand_PM_RC_CO2_Jarvis_H(i_GCM,ii) = 100 - Cold_PM_RC_CO2_Jarvis_H(i_GCM,ii) - DryLand_PM_RC_CO2_Jarvis_H(i_GCM,ii);
        
        Cold_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC_CO2_Yang(:,1:250,ii))<450,(ETrc_GridYear.PM_RC_CO2_Yang(:,251:end,ii))<400]))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        DryLand_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Yang(:,:,ii))<0.65))./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        HumidLand_PM_RC_CO2_Yang(i_GCM,ii) = 100 - Cold_PM_RC_CO2_Yang(i_GCM,ii) - DryLand_PM_RC_CO2_Yang(i_GCM,ii);
    end
    save([OutputPath_Yearly , '\Grid_AI_' GCM_Ensemble{i_GCM}],'Grid_AI');
end
save([OutputPath_Yearly '\DryWetRegion_GCM'],...
    'Cold_PM_RC','DryLand_PM_RC','HumidLand_PM_RC',...
    'Cold_PM_RC_CO2_Jarvis_H','DryLand_PM_RC_CO2_Jarvis_H','HumidLand_PM_RC_CO2_Jarvis_H',...
    'Cold_PM_RC_CO2_Yang','DryLand_PM_RC_CO2_Yang','HumidLand_PM_RC_CO2_Yang')

%% Princeton AI Calculation
clc; clear all; close all;
%% Setting the input/output paths
InputPath_Yearly = 'D:\CMIP6\Output\Output_Yearly';
OutputPath_Yearly = 'D:\CMIP6\Output\Output_Yearly';
load([InputPath_Yearly , '\ETrc_GridYear_Princeton' , '.mat'])
load([InputPath_Yearly , '\pr_GridYear_Princeton' , '.mat'])
% global land surface Area including both land and water (km^2)
load EarthLandArea_05deg % Land and Water Area V4.11, download from https://sedac.ciesin.columbia.edu/data/set/gpw-v4-land-water-area-rev11
load('..\ETrc_Calculation\LandInfo_05deg.mat')

% pr from kg/(m2s) to mm/year
for ii = 1 : size(pr_GridYear,3)
    Grid_AI.PM_RC(:,:,ii) = pr_GridYear(:,:,ii).*1000.*31536000./997./ETrc_GridYear.PM_RC(:,:,ii);
    Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii) = pr_GridYear(:,:,ii).*1000.*31536000./997./ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,ii);
    Grid_AI.PM_RC_CO2_Yang(:,:,ii) = pr_GridYear(:,:,ii).*1000.*31536000./997./ETrc_GridYear.PM_RC_CO2_Yang(:,:,ii);
end
clear ii
% Yearly Grid to Yearly series
for ii = 1:size( ETrc_GridYear.PM_RC,3)
    Cold_PM_RC(1,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC(:,1:250,ii))<450,(ETrc_GridYear.PM_RC(:,251:end,ii))<400]))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
    DryLand_PM_RC(1,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC(:,:,ii))<0.65))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
    HumidLand_PM_RC(1,ii) = 100 - Cold_PM_RC(1,ii) - DryLand_PM_RC(1,ii);
    
    Cold_PM_RC_CO2_Jarvis_H(1,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,1:250,ii))<450,(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,251:end,ii))<400]))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
    DryLand_PM_RC_CO2_Jarvis_H(1,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii))<0.65))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
    HumidLand_PM_RC_CO2_Jarvis_H(1,ii) = 100 - Cold_PM_RC_CO2_Jarvis_H(1,ii) - DryLand_PM_RC_CO2_Jarvis_H(1,ii);
    
    Cold_PM_RC_CO2_Yang(1,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC_CO2_Yang(:,1:250,ii))<450,(ETrc_GridYear.PM_RC_CO2_Yang(:,251:end,ii))<400]))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
    DryLand_PM_RC_CO2_Yang(1,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Yang(:,:,ii))<0.65))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
    HumidLand_PM_RC_CO2_Yang(1,ii) = 100 - Cold_PM_RC_CO2_Yang(1,ii) - DryLand_PM_RC_CO2_Yang(1,ii);
end

save([OutputPath_Yearly , '\Grid_AI_Princeton'],'Grid_AI')
save([OutputPath_Yearly '\DryWetRegion_Princeton'],...
    'Cold_PM_RC','DryLand_PM_RC','HumidLand_PM_RC',...
    'Cold_PM_RC_CO2_Jarvis_H','DryLand_PM_RC_CO2_Jarvis_H','HumidLand_PM_RC_CO2_Jarvis_H',...
    'Cold_PM_RC_CO2_Yang','DryLand_PM_RC_CO2_Yang','HumidLand_PM_RC_CO2_Yang')

%% Plotting
clc;clear all;close all;
Path_DryWetRegion_GCM = 'D:\CMIP6\Output\Output_Yearly\DryWetRegion_GCM.mat';
Path_DryWetRegion_Princeton = 'D:\CMIP6\Output\Output_Yearly\DryWetRegion_Princeton.mat';
Fig2a_Plotting( Path_DryWetRegion_GCM , Path_DryWetRegion_Princeton )
Fig2a_Supplementary_Plotting( Path_DryWetRegion_GCM , Path_DryWetRegion_Princeton )