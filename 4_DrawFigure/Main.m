clc;clear all;close all;

%% Figure 1
Path_DryWetRegion_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_DryWetRegion_Year.mat';
Path_DryWetRegion_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Princeton\DryWetRegion_Year_Princeton.mat';

CMIP_DryWetRegion = cat(2,load(Path_DryWetRegion_Historical_GCM),...
    load(Path_DryWetRegion_ScenarioMIP_ssp126_GCM),load(Path_DryWetRegion_ScenarioMIP_ssp245_GCM),...
    load(Path_DryWetRegion_ScenarioMIP_ssp370_GCM),load(Path_DryWetRegion_ScenarioMIP_ssp585_GCM));
Fig1a_Left_Plotting( cat(2,CMIP_DryWetRegion(1),CMIP_DryWetRegion(5)) , Path_DryWetRegion_Princeton );
Fig1a_Right_Plotting( CMIP_DryWetRegion );

