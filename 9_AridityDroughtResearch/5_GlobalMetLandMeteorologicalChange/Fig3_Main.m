%% Figure 3
%% Spatial change of Pr linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\Met_Land_Historical_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\Met_Land_ssp126_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\Met_Land_ssp370_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\Met_Land_ssp585_Ensemble_Mean_DroughtFrequency_Year.mat';

Path_Fig3_Output = 'Fig3_Output\';

GridMet_Land_CMIP = cat(2,load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM
% Pr Input mm/year Output mm/(year2)
Fig3_Plotting(GridMet_Land_CMIP , Path_Fig3_Output)
