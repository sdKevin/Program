%% Figure 2 for PDSI
clc; clear all; close all;
Path_PDSI_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\Historical\PDSI_Historical_PDSI_Year.mat';
Path_PDSI_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp126\PDSI_ssp126_PDSI_Year.mat';
Path_PDSI_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp245\PDSI_ssp245_PDSI_Year.mat';
Path_PDSI_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp370\PDSI_ssp370_PDSI_Year.mat';
Path_PDSI_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp585\PDSI_ssp585_PDSI_Year.mat';
Path_PDSI_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\Princeton\PDSI_Year_Princeton.mat';

PDSI_Year = cat(2,load(Path_PDSI_Year_Historical_GCM),...
    load(Path_PDSI_Year_ScenarioMIP_ssp126_GCM),load(Path_PDSI_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_PDSI_Year_ScenarioMIP_ssp370_GCM),load(Path_PDSI_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_PDSI_Year_Princeton_GCM));

clear Path_PDSI_Year_Historical_GCM Path_PDSI_Year_ScenarioMIP_ssp126_GCM Path_PDSI_Year_ScenarioMIP_ssp245_GCM
clear Path_PDSI_Year_ScenarioMIP_ssp370_GCM Path_PDSI_Year_ScenarioMIP_ssp585_GCM Path_PDSI_Year_Princeton_GCM

%% Fig2a Drawing PDSI calculated by PM_RC_CO2_Jarvis_H
Fig2a_Plotting(PDSI_Year)
%% Fig2b Drawing PDSI calculated by PM_RC_CO2_Yang
Fig2b_Plotting(PDSI_Year)
%% Fig2c Drawing PDSI calculated by PM_RC
Fig2c_Plotting(PDSI_Year)

%% Figure 2 for scPDSI
clc; clear all; close all;
Path_scPDSI_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\Historical\scPDSI_Historical_scPDSI_Year.mat';
Path_scPDSI_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp126\scPDSI_ssp126_scPDSI_Year.mat';
Path_scPDSI_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp245\scPDSI_ssp245_scPDSI_Year.mat';
Path_scPDSI_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp370\scPDSI_ssp370_scPDSI_Year.mat';
Path_scPDSI_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp585\scPDSI_ssp585_scPDSI_Year.mat';
Path_scPDSI_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\Princeton\scPDSI_Year_Princeton.mat';

scPDSI_Year = cat(2,load(Path_scPDSI_Year_Historical_GCM),...
    load(Path_scPDSI_Year_ScenarioMIP_ssp126_GCM),load(Path_scPDSI_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_scPDSI_Year_ScenarioMIP_ssp370_GCM),load(Path_scPDSI_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_scPDSI_Year_Princeton_GCM));

clear Path_scPDSI_Year_Historical_GCM Path_scPDSI_Year_ScenarioMIP_ssp126_GCM Path_scPDSI_Year_ScenarioMIP_ssp245_GCM
clear Path_scPDSI_Year_ScenarioMIP_ssp370_GCM Path_scPDSI_Year_ScenarioMIP_ssp585_GCM Path_scPDSI_Year_Princeton_GCM

%% Fig2a Drawing scPDSI calculated by PM_RC_CO2_Jarvis_H
Fig2d_Plotting(scPDSI_Year)
%% Fig2b Drawing scPDSI calculated by PM_RC_CO2_Yang
Fig2e_Plotting(scPDSI_Year)
%% Fig2c Drawing scPDSI calculated by PM_RC
Fig2f_Plotting(scPDSI_Year)
