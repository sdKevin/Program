%% Figure 1
%%% Figure 1a
clc; clear all; close all;
Path_ETrc_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Historical\ETrc_Historical_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_ETrc_Year.mat';
Path_ETrc_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Princeton\ETrc_Year_Princeton.mat';

Path_Met_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Historical\Met_Var_Historical_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_Met_Year.mat';
Path_Met_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Princeton\Met_Year_Princeton.mat';

ETrc_Year = cat(2,load(Path_ETrc_Year_Historical_GCM),...
    load(Path_ETrc_Year_ScenarioMIP_ssp126_GCM),load(Path_ETrc_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_ETrc_Year_ScenarioMIP_ssp370_GCM),load(Path_ETrc_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_ETrc_Year_Princeton_GCM));
Met_Year = cat(2,load(Path_Met_Year_Historical_GCM),...
    load(Path_Met_Year_ScenarioMIP_ssp126_GCM),load(Path_Met_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_Met_Year_ScenarioMIP_ssp370_GCM),load(Path_Met_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_Met_Year_Princeton_GCM));

Fig1a_Plotting(ETrc_Year , Met_Year)

%%% Figure 1b
% Path_Attribution_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\Historical\Attribution_Var_Historical_Attribution_Year.mat';
% Path_Attribution_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp126\Attribution_Var_ssp126_Attribution_Year.mat';
% Path_Attribution_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp245\Attribution_Var_ssp245_Attribution_Year.mat';
% Path_Attribution_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp370\Attribution_Var_ssp370_Attribution_Year.mat';
% Path_Attribution_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp585\Attribution_Var_ssp585_Attribution_Year.mat';
% 
% Path_Fig2a_Output = 'Fig2a_Output\';
% 
% Attribution_Year = cat(2,load(Path_Attribution_Year_Historical_GCM),...
%     load(Path_Attribution_Year_ScenarioMIP_ssp126_GCM),load(Path_Attribution_Year_ScenarioMIP_ssp245_GCM),...
%     load(Path_Attribution_Year_ScenarioMIP_ssp370_GCM),load(Path_Attribution_Year_ScenarioMIP_ssp585_GCM));
