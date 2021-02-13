%% Figure 6
%% Spatial change of PDSI calculated drought frequency linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\PDSI_Historical_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\PDSI_ssp126_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\PDSI_ssp245_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\PDSI_ssp370_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\PDSI_ssp585_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Princeton\PDSI_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Fig6a_Output = 'Fig6a_Output\';

GridPDSI_Princeton_CMIP = cat(2,load(Path_Ensemble_Mean_Princeton),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton

Fig6a_Plotting(GridPDSI_Princeton_CMIP , Path_Fig6a_Output)

%% Spatial change of scPDSI calculated drought frequency linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\scPDSI_Historical_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\scPDSI_ssp126_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\scPDSI_ssp245_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\scPDSI_ssp370_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\scPDSI_ssp585_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Ensemble_Mean_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Princeton\scPDSI_Ensemble_Mean_DroughtFrequency_Year.mat';
Path_Fig6b_Output = 'Fig6b_Output\';

GridscPDSI_Princeton_CMIP = cat(2,load(Path_Ensemble_Mean_Princeton),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton

Fig6b_Plotting(GridscPDSI_Princeton_CMIP , Path_Fig6b_Output)