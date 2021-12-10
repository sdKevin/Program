clc; clear all; close all;

%% (1) Setting the input/output paths
% CMIP6 Ensemble Terrestrial Data
InputPath_CMIP6_Ensemble = 'D:\CMIP6\ProcessData\Ensemble_Land';
% Bias-Correction Source waiting for updata
% InputPath_CDR= 'D:\CMIP6\ProcessData\Climate Data Record (CDR)';
% Save Terrestrial Vegetation variables
OutputPath_VegVar = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Veg';

%% (2) ScenarioMIP Experiment
% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3-Veg',...
    'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'NorESM2-MM','UKESM1-0-LL'};
ssp = input('Choose a Scenario (ssp126/ssp245/ssp370/ssp585) : ','s');
for i_GCM = 1 : length(GCM_Ensemble)
    if mean(ssp == 'ssp370') == 1 && i_GCM == 11
        continue; % HadGEM3-GC31-LL does not have ssp370
    end
    %     %% (2.1) Generate bias correction coefficient
    %     %% (2.1.1) load CMIP6 Historical Data
        GCM = GCM_Ensemble{i_GCM}
    %     load(strcat(InputPath_CMIP6_Ensemble , '\Historical\' , GCM , '.mat'));
    %     % Set some abnormal orginal data (<0) to 0
    %     r1.evspsbl(r1.evspsbl<0) = 0;
    %     %% (2.1.2) Interpolating Forcing Data to Uniform Resolution i.e., 0.5deg
    %     % Load Global 0.5 Degree Coordinate Data from Princeton-CDR
    %     load LandInfo_05deg;
    %     % Bilinear Interpolation Unit kg/(m2s)
    %     R1.lat = lat_05deg; R1.lon = lon_05deg;
    %     for ii = 1 : size(r1.evspsbl,3)
    %         R1.evspsbl(:,:,ii) = interp2(r1.lat , r1.lon , r1.evspsbl(:,:,ii) ,...
    %             lat_05deg , lon_05deg) .* landmask_05deg;
    %     end
    %     clear r1 ii elevation_05deg
    %     r1 = R1; clear R1
    %
    %     %% (2.1.3) Generate Bias Correction Coefficient
    %     % Princeton-CDR Unit: mm/month and [./  (1000 .* 2592000 ./ 997))] to convert to kg/(m2s)
    %     % evspsbl
    %     load([InputPath_CDR , '\evspsbl.mat']); %1984-2010
    %     % Set some abnormal orginal data (<0) to 0
    %     evspsbl(evspsbl<0) = 0;
    %     C.evspsbl = (nanmean(evspsbl,3) ./  (1000 .* 2592000 ./ 997)) ./ nanmean(r1.evspsbl(:,:,1609:1932),3); C.evspsbl(C.evspsbl>10)=10; clear evspsbl;
    %     clear r1
    
    %% (2.2) Load ssp Data
    load(strcat(InputPath_CMIP6_Ensemble , '\ScenarioMIP\' , ssp , '\',GCM,'.mat'));
    % Set some abnormal orginal data (<0) to 0
    r1.lai(r1.lai<0) = 0;
    try
        % ScenarioMIP of NorESM2-MM is from 201502-210012
        if min(GCM == 'NorESM2-MM')
            r1.lai = cat(3 , r1.lai(:,:,1) , r1.lai);
        end
    catch
    end
    %% (2.3) Interpolating Forcing Data to Uniform Resolution i.e., 0.5deg
    % Load Global 0.5 Degree Coordinate Data from Princeton data
    load LandInfo_05deg
    R1.lat = lat_05deg;
    R1.lon = lon_05deg;
    for ii = 1 : size(r1.lai,3)
        R1.lai(:,:,ii) = interp2(r1.lat , r1.lon , r1.lai(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
    end
    clear r1 ii elevation_05deg
    r1 = R1; clear R1
    
    %     %% (2.4) Bias Correction : Correct CMIP6 ScenarioMIP Data
    %     for ii = 1 : size(r1.evspsbl,3)
    %         r1.evspsbl(:,:,ii) = r1.evspsbl(:,:,ii) .* C.evspsbl;
    %         r1.mrro(:,:,ii) = r1.mrro(:,:,ii) .* C.mrro;
    %     end
    %     clear ii
    
    save(strcat(OutputPath_VegVar , '\ScenarioMIP_' , ssp , '\Veg_Var_' , ...
        ssp , '_',GCM),'r1'); % Unit (-)
end