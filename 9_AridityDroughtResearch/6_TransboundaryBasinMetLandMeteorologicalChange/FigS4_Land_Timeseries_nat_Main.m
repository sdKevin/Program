%% Figure Timeseries
clc; clear all; close all;
%% Setting the input/output paths
% CMIP6 hist-nat Met Data
InputMetDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\hist_nat\Met_Land_hist_nat_';
% CMIP6 ssp245-nat Data
InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ssp245_nat\Met_Land_ssp245_nat_';
% CMIP6 piControl Data
InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\piControl\Met_Land_piControl_';

% Extract GlobalTransboundary
load LandInfo_05deg.mat
Lon_05deg(1:360,:) = lon_05deg(361:end,:) - 360; Lon_05deg(361:720,:) = lon_05deg(1:360,:);
in(1:360,:) = landmask_05deg(361:end,:); in(361:720,:) = landmask_05deg(1:360,:);  % Adjust longitude from 0-360 to -180-180
in(isnan(in))=0; in = logical(in);

%% Calculating Drought Frequency
for i_Path = 1 : length(InputMetDroughtPath)
    % Name of Global Climate Model
    GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};
    
    for i_GCM = 1 : length(GCM_Ensemble)
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputMetDroughtPath{i_Path} , GCM , '_DroughtFrequency_Year.mat'));
        for i_Year = 1 : size(DroughtFrequency_Year.CompoundDrought,3)
            AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            Met_Drought_Frequency_Year(i_Path).DroughtFrequency_Year.CompoundDrought(i_GCM,i_Year) = nanmean(BB(in));
            clear BB
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM
end

%% Calculating Drought Extent
load EarthLandArea_05deg.mat
XX(1:360,:) = EarthLandArea_05deg(361:end,:) - 360; XX(361:720,:) = EarthLandArea_05deg(1:360,:); % Adjust longitude from 0-360 to -180-180
EarthLandArea_05deg = XX; clear XX;
for i_Path = 1 : length(InputMetDroughtPath)
    % Name of Global Climate Model
    GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};
    
    for i_GCM = 1 : length(GCM_Ensemble)
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputMetDroughtPath{i_Path} , GCM , '_DroughtFrequency_Year.mat'));
        for i_Year = 1 : size(DroughtFrequency_Year.CompoundDrought,3)
            AA = DroughtFrequency_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            CC = BB >= 1; clear BB
            Met_Drought_Extent_Year(i_Path).DroughtExtent_Year.CompoundDrought(i_GCM,i_Year) = nansum(EarthLandArea_05deg(CC&in))./nansum(EarthLandArea_05deg(in)) .* 100;
            clear CC BB
        end
        clear GCM i_Year DroughtFrequency_Year
    end
    clear i_GCM
end

%% Calculating Drought Intensity
for i_Path = 1 : length(InputMetDroughtPath)
    % Name of Global Climate Model
    GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};
    
    for i_GCM = 1 : length(GCM_Ensemble)
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputMetDroughtPath{i_Path} , GCM , '_DroughtIntensity_Year.mat'));
        for i_Year = 1 : size(DroughtIntensity_Year.CompoundDrought,3)
            AA = DroughtIntensity_Year.CompoundDrought(:,:,i_Year);
            BB(1:360,:) = AA(361:end,:); BB(361:720,:) = AA(1:360,:); clear AA;  % Adjust longitude from 0-360 to -180-180
            Met_Drought_Intensity_Year(i_Path).DroughtIntensity_Year.CompoundDrought(i_GCM,i_Year) = nanmean(BB(in));
            clear BB
        end
        clear GCM i_Year DroughtIntensity_Year DroughtIntensity_Month
    end
    clear i_GCM
end
Met_Drought_nat_Frequency_Year = Met_Drought_Frequency_Year;
Met_Drought_nat_Intensity_Year = Met_Drought_Intensity_Year;
Met_Drought_nat_Extent_Year = Met_Drought_Extent_Year;
save('Met_Drought_nat_Land_Frequency_Intensity_Extent' , 'Met_Drought_nat_Frequency_Year' , 'Met_Drought_nat_Intensity_Year' , 'Met_Drought_nat_Extent_Year');

%% Plotting
clc; clear all; close all;
load Met_Drought_nat_Land_Frequency_Intensity_Extent
load Met_Drought_Land_Frequency_Intensity_Extent

subplot(3,3,[1,2])
FigS4_Land_Timeseries_nat_Extent(Met_Drought_Extent_Year , Met_Drought_nat_Extent_Year)
subplot(3,3,[4,5])
FigS4_Land_Timeseries_nat_Intensity(Met_Drought_Intensity_Year , Met_Drought_nat_Intensity_Year)
subplot(3,3,[7,8])
FigS4_Land_Timeseries_nat_Frequency(Met_Drought_Frequency_Year , Met_Drought_nat_Frequency_Year)

% Plot Contribution
figure
Contribution = [(10.2-9.59)/(18.6-9.36)*100 , 0.55/(18.6-9.36)*100 , 100-(10.2-9.59)/(18.6-9.36)*100-0.55/(18.6-9.36)*100;
    (0.0578-0.0571)/(0.0614-0.0564)*100 , 0.00055/(0.0614-0.0564)*100 , 100-(0.0578-0.0571)/(0.0614-0.0564)*100-0.00055/(0.0614-0.0564)*100;
    (1.24-1.1)/(2.38-0.978)*100 , 0.072/(2.38-0.978)*100 , 100-(1.24-1.1)/(2.38-0.978)*100-0.072/(2.38-0.978)*100;];

explode = [1 1 0];
subplot(3,1,1)
F1 = donut(Contribution(1,:),explode);
colormap([99,100,173;125,125,125;159,73,116]./255);
F1(2).Color = [99,100,173]./255; F1(4).Color = [125,125,125]./255; F1(6).Color = [159,73,116]./255;
legend({'Forced natural climate variability'},...
    'Color','None','EdgeColor','None','TextColor',[99,100,173]./255)

subplot(3,1,2)
F2 = donut(Contribution(2,:),explode);
colormap([99,100,173;125,125,125;159,73,116]./255);
F2(2).Color = [99,100,173]./255; F2(4).Color = [125,125,125]./255; F2(6).Color = [159,73,116]./255;
legend({'','Unforced natural climate variability'},...
    'Color','None','EdgeColor','None','TextColor',[125,125,125]./255)

subplot(3,1,3)
F3 = donut(Contribution(3,:),explode);
colormap([99,100,173;125,125,125;159,73,116]./255);
F3(2).Color = [99,100,173]./255; F3(4).Color = [125,125,125]./255; F3(6).Color = [159,73,116]./255;
legend({'','','Anthropogenic climate change'},...
    'Color','None','EdgeColor','None','TextColor',[159,73,116]./255)
