%% Figure 3
%% Spatial change of PDSI linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\Historical\PDSI_Historical_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp126\PDSI_ssp126_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp245\PDSI_ssp245_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp370\PDSI_ssp370_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp585\PDSI_ssp585_Ensemble_Mean.mat';
Path_Ensemble_Mean_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\Princeton\Ensemble_Mean.mat';
Path_Fig3_Output = 'Fig3_Output\';

GridPDSI_Princeton_CMIP = cat(2,load(Path_Ensemble_Mean_Princeton),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton

Fig3a_Plotting(GridPDSI_Princeton_CMIP , Path_Fig3_Output)

%% Spatial change of scPDSI linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\Historical\scPDSI_Historical_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp126\scPDSI_ssp126_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp245\scPDSI_ssp245_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp370\scPDSI_ssp370_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp585\scPDSI_ssp585_Ensemble_Mean.mat';
Path_Ensemble_Mean_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\Princeton\Ensemble_Mean.mat';
Path_Fig3_Output = 'Fig3_Output\';

GridscPDSI_Princeton_CMIP = cat(2,load(Path_Ensemble_Mean_Princeton),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton

Fig3b_Plotting(GridscPDSI_Princeton_CMIP , Path_Fig3_Output)