%% Figure 2
clc; clear all; close all;
Path_PerChange_ssp126_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp126.mat';
Path_PerChange_ssp245_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp245.mat';
Path_PerChange_ssp370_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp370.mat';
Path_PerChange_ssp585_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp585.mat';
Path_SoilMicroBiomass = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\SoilMicroBiomass.mat';
Path_Nematodes_05deg = 'D:\CMIP6\ProcessData\ImplicationResearch\SoilMicrobial\Nematodes_05deg.mat';  
Path_AI_PM_RC_CO2_Jarvis_H_Princeton = 'Fig1b_Output\AI_PM_RC_CO2_Jarvis_H_Princeton.mat';
Path_Fig2b2d_Output = 'Fig2b2d_Output\';

PerChange = cat(2,...
    load(Path_PerChange_ssp126_GCM),load(Path_PerChange_ssp245_GCM),...
    load(Path_PerChange_ssp370_GCM),load(Path_PerChange_ssp585_GCM));
SoilMicroBiomass = load(Path_SoilMicroBiomass);
Nematodes = load(Path_Nematodes_05deg);
AI_PM_RC_CO2_Jarvis_H_Princeton = load(Path_AI_PM_RC_CO2_Jarvis_H_Princeton);

% Figure 2a
Ensemble_Mean_PerChange = Fig2b2d_Plotting(PerChange , Path_Fig2b2d_Output);

% Figure 2d
Fig2d_Plotting(PerChange , SoilMicroBiomass , Nematodes , AI_PM_RC_CO2_Jarvis_H_Princeton)

% Figure 2f-g
Fig2fg_Plotting(Ensemble_Mean_PerChange)
close all