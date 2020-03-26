clc; clear all; close all;

%% Setting the input/output paths
InputPath_Princeton = 'D:\CMIP6\ProcessData\Princeton\monthly';
InputPath_CO2 = 'D:\CMIP6\ProcessData\CO2Data';
OutputPath_Attribution = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution';
OutputPath_MetVar = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met';
OutputPath_ETrc = 'D:\CMIP6\VariableStorage\MonthlyVar\ETrc';

%% Forcing Data Preparation
% Load Global 0.5 Degree Coordinate Data
load LandInfo_05deg
% Load Princeton Meteorological Forcing Data
load([InputPath_Princeton , '\huss.mat']); huss(:,:,805:828)=[]; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\pr.mat']); pr(:,:,805:828)=[]; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\ps.mat']); ps(:,:,805:828)=[]; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\rlds.mat']); rlds(:,:,805:828)=[]; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\rsds.mat']); rsds(:,:,805:828)=[]; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\sfcWind.mat']); sfcWind(:,:,805:828)=[]; %1948-2016 to 1948-2014
load([InputPath_Princeton , '\tas.mat']); tas(:,:,805:828)=[]; %1948-2016 to 1948-2014
% Load global average CO2 Series
load([InputPath_CO2 , '\historical_CO2.mat']); historical_CO2(1 : 98*12)=[];% 1850-2014 to 1948-2014
% Transform global average CO2 Series into well-mixing distributed CO2 series
CO2 = ones(size(huss));
for ii = 1:length(historical_CO2)
    CO2(:,:,ii) = CO2(:,:,ii) .* landmask_05deg .* historical_CO2(ii);
end
clear ii historical_CO2 elevation_05deg landmask_05deg lat_05deg lon_05deg

%% Calculating ETrc
PM_RC = Penman_Mothith(rsds , rlds , sfcWind , tas , huss , ps);
[PM_RC_CO2_Yang , PM_RC_CO2_Jarvis_H , PM_RC_CO2_Jarvis_L] =...
    Penman_Mothith_CO2(rsds , rlds , sfcWind , tas , huss , ps , CO2, pr ,...
    [OutputPath_Attribution , '\Princeton'] , [OutputPath_MetVar , '\Princeton'] , 'Princeton');

%% Save the result
save(strcat(OutputPath_ETrc , '\Princeton\PM_RC_Princeton'),'PM_RC');
save(strcat(OutputPath_ETrc , '\Princeton\PM_RC_CO2_Yang_Princeton'),'PM_RC_CO2_Yang');
save(strcat(OutputPath_ETrc , '\Princeton\PM_RC_CO2_Jarvis_H_Princeton'),'PM_RC_CO2_Jarvis_H');
save(strcat(OutputPath_ETrc , '\Princeton\PM_RC_CO2_Jarvis_L_Princeton'),'PM_RC_CO2_Jarvis_L');
clear CO2 PM_RC PM_RC_CO2_Yang PM_RC_CO2_Jarvis_H PM_RC_CO2_Jarvis_L
