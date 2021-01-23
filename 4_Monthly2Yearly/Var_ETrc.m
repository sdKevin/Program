clc; clear all; close all;

%% Setting the input/output paths
% CMIP6 Historical Meteorological Data
InputPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\Historical\ETrc_Historical_';
OutputPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Historical\ETrc_Historical_';
% CMIP6 ScenarioMIP ssp126 Meteorological Data
InputPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_';
OutputPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_';
% CMIP6 ScenarioMIP ssp245 Meteorological Data
InputPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_';
OutputPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_';
% CMIP6 ScenarioMIP ssp370 Meteorological Data
InputPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_';
OutputPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_';
% CMIP6 ScenarioMIP ssp585 Meteorological Data
InputPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_';
OutputPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_';

%% (1) Integrate Monthly CMIP6 data to yearly data
for i_Path = 1 : length(InputPath)
    if i_Path == 4
        % Name of Global Climate Model
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    else
        % Name of Global Climate Model, since HadGEM3-GC31-LL model does
        % not have ssp370
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    end
    for i_GCM = 1 : length(GCM_Ensemble)
        %% (1.1) 1850-2014 Historical Year Series
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputPath{i_Path} , GCM , '.mat'));
        % Monthly Grid to Yearly Grid : GridYear
        iii = 1;
        for ii = 1 : 12 : size(PM_RC,3)
            A = PM_RC(:,:,ii:ii+11);
            GridYear.PM_RC(:,:,iii) = nanmean(A,3);
            B = PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3);
            C = PM_RC_CO2_Jarvis_L(:,:,ii:ii+11);
            GridYear.PM_RC_CO2_Jarvis_L(:,:,iii) = nanmean(C,3);
            D = PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.PM_RC_CO2_Yang(:,:,iii) = nanmean(D,3);
            clear A B C D E F AA BB CC DD EE
            iii = iii+1;
        end
        clear ii iii;
        % Yearly Grid to Yearly series : ETrc_Year
        for ii = 1 : size(GridYear.PM_RC , 3)
            A = GridYear.PM_RC(:,:,ii); ETrc_Year.PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.PM_RC_CO2_Jarvis_H(:,:,ii); ETrc_Year.PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.PM_RC_CO2_Jarvis_L(:,:,ii); ETrc_Year.PM_RC_CO2_Jarvis_L(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.PM_RC_CO2_Yang(:,:,ii); ETrc_Year.PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Jarvis_L PM_RC_CO2_Yang
        ETrc = GridYear; clear GridYear;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputPath{i_Path} , GCM) , 'ETrc');
        clear ETrc GCM
    end
    clear i_GCM
    save(strcat(OutputPath{i_Path} , 'ETrc_Year') , 'ETrc_Year');
    clear ETrc_Year
end

%% (2) Integrate Monthly Princeton data to yearly data
clc; clear all; close all;
% Princeton Meteorological Data
InputPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\Princeton\ETrc_Princeton.mat';
OutputPath_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Princeton\';

load(InputPath_Princeton);
% Monthly Grid to Yearly Grid : GridYear
iii = 1;
for ii = 1 : 12 : size(PM_RC,3)
    A = PM_RC(:,:,ii:ii+11);
    GridYear.PM_RC(:,:,iii) = nanmean(A,3);
    B = PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3);
    C = PM_RC_CO2_Jarvis_L(:,:,ii:ii+11);
    GridYear.PM_RC_CO2_Jarvis_L(:,:,iii) = nanmean(C,3);
    D = PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.PM_RC_CO2_Yang(:,:,iii) = nanmean(D,3);
    clear A B C D E F AA BB CC DD EE
    iii = iii+1;
end
clear ii iii;
% Yearly Grid to Yearly series : ETrc_Year
for ii = 1 : size(GridYear.PM_RC , 3)
    A = GridYear.PM_RC(:,:,ii); ETrc_Year.PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.PM_RC_CO2_Jarvis_H(:,:,ii); ETrc_Year.PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.PM_RC_CO2_Jarvis_L(:,:,ii); ETrc_Year.PM_RC_CO2_Jarvis_L(ii) = nanmean(A(:)); clear A;
    A = GridYear.PM_RC_CO2_Yang(:,:,ii); ETrc_Year.PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
end
clear ii PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Jarvis_L PM_RC_CO2_Yang
ETrc = GridYear; clear GridYear;
%% (1.2) Output GridYear from 1850-2100
save(strcat(OutputPath_Princeton , 'ETrc_Princeton') , 'ETrc');
clear ETrc
save(strcat(OutputPath_Princeton , 'ETrc_Year_Princeton') , 'ETrc_Year');
clear ETrc_Year