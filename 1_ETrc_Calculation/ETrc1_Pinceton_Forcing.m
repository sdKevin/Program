clc; clear all; close all;

%% Setting the input/output paths
% Princeton Global Meteorological Forcing (Princeton-GMFD) Data
InputPath_Princeton = 'D:\CMIP6\ProcessData\Princeton\monthly';
% CMIP6 CO2 Concentration Data
InputPath_CO2 = 'D:\CMIP6\ProcessData\CO2Data';
% Save variables for Attribution Analysis
OutputPath_Attribution = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution';
% Save Meteorological variables
OutputPath_MetVar = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met';
% Save Reference Crop Evapotranspiration (ETrc) Data
OutputPath_ETrc = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc';

%% Princeton-GMFD Data Preparation
% Load Global 0.5 Degree Coordinate Data from Princeton-GMFD
load LandInfo_05deg
% Load Princeton-GMFD
load([InputPath_Princeton , '\huss.mat']); huss = huss .* landmask_05deg; huss(:,:,805:828) = []; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\pr.mat']); pr = pr .* landmask_05deg; pr(:,:,805:828) = []; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\ps.mat']); ps = ps .* landmask_05deg; ps(:,:,805:828) = []; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\rlds.mat']); rlds = rlds .* landmask_05deg; rlds(:,:,805:828) = []; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\rsds.mat']); rsds = rsds .* landmask_05deg; rsds(:,:,805:828) = []; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\sfcWind.mat']); sfcWind = sfcWind .* landmask_05deg; sfcWind(:,:,805:828) = []; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\tas.mat']); tas = tas .* landmask_05deg; tas(:,:,805:828) = []; %1948-2016 to 1948-2014
% load Historical global average CO2 Concentration Series
load([InputPath_CO2 , '\historical_CO2.mat']); historical_CO2(1:98*12) = []; % 1850-2014 to 1948-2014
% Transform global average CO2 Series into well-mixing distributed CO2 series
CO2 = ones(size(huss));
for ii = 1 : length(historical_CO2)
    CO2(:,:,ii) = CO2(:,:,ii) .* landmask_05deg .* historical_CO2(ii);
end
clear ii historical_CO2 elevation_05deg landmask_05deg lat_05deg lon_05deg

%% Calculating ETrc
% [OutputPath_Attribution , '\Princeton'] is for saving Attribution_Var in
% Attribution_Var_Princeton.mat, which is used for attribution analysis
% [OutputPath_MetVar , '\Princeton'] is for saving Met_Var in
% Met_Var_Princeton.mat, which is used for meteorological variables analysis
PM_RC = Penman_Mothith(rsds , rlds , sfcWind , tas , huss , ps);
[PM_RC_CO2_Yang , PM_RC_CO2_Jarvis_H , PM_RC_CO2_Jarvis_L] =...
    Penman_Mothith_CO2(rsds , rlds , sfcWind , tas , huss , ps , CO2, pr ,...
    [OutputPath_Attribution , '\Princeton'] , [OutputPath_MetVar , '\Princeton'] , 'Princeton');

%% Save the result
% strcat(OutputPath_ETrc , '\Princeton\ETrc') is for saving 'PM_RC','PM_RC_CO2_Yang','PM_RC_CO2_Jarvis_H','PM_RC_CO2_Jarvis_L' in
% ETrc_Princeton.mat, which is the reference crop evapotranspiration calculated by different methods
save(strcat(OutputPath_ETrc , '\Princeton\ETrc_Princeton'),...
    'PM_RC','PM_RC_CO2_Yang','PM_RC_CO2_Jarvis_H','PM_RC_CO2_Jarvis_L');

clear CO2 PM_RC PM_RC_CO2_Yang PM_RC_CO2_Jarvis_H PM_RC_CO2_Jarvis_L