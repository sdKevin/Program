%% Figure 1
%%% Figure 1a
clc; clear all; close all;
Path_DryWetRegion_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_DryWetRegion_Year.mat';
Path_DryWetRegion_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_DryWetRegion_Year.mat';
Path_DryWetRegion_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Princeton\DryWetRegion_Year_Princeton.mat';

CMIP_DryWetRegion = cat(2,load(Path_DryWetRegion_Historical_GCM),...
    load(Path_DryWetRegion_ScenarioMIP_ssp126_GCM),load(Path_DryWetRegion_ScenarioMIP_ssp245_GCM),...
    load(Path_DryWetRegion_ScenarioMIP_ssp370_GCM),load(Path_DryWetRegion_ScenarioMIP_ssp585_GCM));

% Plotting Global Cold Regions under different scenarios
Fig1a_ColdLands_Left_Plotting( CMIP_DryWetRegion , Path_DryWetRegion_Princeton );
Fig1a_ColdLands_Right_Plotting( CMIP_DryWetRegion );

%%% Figure 1b
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_Ensemble_Mean.mat';
Path_Ensemble_Mean_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Princeton\Ensemble_Mean.mat';
Path_Fig1b_Output = 'Fig1b_Output\';

GridAI_Princeton_ScenarioMIP = cat(2,load(Path_Ensemble_Mean_Princeton),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM));

Fig1b_Plotting(GridAI_Princeton_ScenarioMIP , Path_Fig1b_Output)

