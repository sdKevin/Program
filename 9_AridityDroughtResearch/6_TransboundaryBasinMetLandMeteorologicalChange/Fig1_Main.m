%% Figure 1
clc; clear all; close all;
% Yearly Met variables
Path_Met_Land_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\Met_Land_Historical_DroughtExtent_Year.mat';
Path_Met_Land_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\Met_Land_ssp126_DroughtExtent_Year.mat';
Path_Met_Land_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_DroughtExtent_Year.mat';
Path_Met_Land_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\Met_Land_ssp370_DroughtExtent_Year.mat';
Path_Met_Land_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\Met_Land_ssp585_DroughtExtent_Year.mat';

Met_Land_Year = cat(2,load(Path_Met_Land_Year_Historical_GCM),...
    load(Path_Met_Land_Year_ScenarioMIP_ssp126_GCM),load(Path_Met_Land_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_Met_Land_Year_ScenarioMIP_ssp370_GCM),load(Path_Met_Land_Year_ScenarioMIP_ssp585_GCM));

clear Path_Met_Land_Year_Historical_GCM Path_Met_Land_Year_ScenarioMIP_ssp126_GCM Path_Met_Land_Year_ScenarioMIP_ssp245_GCM
clear Path_Met_Land_Year_ScenarioMIP_ssp370_GCM Path_Met_Land_Year_ScenarioMIP_ssp585_GCM

Fig1_Left_Plotting(Met_Land_Year)
Fig1_Right_Plotting(Met_Land_Year)