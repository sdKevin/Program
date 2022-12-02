%% Figure 4 for PDSI calculated Drought Extent
clc; clear all; close all;
Path_PDSI_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\PDSI_Historical_DroughtExtent_Year.mat';
Path_PDSI_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\PDSI_ssp126_DroughtExtent_Year.mat';
Path_PDSI_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\PDSI_ssp245_DroughtExtent_Year.mat';
Path_PDSI_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\PDSI_ssp370_DroughtExtent_Year.mat';
Path_PDSI_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\PDSI_ssp585_DroughtExtent_Year.mat';
Path_PDSI_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Princeton\PDSI_DroughtExtent_Year.mat';

PDSI_Year = cat(2,load(Path_PDSI_Year_Historical_GCM),...
    load(Path_PDSI_Year_ScenarioMIP_ssp126_GCM),load(Path_PDSI_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_PDSI_Year_ScenarioMIP_ssp370_GCM),load(Path_PDSI_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_PDSI_Year_Princeton_GCM));

clear Path_PDSI_Year_Historical_GCM Path_PDSI_Year_ScenarioMIP_ssp126_GCM Path_PDSI_Year_ScenarioMIP_ssp245_GCM
clear Path_PDSI_Year_ScenarioMIP_ssp370_GCM Path_PDSI_Year_ScenarioMIP_ssp585_GCM Path_PDSI_Year_Princeton_GCM

%% Fig4a Drawing PDSI calculated by PM_RC_CO2_Jarvis_H
Fig4a_Plotting(PDSI_Year)
Fig4a_Article_Plotting(PDSI_Year)
%% Fig4b Drawing PDSI calculated by PM_RC_CO2_Yang
Fig4b_Plotting(PDSI_Year)
%% Fig4c Drawing PDSI calculated by PM_RC
Fig4c_Plotting(PDSI_Year)

%% Figure 4 for scPDSI calculated Drought Extent
clc; clear all; close all;
Path_scPDSI_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\scPDSI_Historical_DroughtExtent_Year.mat';
Path_scPDSI_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\scPDSI_ssp126_DroughtExtent_Year.mat';
Path_scPDSI_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\scPDSI_ssp245_DroughtExtent_Year.mat';
Path_scPDSI_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\scPDSI_ssp370_DroughtExtent_Year.mat';
Path_scPDSI_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\scPDSI_ssp585_DroughtExtent_Year.mat';
Path_scPDSI_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Princeton\scPDSI_DroughtExtent_Year.mat';

scPDSI_Year = cat(2,load(Path_scPDSI_Year_Historical_GCM),...
    load(Path_scPDSI_Year_ScenarioMIP_ssp126_GCM),load(Path_scPDSI_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_scPDSI_Year_ScenarioMIP_ssp370_GCM),load(Path_scPDSI_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_scPDSI_Year_Princeton_GCM));

clear Path_scPDSI_Year_Historical_GCM Path_scPDSI_Year_ScenarioMIP_ssp126_GCM Path_scPDSI_Year_ScenarioMIP_ssp245_GCM
clear Path_scPDSI_Year_ScenarioMIP_ssp370_GCM Path_scPDSI_Year_ScenarioMIP_ssp585_GCM Path_scPDSI_Year_Princeton_GCM

%% Fig4d Drawing scPDSI calculated by PM_RC_CO2_Jarvis_H
Fig4d_Plotting(scPDSI_Year)
%% Fig4e Drawing scPDSI calculated by PM_RC_CO2_Yang
Fig4e_Plotting(scPDSI_Year)
%% Fig4f Drawing scPDSI calculated by PM_RC
Fig4f_Plotting(scPDSI_Year)
