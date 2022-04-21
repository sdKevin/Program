clc; clear all; close all;

%% (1) Setting the input/output paths
% CMIP6 DAMIP Data
InputPath_CMIP6_Ensemble = 'D:\CMIP6\ProcessData\DAMIP\hist_nat';
% Save variables
OutputPath_LandVar = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land';

%% (2) Historical Experiment
% Name of Global Climate Model
GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};

for i_GCM = 1 : length(GCM_Ensemble)
    %% (2.1) load Land Data
    GCM = GCM_Ensemble{i_GCM}
    load(strcat(InputPath_CMIP6_Ensemble , '\Land_Data\' , GCM , '.mat'));
    % Set some abnormal orginal data (<0) to 0
    r1.mrso(r1.mrso<0) = 0; r1.mrro(r1.mrro<0) = 0; % r1.evspsbl(r1.evspsbl<0) = 0;
    %% (2.2) Interpolating Forcing Data to Uniform Resolution i.e., 0.5deg
    % Load Global 0.5 Degree Coordinate Data from Princeton-CDR
    load LandInfo_05deg;
    % Bilinear Interpolation Unit: evspsbl & mrro kg/(m2s),mrso kg/(m2)
    R1.lat = lat_05deg; R1.lon = lon_05deg;
    for ii = 1 : size(r1.mrso,3)
        R1.mrso(:,:,ii) = interp2(r1.lat , r1.lon , r1.mrso(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        R1.mrro(:,:,ii) = interp2(r1.lat , r1.lon , r1.mrro(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
        %         R1.evspsbl(:,:,ii) = interp2(r1.lat , r1.lon , r1.evspsbl(:,:,ii) ,...
        %             lat_05deg , lon_05deg) .* landmask_05deg;
    end
    clear r1 ii elevation_05deg
    %% (2.3) load Met Data
    load(strcat(InputPath_CMIP6_Ensemble , '\Met_Data\' , GCM , '.mat'));
    % Set some abnormal orginal data (<0) to 0
    r1.pr(r1.pr<0) = 0;
    %% (2.4) Interpolating Forcing Data to Uniform Resolution i.e., 0.5deg
    % Load Global 0.5 Degree Coordinate Data from Princeton-CDR
    load LandInfo_05deg;
    % Bilinear Interpolation Unit: pr kg/(m2s)
    for ii = 1 : size(r1.pr,3)
        R1.pr(:,:,ii) = interp2(r1.lat , r1.lon , r1.pr(:,:,ii) ,...
            lat_05deg , lon_05deg) .* landmask_05deg;
    end
    clear r1 ii elevation_05deg
    r1 = R1; clear R1
    
    save(strcat(OutputPath_LandVar , '\hist_nat\Met_Land_Var_hist_nat_',GCM),'r1'); % Unit kg/(m2s)
end