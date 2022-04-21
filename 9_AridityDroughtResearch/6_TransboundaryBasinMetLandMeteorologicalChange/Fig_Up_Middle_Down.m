%% Figure Timeseries
clc; clear all; close all;
%% Read the boundary file
% Upstream
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\GlobalSubbasin_Clip_UpStream.shp';
GlobalTransboundary(1) = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary
% Middlestream
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\GlobalSubbasin_Clip_MiddleStream.shp';
GlobalTransboundary(2) = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary
% Downstream
Path_GlobalTransboundary = 'G:\TransboundaryRivers\Munia\hess-22-2795-2018-supplement\SBA_shp\GlobalSubbasin_Clip_DownStream.shp';
GlobalTransboundary(3) = shaperead(Path_GlobalTransboundary);
clear Path_GlobalTransboundary
for i_up_middle_down = 1 : size(GlobalTransboundary,2)
    %% Setting the input/output paths
    % CMIP6 Historical Met Data
    InputMetDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\Met_Land_Historical_';
    % CMIP6 ScenarioMIP ssp126 Data
    InputMetDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\Met_Land_ssp126_';
    % CMIP6 ScenarioMIP ssp245 Data
    InputMetDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_';
    % CMIP6 ScenarioMIP ssp370 Data
    InputMetDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\Met_Land_ssp370_';
    % CMIP6 ScenarioMIP ssp585 Data
    InputMetDroughtPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\Met_Land_ssp585_';
    
    % Extract GlobalTransboundary
    load LandInfo_05deg.mat
    Lon_05deg(1:360,:) = lon_05deg(361:end,:) - 360; Lon_05deg(361:720,:) = lon_05deg(1:360,:); % Adjust longitude from 0-360 to -180-180
    in = inpolygon(lat_05deg , Lon_05deg , GlobalTransboundary(i_up_middle_down).Y , GlobalTransboundary(i_up_middle_down).X); clear Lon_05deg;
    
    %% Calculating Drought Frequency
    for i_Path = 1 : length(InputMetDroughtPath)
        if i_Path == 4
            % Name of Global Climate Model
            GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
                'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
                'GISS-E2-1-G','INM-CM4-8',...
                'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
                'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
        else
            % Name of Global Climate Model, since HadGEM3-GC31-LL model does
            % not have ssp370
            GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
                'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
                'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
                'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
                'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
        end
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
        if i_Path == 4
            % Name of Global Climate Model
            GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
                'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
                'GISS-E2-1-G','INM-CM4-8',...
                'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
                'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
        else
            % Name of Global Climate Model, since HadGEM3-GC31-LL model does
            % not have ssp370
            GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
                'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
                'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
                'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
                'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
        end
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
        if i_Path == 4
            % Name of Global Climate Model
            GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
                'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
                'GISS-E2-1-G','INM-CM4-8',...
                'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
                'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
        else
            % Name of Global Climate Model, since HadGEM3-GC31-LL model does
            % not have ssp370
            GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
                'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
                'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
                'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
                'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
        end
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
    if i_up_middle_down == 1
        save('Met_Drought_Frequency_Intensity_Extent_UpStream' , 'Met_Drought_Frequency_Year' , 'Met_Drought_Intensity_Year' , 'Met_Drought_Extent_Year'); clearvars -except GlobalTransboundary
    elseif i_up_middle_down == 2
        save('Met_Drought_Frequency_Intensity_Extent_MiddleStream' , 'Met_Drought_Frequency_Year' , 'Met_Drought_Intensity_Year' , 'Met_Drought_Extent_Year'); clearvars -except GlobalTransboundary
    else
        save('Met_Drought_Frequency_Intensity_Extent_DownStream' , 'Met_Drought_Frequency_Year' , 'Met_Drought_Intensity_Year' , 'Met_Drought_Extent_Year'); clearvars -except GlobalTransboundary
    end
end

%% Plotting
clc; clear all; close all;
% Up
load Met_Drought_Frequency_Intensity_Extent_UpStream
[Extent , Intensity , Frequency] = Fig_Up_Middle_Down_Statistical(Met_Drought_Extent_Year , Met_Drought_Intensity_Year , Met_Drought_Frequency_Year);
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Extent' , 'Extent' , 'B2:J2');
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Intensity' , 'Intensity' , 'B2:J2');
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Frequency'.*10 , 'Frequency' , 'B2:J2'); % months per decade
% Middle
load Met_Drought_Frequency_Intensity_Extent_MiddleStream
[Extent , Intensity , Frequency] = Fig_Up_Middle_Down_Statistical(Met_Drought_Extent_Year , Met_Drought_Intensity_Year , Met_Drought_Frequency_Year);
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Extent' , 'Extent' , 'B3:J3');
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Intensity' , 'Intensity' , 'B3:J3');
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Frequency'.*10 , 'Frequency' , 'B3:J3'); % months per decade
% Down
load Met_Drought_Frequency_Intensity_Extent_DownStream
[Extent , Intensity , Frequency] = Fig_Up_Middle_Down_Statistical(Met_Drought_Extent_Year , Met_Drought_Intensity_Year , Met_Drought_Frequency_Year);
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Extent' , 'Extent' , 'B4:J4');
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Intensity' , 'Intensity' , 'B4:J4');
xlswrite(['Basins_Up_Middle_Down_Statistical.xlsx'] , Frequency'.*10 , 'Frequency' , 'B4:J4'); % months per decade














subplot(3,1,1)
Fig_Timeseries_Extent(Met_Drought_Extent_Year)
subplot(3,1,2)
Fig_Timeseries_Intensity(Met_Drought_Intensity_Year)
subplot(3,1,3)
Fig_Timeseries_Frequency(Met_Drought_Frequency_Year)
