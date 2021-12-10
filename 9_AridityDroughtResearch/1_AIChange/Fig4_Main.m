%% Figure 4
% Spatial change of AI percentage change
clc; clear all; close all;
Path_PerChange_ssp126_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp126.mat';
Path_PerChange_ssp245_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp245.mat';
Path_PerChange_ssp370_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp370.mat';
Path_PerChange_ssp585_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp585.mat';
Path_Fig4_Output = 'Fig4_Output\';

PerChange = cat(2,...
    load(Path_PerChange_ssp126_GCM),load(Path_PerChange_ssp245_GCM),...
    load(Path_PerChange_ssp370_GCM),load(Path_PerChange_ssp585_GCM));

clear Path_PerChange_ssp126_GCM Path_PerChange_ssp245_GCM Path_PerChange_ssp370_GCM Path_PerChange_ssp585_GCM

% Fig4a 2070-2099 minus 1948-2014
Ensemble_Mean_PerChange = Fig4a_Plotting(PerChange , Path_Fig4_Output);

% Fig4b Jarvis Latitudinal Distribution
Input(1).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(1).Ensemble_Mean_PerChange_AI_Jarvis;
Input(2).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(2).Ensemble_Mean_PerChange_AI_Jarvis;
Input(3).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(3).Ensemble_Mean_PerChange_AI_Jarvis;
Input(4).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(4).Ensemble_Mean_PerChange_AI_Jarvis;
FigName = 'Fig4b(AI_Jarvis).png';
Fig4b_Plotting(Input,FigName)
clear Input FigName
close all

% Fig4b Yang Latitudinal Distribution
Input(1).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(1).Ensemble_Mean_PerChange_AI_Yang;
Input(2).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(2).Ensemble_Mean_PerChange_AI_Yang;
Input(3).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(3).Ensemble_Mean_PerChange_AI_Yang;
Input(4).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(4).Ensemble_Mean_PerChange_AI_Yang;
FigName = 'Fig4b(AI_Yang).png';
Fig4b_Plotting(Input,FigName)
clear Input FigName
close all

% Fig4b FAO Latitudinal Distribution
Input(1).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(1).Ensemble_Mean_PerChange_AI_FAO;
Input(2).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(2).Ensemble_Mean_PerChange_AI_FAO;
Input(3).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(3).Ensemble_Mean_PerChange_AI_FAO;
Input(4).Ensemble_Mean_PerChange_AI = Ensemble_Mean_PerChange(4).Ensemble_Mean_PerChange_AI_FAO;
FigName = 'Fig4b(AI_FAO).png';
Fig4b_Plotting(Input,FigName)
clear Input FigName
close all