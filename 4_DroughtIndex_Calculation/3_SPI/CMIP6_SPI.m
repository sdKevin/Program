clc; clear all; close all;
% Programmed by Wei Tian, Institute of Geographic Sciences and Natural
% Resources Research, China. Email: tianw.17b@igsnrr.ac.cn

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CMIP6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting the input/output paths
% CMIP6 Historical Data
InputETrcPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\Historical\ETrc_Historical_';
InputMetPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\Historical\Met_Var_Historical_';
OutputSPIPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPI\Historical\SPI_Historical_';
% CMIP6 ScenarioMIP ssp126 Data
InputETrcPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_';
InputMetPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_';
OutputSPIPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPI\ScenarioMIP_ssp126\SPI_ssp126_';
% CMIP6 ScenarioMIP ssp245 Data
InputETrcPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_';
InputMetPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_';
OutputSPIPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPI\ScenarioMIP_ssp245\SPI_ssp245_';
% CMIP6 ScenarioMIP ssp370 Data
InputETrcPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_';
InputMetPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_';
OutputSPIPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPI\ScenarioMIP_ssp370\SPI_ssp370_';
% CMIP6 ScenarioMIP ssp585 Data
InputETrcPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_';
InputMetPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_';
OutputSPIPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPI\ScenarioMIP_ssp585\SPI_ssp585_';

% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};

for i_GCM = 1 : length(GCM_Ensemble)
    GCM = GCM_Ensemble{i_GCM}
    if strcmp(GCM_Ensemble{i_GCM} , 'HadGEM3-GC31-LL') %since HadGEM3-GC31-LL model does not have ssp370
        ssp = [1 , 2 , 4];
    else
        ssp = [1 , 2 , 3 , 4];
    end
    
    %% (1) load historical data (1850-2014)
    % Load Precipitation (kg/(m2s))
    load(strcat(InputMetPath{1} , GCM , '.mat'));
    Pr_hist = Met_Var.pr .* 1000 .* 2592000 ./ 997; % from kg/(m2s) to mm/mon
    clear Met_Var
    
    for i_ssp = 1 : length(ssp)
        %% (2) load SSP data
        % Load Precipitation (kg/(m2s))
        load(strcat(InputMetPath{ssp(i_ssp) + 1} , GCM , '.mat'));
        Pr_ssp = Met_Var.pr .* 1000 .* 2592000 ./ 997; % from kg/(m2s) to mm/mon
        clear Met_Var
        
        %% (3) Concatenate historical data and SSP data
        Pr = cat(3 , Pr_hist , Pr_ssp); Pr(Pr<0) = 0;
        clear Pr_ssp
        
        [m , n , p] = size(Pr);
        cal_mon = p;
        Year = [1850 : 2100]; % Calculation period
        %% (4) Calculate SPI
        for ii = 1 : m
            ii
            for j = 1 : n
                % Extract the precipitation data corresponding to the grid
                data1 = squeeze(Pr(ii,j,[1:cal_mon]));
                
                if nansum(isnan(data1(:,end)))==0
                    % Input data includes [year,month,monthly precipitation]
                    DATA = [DateGens(Year) , data1];
                    % Calculate SPI.
                    % In this case, the calibration period is from 1850 to
                    % 2014; Scale is 3 months.
                    SPI_v = SPIc(DATA , 1850 , 2014 , 3 , 12);
                    
                    if nansum(SPI_v)==0
                        spi_q(ii,j,[1:cal_mon]) = NaN; clear SPI_v;
                    else
                        spi_q(ii,j,[1:cal_mon]) = SPI_v; clear SPI_v;
                    end
                    
                else
                    spi_q(ii,j,[1:cal_mon]) = NaN; clear SPI_v;
                end
                clear data1 DATA
            end
        end
        clear ii j m n p cal_mon Year
        %% (5) Output SPI
        SPI = spi_q(: , : , [1981:end]);
        if i_ssp == 1
            % save SPI for future period
            save(strcat(OutputSPIPath{ssp(i_ssp) + 1} , GCM) , 'SPI');
            clear SPI
            
            % save SPI for historical period
            SPI = spi_q(: , : , [1:1980]);
            
            save(strcat(OutputSPIPath{1} , GCM) , 'SPI');
            clear SPI Pr spi_q
        else
            save(strcat(OutputSPIPath{ssp(i_ssp) + 1} , GCM) , 'SPI');
            clear SPI Pr spi_q
        end
    end
    clear i_ssp ssp GCM Pr_hist
end



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Princeton %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% Setting the input/output paths
InputMetPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\Princeton\Met_Var_Princeton.mat';
OutputSPIPath = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPI\Princeton\SPI_Princeton';

%% (1) load Princeton data (1948-2014)
% Load Precipitation (kg/(m2s))
load(InputMetPath_Princeton);
Pr = Met_Var.pr .* 1000 .* 2592000 ./ 997; % from kg/(m2s) to mm/mon
clear Met_Var

[m , n , p] = size(Pr);
cal_mon = p;
Year = [1948 : 2014]; % Calculation period
%% (2) Calculate SPI
for ii = 1 : m
    ii
    for j = 1 : n
        % Extract the precipitation data corresponding to the grid
        data1 = squeeze(Pr(ii,j,[1:cal_mon]));
        
        if nansum(isnan(data1(:,end)))==0
            % Input data includes [year,month,monthly precipitation]
            DATA = [DateGens(Year) , data1];
            % Calculate SPI.
            % In this case, the calibration period is from 1850 to
            % 2014; Scale is 3 months.
            SPI_v = SPIc(DATA , 1948 , 2014 , 3 , 12);
            
            if nansum(SPI_v)==0
                spi_q(ii,j,[1:cal_mon]) = NaN; clear SPI_v;
            else
                spi_q(ii,j,[1:cal_mon]) = SPI_v; clear SPI_v;
            end
            
        else
            spi_q(ii,j,[1:cal_mon]) = NaN; clear SPI_v;
        end
        clear data1 DATA
    end
end
clear ii j m n p cal_mon Year
%% (3) Output SPI
SPI = spi_q;
% save SPI
save(OutputSPIPath , 'SPI'); clear SPI;