%% Figure 2
%%% Figure 2a
clc; clear all; close all;



%%% Figure 2b
clc; clear all; close all;
Path_PerChange_ssp126_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp126.mat';
Path_PerChange_ssp245_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp245.mat';
Path_PerChange_ssp370_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp370.mat';
Path_PerChange_ssp585_GCM = 'D:\CMIP6\VariableStorage\ClimatologicalChange\PerChange_ssp585.mat';
Path_Fig2b2d_Output = 'Fig2b2d_Output\';

PerChange = cat(2,...
    load(Path_PerChange_ssp126_GCM),load(Path_PerChange_ssp245_GCM),...
    load(Path_PerChange_ssp370_GCM),load(Path_PerChange_ssp585_GCM));

Fig2b_Plotting(PerChange , Path_Fig2b2d_Output)

