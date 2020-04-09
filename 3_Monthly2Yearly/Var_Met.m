clc; clear all; close all;

%% Setting the input/output paths
% CMIP6 Historical Meteorological Data
InputPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\Historical\Met_Var_Historical_';
OutputPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Historical\Met_Var_Historical_';
% CMIP6 ScenarioMIP ssp126 Meteorological Data
InputPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_';
OutputPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_';
% CMIP6 ScenarioMIP ssp245 Meteorological Data
InputPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_';
OutputPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_';
% CMIP6 ScenarioMIP ssp370 Meteorological Data
InputPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_';
OutputPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_';
% CMIP6 ScenarioMIP ssp585 Meteorological Data
InputPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_';
OutputPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_';

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
        % Name of Global Climate Model
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
        for ii = 1 : 12 : size(Met_Var.Sg , 3)
            % Sg
            A = Met_Var.Sg(:,:,ii:ii+11);
            GridYear.Sg(:,:,iii) = nanmean(A,3);
            % Ta
            B = Met_Var.Ta(:,:,ii:ii+11);
            GridYear.Ta(:,:,iii) = nanmean(B,3);
            % VPD
            C = Met_Var.VPD(:,:,ii:ii+11);
            GridYear.VPD(:,:,iii) = nanmean(C,3);
            % CO2
            D = Met_Var.CO2(:,:,ii:ii+11);
            GridYear.CO2(:,:,iii) = nanmean(D,3);
            % U2
            E = Met_Var.U2(:,:,ii:ii+11);
            GridYear.U2(:,:,iii) = nanmean(E,3);
            % pr
            F = Met_Var.pr(:,:,ii:ii+11);
            GridYear.pr(:,:,iii) = nanmean(F,3);
            clear A B C D E F
            iii = iii+1;
        end
        clear ii iii;
        % Yearly Grid to Yearly series : Met_Year
        for ii = 1:size(GridYear.Sg,3)
            A = GridYear.Sg(:,:,ii); Met_Year.Sg(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.Ta(:,:,ii); Met_Year.Ta(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.VPD(:,:,ii); Met_Year.VPD(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CO2(:,:,ii); Met_Year.CO2(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.U2(:,:,ii); Met_Year.U2(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.pr(:,:,ii); Met_Year.pr(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii Met_Var
        Met_Var = GridYear; clear GridYear;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputPath{i_Path} , GCM) , 'Met_Var');
        clear Met_Var GCM
    end
    clear GCM i_GCM
    save(strcat(OutputPath{i_Path} , 'Met_Year') , 'Met_Year');
end

%% (2) Integrate Monthly Princeton data to yearly data
clc; clear all; close all;
% CMIP6 Princeton Meteorological Data
InputPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\Princeton\Met_Var_Princeton.mat';
OutputPath_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Princeton\';

load(InputPath_Princeton);
% Monthly Grid to Yearly Grid : GridYear
iii = 1;
for ii = 1:12:size(Met_Var.Sg,3)
    % Sg
    A = Met_Var.Sg(:,:,ii:ii+11);
    GridYear.Sg(:,:,iii) = nanmean(A,3);
    % Ta
    B = Met_Var.Ta(:,:,ii:ii+11);
    GridYear.Ta(:,:,iii) = nanmean(B,3);
    % VPD
    C = Met_Var.VPD(:,:,ii:ii+11);
    GridYear.VPD(:,:,iii) = nanmean(C,3);
    % CO2
    D = Met_Var.CO2(:,:,ii:ii+11);
    GridYear.CO2(:,:,iii) = nanmean(D,3);
    % U2
    E = Met_Var.U2(:,:,ii:ii+11);
    GridYear.U2(:,:,iii) = nanmean(E,3);
    % pr
    F = Met_Var.pr(:,:,ii:ii+11);
    GridYear.pr(:,:,iii) = nanmean(F,3);
    clear A B C D E F
    iii = iii+1;
end
clear ii iii;
% Yearly Grid to Yearly series : Met_Year
for ii = 1 : size(GridYear.Sg , 3)
    A = GridYear.Sg(:,:,ii); Met_Year.Sg(ii) = nanmean(A(:)); clear A;
    A = GridYear.Ta(:,:,ii); Met_Year.Ta(ii) = nanmean(A(:)); clear A;
    A = GridYear.VPD(:,:,ii); Met_Year.VPD(ii) = nanmean(A(:)); clear A;
    A = GridYear.CO2(:,:,ii); Met_Year.CO2(ii) = nanmean(A(:)); clear A;
    A = GridYear.U2(:,:,ii); Met_Year.U2(ii) = nanmean(A(:)); clear A;
    A = GridYear.pr(:,:,ii); Met_Year.pr(ii) = nanmean(A(:)); clear A;
end
clear ii Met_Var
Met_Var = GridYear; clear GridYear;
%% (1.2) Output GridYear from 1850-2100
save(strcat(OutputPath_Princeton , 'Met_Var_Princeton') , 'Met_Var');
clear Met_Var
save(strcat(OutputPath_Princeton , 'Met_Year_Princeton') , 'Met_Year');