clc; clear all; close all;

%% (1) Setting the input/output paths
% CMIP6 Ensemble Meteorological Data
InputPath_CMIP6_Ensemble = 'D:\CMIP6\ProcessData\Ensemble_Land';
% Climate Data Record includes water balance fluxes
InputPath_CDR= 'D:\CMIP6\ProcessData\Climate Data Record (CDR)';
% Save Meteorological variables
OutputPath_LandVar = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land';

%% (2) ScenarioMIP Experiment
% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
ssp = input('Choose a Scenario (ssp126/ssp245/ssp370/ssp585) : ','s');
for i_GCM = 1 : length(GCM_Ensemble)
    %% (2.1) Generate bias correction coefficient
    %% (2.1.1) load CMIP6 Historical Data
    GCM = GCM_Ensemble{i_GCM}
    load(strcat(InputPath_CMIP6_Ensemble , '\Historical\' , GCM , '.mat'));
    %% (2.1.2) Interpolating Forcing Data to Uniform Resolution i.e., 0.5deg
    % Load Global 0.5 Degree Coordinate Data from Princeton reanalysis
    load LandInfo_05deg;
    % Bilinear Interpolation Unit kg/(m2s)
    R1.lat = lat_05deg; R1.lon = lon_05deg;
    for ii = 1 : size(r1.evspsbl,3)
        R1.evspsbl(:,:,ii) = interp2(r1.lat , r1.lon , r1.evspsbl(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.mrso(:,:,ii) = interp2(r1.lat , r1.lon , r1.mrso(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.mrro(:,:,ii) = interp2(r1.lat , r1.lon , r1.mrro(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
    end
    clear r1 ii elevation_05deg
    r1 = R1; clear R1
    
    %% (2.1.3) Generate Bias Correction Coefficient
    % CDR Unit: mm/month
    load([InputPath_CDR , '\evspsbl.mat']); %1984-2010
    C.evspsbl = (nanmean(evspsbl,3) ./  (1000 .* 2592000 ./ 997)) ./ nanmean(r1.evspsbl(:,:,1609:1932),3); C.evspsbl(C.evspsbl>10)=10; clear evspsbl;
    load([InputPath_CDR , '\mrro.mat']); %1984-2010
    C.mrro = (nanmean(mrro,3) ./  (1000 .* 2592000 ./ 997)) ./ nanmean(r1.mrro(:,:,1609:1932),3); C.mrro(C.mrro>10)=10; clear mrro;
    clear r1
    
    %% (2.2) Load ssp Data
    load(strcat(InputPath_CMIP6_Ensemble , '\ScenarioMIP\' , ssp , '\',GCM,'.mat'))
    
    %% (2.3) Interpolating Forcing Data to Uniform Resolution i.e., 0.5deg
    % Load Global 0.5 Degree Coordinate Data from Princeton reanalysis
    load LandInfo_05deg
    R1.lat = lat_05deg;
    R1.lon = lon_05deg;
    for ii = 1 : size(r1.evspsbl,3)
        R1.evspsbl(:,:,ii) = interp2(r1.lat , r1.lon , r1.evspsbl(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.mrso(:,:,ii) = interp2(r1.lat , r1.lon , r1.mrso(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.mrro(:,:,ii) = interp2(r1.lat , r1.lon , r1.mrro(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
    end
    clear r1 ii elevation_05deg
    r1 = R1; clear R1
    
    %% (2.4) Bias Correction : Correct CMIP6 ScenarioMIP Data
    for ii = 1 : size(r1.evspsbl,3)
        r1.evspsbl(:,:,ii) = r1.evspsbl(:,:,ii) .* C.evspsbl;
        r1.mrro(:,:,ii) = r1.mrro(:,:,ii) .* C.mrro;
    end
    clear ii
    
    save(strcat(OutputPath_LandVar , '\ScenarioMIP_' , ssp , '\Land_Var_' , ...
        ssp , '_',GCM),'r1'); % Unit kg/(m2s)
end