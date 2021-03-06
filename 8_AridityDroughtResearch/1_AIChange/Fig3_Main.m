%% Figure 3
% Spatial change of AI linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_Ensemble_Mean.mat';
Path_Ensemble_Mean_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Princeton\Ensemble_Mean.mat';
Path_Fig3_Output = 'Fig3_Output\';

GridAI_Princeton_CMIP = cat(2,load(Path_Ensemble_Mean_Princeton),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton

Fig3_Plotting(GridAI_Princeton_CMIP , Path_Fig3_Output)
