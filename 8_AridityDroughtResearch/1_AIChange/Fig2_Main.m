%% Figure 2
clc; clear all; close all;
% Yearly ETrc
Path_ETrc_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Historical\ETrc_Historical_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_ETrc_Year.mat';
Path_ETrc_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Princeton\ETrc_Year_Princeton.mat';
% Yearly Met variables
Path_Met_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Historical\Met_Var_Historical_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_Met_Year.mat';
Path_Met_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Princeton\Met_Year_Princeton.mat';
% Yearly Attribution variables
Path_Attribution_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\Historical\Attribution_Var_Historical_Attribution_Year.mat';
Path_Attribution_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp126\Attribution_Var_ssp126_Attribution_Year.mat';
Path_Attribution_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp245\Attribution_Var_ssp245_Attribution_Year.mat';
Path_Attribution_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp370\Attribution_Var_ssp370_Attribution_Year.mat';
Path_Attribution_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp585\Attribution_Var_ssp585_Attribution_Year.mat';
% Output Path
Path_Fig2a_Output = 'Fig2a_Output\';
% Load Yearly ETrc, Met, and Attribution variables
ETrc_Year = cat(2,load(Path_ETrc_Year_Historical_GCM),...
    load(Path_ETrc_Year_ScenarioMIP_ssp126_GCM),load(Path_ETrc_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_ETrc_Year_ScenarioMIP_ssp370_GCM),load(Path_ETrc_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_ETrc_Year_Princeton_GCM));
Met_Year = cat(2,load(Path_Met_Year_Historical_GCM),...
    load(Path_Met_Year_ScenarioMIP_ssp126_GCM),load(Path_Met_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_Met_Year_ScenarioMIP_ssp370_GCM),load(Path_Met_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_Met_Year_Princeton_GCM));
Attribution_Year = cat(2,load(Path_Attribution_Year_Historical_GCM),...
    load(Path_Attribution_Year_ScenarioMIP_ssp126_GCM),load(Path_Attribution_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_Attribution_Year_ScenarioMIP_ssp370_GCM),load(Path_Attribution_Year_ScenarioMIP_ssp585_GCM));

clear Path_ETrc_Year_Historical_GCM Path_ETrc_Year_ScenarioMIP_ssp126_GCM Path_ETrc_Year_ScenarioMIP_ssp245_GCM Path_ETrc_Year_ScenarioMIP_ssp370_GCM Path_ETrc_Year_ScenarioMIP_ssp585_GCM Path_ETrc_Year_Princeton_GCM
clear Path_Met_Year_Historical_GCM Path_Met_Year_ScenarioMIP_ssp126_GCM Path_Met_Year_ScenarioMIP_ssp245_GCM Path_Met_Year_ScenarioMIP_ssp370_GCM Path_Met_Year_ScenarioMIP_ssp585_GCM Path_Met_Year_Princeton_GCM
clear Path_Attribution_Year_Historical_GCM Path_Attribution_Year_ScenarioMIP_ssp126_GCM Path_Attribution_Year_ScenarioMIP_ssp245_GCM Path_Attribution_Year_ScenarioMIP_ssp370_GCM Path_Attribution_Year_ScenarioMIP_ssp585_GCM
%% Fig2a Drawing AI calculated by PM_RC_CO2_Jarvis_H
Fig2a_Left_Plotting(ETrc_Year , Met_Year)
Fig2a_Right_Plotting(ETrc_Year , Met_Year , Attribution_Year , Path_Fig2a_Output)
%% Fig2b Drawing AI calculated by PM_RC_CO2_Yang
Fig2b_Left_Plotting(ETrc_Year , Met_Year)
Fig2b_Right_Plotting(ETrc_Year , Met_Year , Attribution_Year , Path_Fig2a_Output)
%% Fig2c Drawing AI calculated by PM_RC
Fig2c_Left_Plotting(ETrc_Year , Met_Year)
Fig2c_Right_Plotting(ETrc_Year , Met_Year , Attribution_Year , Path_Fig2a_Output)