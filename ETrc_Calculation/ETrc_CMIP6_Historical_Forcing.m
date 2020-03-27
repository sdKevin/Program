clc; clear all; close all;

%% (1) Setting the input/output paths
% CMIP6 Ensemble Meteorological Data
InputPath_CMIP6_Ensemble = 'D:\CMIP6\ProcessData\Ensemble_Met';
% CMIP6 CO2 Concentration Data
InputPath_CO2 = 'D:\CMIP6\ProcessData\CO2Data';
% Princeton Meteorological Forcing Reanalysis Data
InputPath_Princeton = 'D:\CMIP6\ProcessData\Princeton\monthly';
% Save variables for Attribution Analysis
OutputPath_Attribution = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution';
% Save Meteorological variables
OutputPath_MetVar = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met';
% Save Reference Crop Evapotranspiration (ETrc) Data
OutputPath_ETrc = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc';

%% (2) Historical Experiment
% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
for i_GCM = 1 : length(GCM_Ensemble)
    %% (2.1) load Data
    GCM = GCM_Ensemble{i_GCM}
    load(strcat(InputPath_CMIP6_Ensemble , '\Historical\' , GCM , '.mat'));
    
    %% (2.2) Interpolating Forcing Data to Uniform Resolution i.e., 0.5deg
    % Load Global 0.5 Degree Coordinate Data from Princeton reanalysis
    load LandInfo_05deg;
    % Bilinear Interpolation
    R1.lat = lat_05deg; R1.lon = lon_05deg;
    for ii = 1 : size(r1.huss,3)
        R1.huss(:,:,ii) = interp2(r1.lat , r1.lon , r1.huss(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.pr(:,:,ii) = interp2(r1.lat , r1.lon , r1.pr(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.ps(:,:,ii) = interp2(r1.lat , r1.lon , r1.ps(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.rlds(:,:,ii) = interp2(r1.lat , r1.lon , r1.rlds(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.rsds(:,:,ii) = interp2(r1.lat , r1.lon , r1.rsds(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.sfcWind(:,:,ii) = interp2(r1.lat , r1.lon , r1.sfcWind(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.tas(:,:,ii) = interp2(r1.lat , r1.lon , r1.tas(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
    end
    clear r1 ii elevation_05deg
    r1 = R1; clear R1
    % load Historical global average CO2 Concentration Series
    load([InputPath_CO2 , '\historical_CO2.mat'])
    % Transform global average CO2 Series into well-mixing distributed CO2 series
    CO2 = ones(size(r1.huss));
    for ii = 1 : length(historical_CO2)
        CO2(:,:,ii) = CO2(:,:,ii) .* landmask_05deg .* historical_CO2(ii);
    end
    clear ii historical_CO2
    
    %% (2.3) Bias Correction : Using Princeton Reanalysis Data to correct CMIP6 Historical Data
    load([InputPath_Princeton , '\huss.mat']);huss(:,:,805:828)=[];%1948-2016 to 1948-2014
    C.huss = nanmean(huss,3) ./ nanmean(r1.huss(:,:,1177:end),3);C.huss(C.huss>10)=10;clear huss;
    load([InputPath_Princeton , '\pr.mat']);pr(:,:,805:828)=[];%1948-2016 to 1948-2014
    C.pr = nanmean(pr,3) ./ nanmean(r1.pr(:,:,1177:end),3);C.pr(C.pr>10)=10;clear pr;
    load([InputPath_Princeton , '\ps.mat']);ps(:,:,805:828)=[];%1948-2016 to 1948-2014
    C.ps = nanmean(ps,3) ./ nanmean(r1.ps(:,:,1177:end),3);C.ps(C.ps>10)=10;clear ps;
    load([InputPath_Princeton , '\rlds.mat']);rlds(:,:,805:828)=[];%1948-2016 to 1948-2014
    C.rlds = nanmean(rlds,3) ./ nanmean(r1.rlds(:,:,1177:end),3);C.rlds(C.rlds>10)=10;clear rlds;
    load([InputPath_Princeton , '\rsds.mat']);rsds(:,:,805:828)=[];%1948-2016 to 1948-2014
    C.rsds = nanmean(rsds,3) ./ nanmean(r1.rsds(:,:,1177:end),3);C.rsds(C.rsds>10)=10;clear rsds;
    load([InputPath_Princeton , '\sfcWind.mat']);sfcWind(:,:,805:828)=[];%1948-2016 to 1948-2014
    C.sfcWind = nanmean(sfcWind,3) ./ nanmean(r1.sfcWind(:,:,1177:end),3);C.sfcWind(C.sfcWind>10)=10;clear sfcWind;
    load([InputPath_Princeton , '\tas.mat']);tas(:,:,805:828)=[];%1948-2016 to 1948-2014
    C.tas = nanmean(tas,3) - nanmean(r1.tas(:,:,1177:end),3);clear tas;
    for ii = 1:size(r1.huss,3)
        r1.huss(:,:,ii) = r1.huss(:,:,ii) .* C.huss;
        r1.pr(:,:,ii) = r1.pr(:,:,ii) .* C.pr;
        r1.ps(:,:,ii) = r1.ps(:,:,ii) .* C.ps;
        r1.rlds(:,:,ii) = r1.rlds(:,:,ii) .* C.rlds;
        r1.rsds(:,:,ii) = r1.rsds(:,:,ii) .* C.rsds;
        r1.sfcWind(:,:,ii) = r1.sfcWind(:,:,ii) .* C.sfcWind;
        r1.tas(:,:,ii) = r1.tas(:,:,ii) + C.tas;
    end
    clear ii
    
    %% (2.4) Calculation Reference Crop Evapotranspiration (ETrc) (mm/day)
    % [OutputPath_Attribution , '\Historical'] is for saving Attribution_Var in
    % Attribution_Var_Historical_GCM.mat, which is used for attribution analysis
    % [OutputPath_MetVar , '\Historical'] is for saving Met_Var in
    % Met_Var_Historical_GCM.mat, which is used for meteorological variables analysis
    PM_RC = Penman_Mothith(r1.rsds , r1.rlds , r1.sfcWind , r1.tas , r1.huss , r1.ps);
    [PM_RC_CO2_Yang , PM_RC_CO2_Jarvis_H , PM_RC_CO2_Jarvis_L] =...
        Penman_Mothith_CO2(r1.rsds , r1.rlds , r1.sfcWind , r1.tas , r1.huss , r1.ps , CO2, r1.pr ,...
        [OutputPath_Attribution , '\Historical'] , [OutputPath_MetVar , '\Historical'] , strcat('Historical_',GCM));
    
    %% (2.5) Save the result
    % strcat(OutputPath_ETrc , '\Historical\ETrc_',GCM) is for saving 'PM_RC','PM_RC_CO2_Yang','PM_RC_CO2_Jarvis_H','PM_RC_CO2_Jarvis_L' in
    % ETrc_GCM.mat, which is the reference crop evapotranspiration calculated by different methods
    save(strcat(OutputPath_ETrc , '\Historical\ETrc_',GCM),...
        'PM_RC','PM_RC_CO2_Yang','PM_RC_CO2_Jarvis_H','PM_RC_CO2_Jarvis_L');
    
    clear C CO2 r1 PM_RC PM_RC_CO2_Yang PM_RC_CO2_Jarvis_H PM_RC_CO2_Jarvis_L
end