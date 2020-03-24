clc;clear all;
% Name of 13 CLMs
AllCLM = {'BCC-CSM2-MR_r1';'CanESM5_r1_r6';'CESM2_r1';'CESM2-WACCM_r1';...
    'CNRM-CM6-1_r1';'FGOALS-g3_r1';'GFDL-ESM4_r1';'IPSL-CM6A-LR_r1';...
    'MIROC6_r1';'MIROC-ES2L_r1';'MRI-ESM2-0_r1';'UKESM1-0-LL_r1';'CNRM-ESM2-1_r2'};
load EarthLandArea_05deg % global land surface Area including both land and water (km^2)
load('D:\CMIP6\Program\LandInfo_05deg.mat')
%% CLM AI Calculation
for CLM_i = 1:13
    load(['D:\CMIP6\Program\Fig1_ProcessData\ETrc_GridYear_',AllCLM{CLM_i},'.mat'])
    load(['D:\CMIP6\Program\Fig1_ProcessData\pr_GridYear_',AllCLM{CLM_i},'.mat'])
    % pr from kg/(m2s) to mm/year
    for ii = 1:251
        Grid_AI.PM_RC(:,:,ii) = pr_GridYear(:,:,ii).*1000.*31536000./997./ETrc_GridYear.PM_RC(:,:,ii);
        Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii) = pr_GridYear(:,:,ii).*1000.*31536000./997./ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,ii);
        Grid_AI.PM_RC_CO2_Yang(:,:,ii) = pr_GridYear(:,:,ii).*1000.*31536000./997./ETrc_GridYear.PM_RC_CO2_Yang(:,:,ii);
    end
    clear ii
    % Yearly Grid to Yearly series Considering Each Grid has different surface area
    for ii = 1:size( ETrc_GridYear.PM_RC,3)
        Cold_PM_RC(CLM_i,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC(:,1:250,ii))<450,(ETrc_GridYear.PM_RC(:,251:end,ii))<400]))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;%EarthLandArea_05deg extent>landmask_05deg
        DryLand_PM_RC(CLM_i,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC(:,:,ii))<0.65))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        HumidLand_PM_RC(CLM_i,ii) = 100 - Cold_PM_RC(CLM_i,ii) - DryLand_PM_RC(CLM_i,ii);
        
        Cold_PM_RC_CO2_Jarvis_H(CLM_i,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,1:250,ii))<450,(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,251:end,ii))<400]))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        DryLand_PM_RC_CO2_Jarvis_H(CLM_i,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Jarvis_H(:,:,ii))<0.65))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        HumidLand_PM_RC_CO2_Jarvis_H(CLM_i,ii) = 100 - Cold_PM_RC_CO2_Jarvis_H(CLM_i,ii) - DryLand_PM_RC_CO2_Jarvis_H(CLM_i,ii);
        
        Cold_PM_RC_CO2_Yang(CLM_i,ii) = nansum(EarthLandArea_05deg([(ETrc_GridYear.PM_RC_CO2_Yang(:,1:250,ii))<450,(ETrc_GridYear.PM_RC_CO2_Yang(:,251:end,ii))<400]))...
            ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        DryLand_PM_RC_CO2_Yang(CLM_i,ii) = nansum(EarthLandArea_05deg((Grid_AI.PM_RC_CO2_Yang(:,:,ii))<0.65))./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))).*100;
        HumidLand_PM_RC_CO2_Yang(CLM_i,ii) = 100 - Cold_PM_RC_CO2_Yang(CLM_i,ii) - DryLand_PM_RC_CO2_Yang(CLM_i,ii);
    end
    save(['Grid_AI_' AllCLM{CLM_i}],'Grid_AI')
end
save('DryWetRegion_CLM','Cold_PM_RC','DryLand_PM_RC','HumidLand_PM_RC',...
    'Cold_PM_RC_CO2_Jarvis_H','DryLand_PM_RC_CO2_Jarvis_H','HumidLand_PM_RC_CO2_Jarvis_H',...
    'Cold_PM_RC_CO2_Yang','DryLand_PM_RC_CO2_Yang','HumidLand_PM_RC_CO2_Yang')
%% Princeton AI Calculation
clc;clear all;
load(['D:\CMIP6\Program\Fig1_ProcessData\ETrc_GridYear_Princeton','.mat'])
load(['D:\CMIP6\Program\Fig1_ProcessData\pr_GridYear_Princeton','.mat'])
load EarthLandArea_05deg % global land surface Area including both land and water (km^2)
load('D:\CMIP6\Program\LandInfo_05deg.mat')
% pr from kg/(m2s) to mm/year
for ii = 1:67
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
save('Grid_AI_Princeton','Grid_AI')
save('DryWetRegion_Princeton','Cold_PM_RC','DryLand_PM_RC','HumidLand_PM_RC',...
    'Cold_PM_RC_CO2_Jarvis_H','DryLand_PM_RC_CO2_Jarvis_H','HumidLand_PM_RC_CO2_Jarvis_H',...
    'Cold_PM_RC_CO2_Yang','DryLand_PM_RC_CO2_Yang','HumidLand_PM_RC_CO2_Yang')

%% Plotting
clc;clear all;close all;
Fig2a_Plotting()
Fig2a_Supplementary_Plotting()