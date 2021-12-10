%% Figure 2
%% Spatial change of Pr linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_Ensemble_Mean.mat';
Path_Ensemble_Mean_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Princeton\Ensemble_Mean.mat';
Path_Fig2_Output = 'Fig2_Output\';

GridAI_Princeton_CMIP = cat(2,load(Path_Ensemble_Mean_Princeton),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton
% Pr Input mm/year Output mm/(year2)
Fig2a_Plotting(GridAI_Princeton_CMIP , Path_Fig2_Output)

%% Spatial change of Q linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\Historical\Land_Var_Historical_Ensemble_Land_Var_Mrro.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp126\Land_Var_ssp126_Ensemble_Land_Var_Mrro.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp245\Land_Var_ssp245_Ensemble_Land_Var_Mrro.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_Ensemble_Land_Var_Mrro.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp585\Land_Var_ssp585_Ensemble_Land_Var_Mrro.mat';
Path_Fig2_Output = 'Fig2_Output\';

GridQ_CMIP = cat(2,load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton
% Q Input (kg/(m2s)) Output mm/(year2)
Fig2b_Plotting(GridQ_CMIP , Path_Fig2_Output)

%% Spatial change of SM linear trend
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\Historical\Land_Var_Historical_Ensemble_Land_Var_Mrso.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp126\Land_Var_ssp126_Ensemble_Land_Var_Mrso.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp245\Land_Var_ssp245_Ensemble_Land_Var_Mrso.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_Ensemble_Land_Var_Mrso.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp585\Land_Var_ssp585_Ensemble_Land_Var_Mrso.mat';
Path_Fig2_Output = 'Fig2_Output\';

GridSM_CMIP = cat(2,load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton
% SM Input (kg/(m)) Output mm/(year)
Fig2c_Plotting(GridSM_CMIP , Path_Fig2_Output)

%% Spatial change of Pr-ET linear trend
% Input Pr (mm/year)
clc; clear all; close all;
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_Ensemble_Mean.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_Ensemble_Mean.mat';

GridAI_CMIP = cat(2,load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton

% Input ET (kg/(m2s))
Path_Ensemble_Mean_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\Historical\Land_Var_Historical_Ensemble_Land_Var_Evspsbl.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp126\Land_Var_ssp126_Ensemble_Land_Var_Evspsbl.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp245\Land_Var_ssp245_Ensemble_Land_Var_Evspsbl.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_Ensemble_Land_Var_Evspsbl.mat';
Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp585\Land_Var_ssp585_Ensemble_Land_Var_Evspsbl.mat';
Path_Fig2_Output = 'Fig2_Output\';

GridET_CMIP = cat(2,load(Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM),...
    load(Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM),load(Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM),...
    load(Path_Ensemble_Mean_Historical_GCM));

clear Path_Ensemble_Mean_Historical_GCM Path_Ensemble_Mean_ScenarioMIP_ssp126_GCM Path_Ensemble_Mean_ScenarioMIP_ssp245_GCM
clear Path_Ensemble_Mean_ScenarioMIP_ssp370_GCM Path_Ensemble_Mean_ScenarioMIP_ssp585_GCM Path_Ensemble_Mean_Princeton

% Calculate Pr-ET (mm/year)
for ii = 1:5
    GridPr_ET_CMIP(ii).Ensemble_Land_Var_Pr_Evspsbl = GridAI_CMIP(ii).Ensemble_AI.pr - GridET_CMIP(ii).Ensemble_Land_Var_Evspsbl .* 1000.*31536000./997;
end
clear ii GridAI_CMIP GridET_CMIP

% Pr-ET Input mm/year Output mm/(year2)
Fig2d_Plotting(GridPr_ET_CMIP , Path_Fig2_Output)
