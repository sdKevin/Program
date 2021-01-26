%% Figure 3
clc; clear all; close all;
Path_PerChange_ssp126_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp126.mat';
Path_PerChange_ssp245_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp245.mat';
Path_PerChange_ssp370_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp370.mat';
Path_PerChange_ssp585_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp585.mat';
Path_Fig3_Output = 'Fig3_Output\';

PerChange = cat(2,...
    load(Path_PerChange_ssp126_GCM),load(Path_PerChange_ssp245_GCM),...
    load(Path_PerChange_ssp370_GCM),load(Path_PerChange_ssp585_GCM));

% Fig3a
Ensemble_Mean_PerChange = Fig3a_Plotting(PerChange , Path_Fig3_Output);
% Fig3b
Fig3b_Plotting(Ensemble_Mean_PerChange)
close all