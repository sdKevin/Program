%% Figure 1
clc; clear all; close all;
% Yearly Met variables
Path_Met_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Historical\Met_Var_Historical_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_Met_Year.mat';
% Yearly Land variables
Path_Land_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\Historical\Land_Var_Historical_Land_Year.mat';
Path_Land_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp126\Land_Var_ssp126_Land_Year.mat';
Path_Land_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp245\Land_Var_ssp245_Land_Year.mat';
Path_Land_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_Land_Year.mat';
Path_Land_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp585\Land_Var_ssp585_Land_Year.mat';

Met_Year = cat(2,load(Path_Met_Year_Historical_GCM),...
    load(Path_Met_Year_ScenarioMIP_ssp126_GCM),load(Path_Met_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_Met_Year_ScenarioMIP_ssp370_GCM),load(Path_Met_Year_ScenarioMIP_ssp585_GCM));
Land_Year = cat(2,load(Path_Land_Year_Historical_GCM),...
    load(Path_Land_Year_ScenarioMIP_ssp126_GCM),load(Path_Land_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_Land_Year_ScenarioMIP_ssp370_GCM),load(Path_Land_Year_ScenarioMIP_ssp585_GCM));

clear Path_Met_Year_Historical_GCM Path_Met_Year_ScenarioMIP_ssp126_GCM Path_Met_Year_ScenarioMIP_ssp245_GCM
clear Path_Met_Year_ScenarioMIP_ssp370_GCM Path_Met_Year_ScenarioMIP_ssp585_GCM Path_Met_Year_Princeton_GCM
clear Path_Land_Year_Historical_GCM Path_Land_Year_ScenarioMIP_ssp126_GCM Path_Land_Year_ScenarioMIP_ssp245_GCM
clear Path_Land_Year_ScenarioMIP_ssp370_GCM Path_Land_Year_ScenarioMIP_ssp585_GCM

Fig1_Left_Plotting(Met_Year , Land_Year)
Fig1_Right_Plotting(Met_Year , Land_Year)