%% Figure 1
% Temporal change of Cold Regions, Dry Lands, and Humid Lands
clc; clear all; close all;
Path_DryWetRegion_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_DryWetRegion_Year.mat';
Path_DryWetRegion_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Princeton\DryWetRegion_Year_Princeton.mat';

CMIP_DryWetRegion = cat(2,load(Path_DryWetRegion_Historical_GCM),...
    load(Path_DryWetRegion_ScenarioMIP_ssp126_GCM),load(Path_DryWetRegion_ScenarioMIP_ssp245_GCM),...
    load(Path_DryWetRegion_ScenarioMIP_ssp370_GCM),load(Path_DryWetRegion_ScenarioMIP_ssp585_GCM));

% Plotting Global Cold Regions, Dry Lands, and Humid Lands calculated by PM-RC-Jarvis
subplot(3,12,[9,10,11.2,21,22,23.2])
Fig1a_GlobalLands_Left_Plotting( cat(2,CMIP_DryWetRegion(1),CMIP_DryWetRegion(5)) , Path_DryWetRegion_Princeton );
Fig1a_GlobalLands_Right_Plotting( CMIP_DryWetRegion );
% Plotting Global Cold Regions, Dry Lands, and Humid Lands calculated by PM-RC-Yang
subplot(3,12,[5,6,7.2,17,18,19.2])
Fig1b_GlobalLands_Left_Plotting( cat(2,CMIP_DryWetRegion(1),CMIP_DryWetRegion(5)) , Path_DryWetRegion_Princeton );
Fig1b_GlobalLands_Right_Plotting( CMIP_DryWetRegion );
% Plotting Global Cold Regions, Dry Lands, and Humid Lands calculated by PM-RC
subplot(3,12,[1,2,3.2,13,14,15.2])
Fig1c_GlobalLands_Left_Plotting( cat(2,CMIP_DryWetRegion(1),CMIP_DryWetRegion(5)) , Path_DryWetRegion_Princeton );
Fig1c_GlobalLands_Right_Plotting( CMIP_DryWetRegion );