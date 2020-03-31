clc; clear all; close all;

%% Setting the input/output paths
% CMIP6 Historical Meteorological Data
InputPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution\Historical\Attribution_Var_Historical_';
OutputPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\Historical\Attribution_Var_Historical_';
% CMIP6 ScenarioMIP ssp126 Meteorological Data
InputPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution\ScenarioMIP_ssp126\Attribution_Var_ssp126_';
OutputPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp126\Attribution_Var_ssp126_';
% CMIP6 ScenarioMIP ssp245 Meteorological Data
InputPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution\ScenarioMIP_ssp245\Attribution_Var_ssp245_';
OutputPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp245\Attribution_Var_ssp245_';
% CMIP6 ScenarioMIP ssp370 Meteorological Data
InputPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution\ScenarioMIP_ssp370\Attribution_Var_ssp370_';
OutputPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp370\Attribution_Var_ssp370_';
% CMIP6 ScenarioMIP ssp585 Meteorological Data
InputPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution\ScenarioMIP_ssp585\Attribution_Var_ssp585_';
OutputPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\ScenarioMIP_ssp585\Attribution_Var_ssp585_';

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
        for ii = 1 : 12 : size(Attribution_Var.s,3)
            A = Attribution_Var.s(:,:,ii:ii+11);
            GridYear.s(:,:,iii) = nanmean(A,3);
            B = Attribution_Var.lamda(:,:,ii:ii+11);
            GridYear.lamda(:,:,iii) = nanmean(B,3);
            C = Attribution_Var.gamma(:,:,ii:ii+11);
            GridYear.gamma(:,:,iii) = nanmean(C,3);
            D = Attribution_Var.rs_H(:,:,ii:ii+11);
            GridYear.rs_H(:,:,iii) = nanmean(D,3);
            E = Attribution_Var.rs_Yang(:,:,ii:ii+11);
            GridYear.rs_Yang(:,:,iii) = nanmean(E,3);
            F = Attribution_Var.ra(:,:,ii:ii+11);
            GridYear.ra(:,:,iii) = nanmean(F,3);
            AA = Attribution_Var.ea(:,:,ii:ii+11);
            GridYear.ea(:,:,iii) = nanmean(AA,3);
            BB = Attribution_Var.pa(:,:,ii:ii+11);
            GridYear.pa(:,:,iii) = nanmean(BB,3);
            CC = Attribution_Var.Ca(:,:,ii:ii+11);
            GridYear.Ca(:,:,iii) = nanmean(CC,3);
            DD = Attribution_Var.Rn_s(:,:,ii:ii+11);
            GridYear.Rn_s(:,:,iii) = nanmean(DD,3);
            EE = Attribution_Var.VPD(:,:,ii:ii+11);
            GridYear.VPD(:,:,iii) = nanmean(EE,3);
            clear A B C D E F AA BB CC DD EE
            iii = iii+1;
        end
        clear ii iii;
        % Yearly Grid to Yearly series : Year1
        for ii = 1 : size(GridYear.s , 3)
            A = GridYear.s(:,:,ii); Attribution_Year.s(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.lamda(:,:,ii); Attribution_Year.lamda(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.gamma(:,:,ii); Attribution_Year.gamma(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.rs_H(:,:,ii); Attribution_Year.rs_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.rs_Yang(:,:,ii); Attribution_Year.rs_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.ra(:,:,ii); Attribution_Year.ra(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.ea(:,:,ii); Attribution_Year.ea(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.pa(:,:,ii); Attribution_Year.pa(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.Ca(:,:,ii); Attribution_Year.Ca(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.Rn_s(:,:,ii); Attribution_Year.Rn_s(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.VPD(:,:,ii); Attribution_Year.VPD(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii Attribution_Var
        Attribution_Var = GridYear; clear GridYear;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputPath{i_Path} , GCM) , 'Attribution_Var');
        clear Attribution_Var GCM
    end
    clear GCM i_GCM
    save(strcat(OutputPath{i_Path} , 'Attribution_Year') , 'Attribution_Year');
end

%% (2) Integrate Monthly Princeton data to yearly data
clc; clear all; close all;
% CMIP6 Princeton Meteorological Data
InputPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Attribution\Princeton\Attribution_Var_Princeton.mat';
OutputPath_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Attribution\Princeton\';

load(InputPath_Princeton);
% Monthly Grid to Yearly Grid : GridYear
iii = 1;
for ii = 1 : 12 : size(Attribution_Var.s,3)
    A = Attribution_Var.s(:,:,ii:ii+11);
    GridYear.s(:,:,iii) = nanmean(A,3);
    B = Attribution_Var.lamda(:,:,ii:ii+11);
    GridYear.lamda(:,:,iii) = nanmean(B,3);
    C = Attribution_Var.gamma(:,:,ii:ii+11);
    GridYear.gamma(:,:,iii) = nanmean(C,3);
    D = Attribution_Var.rs_H(:,:,ii:ii+11);
    GridYear.rs_H(:,:,iii) = nanmean(D,3);
    E = Attribution_Var.rs_Yang(:,:,ii:ii+11);
    GridYear.rs_Yang(:,:,iii) = nanmean(E,3);
    F = Attribution_Var.ra(:,:,ii:ii+11);
    GridYear.ra(:,:,iii) = nanmean(F,3);
    AA = Attribution_Var.ea(:,:,ii:ii+11);
    GridYear.ea(:,:,iii) = nanmean(AA,3);
    BB = Attribution_Var.pa(:,:,ii:ii+11);
    GridYear.pa(:,:,iii) = nanmean(BB,3);
    CC = Attribution_Var.Ca(:,:,ii:ii+11);
    GridYear.Ca(:,:,iii) = nanmean(CC,3);
    DD = Attribution_Var.Rn_s(:,:,ii:ii+11);
    GridYear.Rn_s(:,:,iii) = nanmean(DD,3);
    EE = Attribution_Var.VPD(:,:,ii:ii+11);
    GridYear.VPD(:,:,iii) = nanmean(EE,3);
    clear A B C D E F AA BB CC DD EE
    iii = iii+1;
end
clear ii iii;
% Yearly Grid to Yearly series : Year1
for ii = 1 : size(GridYear.s , 3)
    A = GridYear.s(:,:,ii); Attribution_Year.s(ii) = nanmean(A(:)); clear A;
    A = GridYear.lamda(:,:,ii); Attribution_Year.lamda(ii) = nanmean(A(:)); clear A;
    A = GridYear.gamma(:,:,ii); Attribution_Year.gamma(ii) = nanmean(A(:)); clear A;
    A = GridYear.rs_H(:,:,ii); Attribution_Year.rs_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.rs_Yang(:,:,ii); Attribution_Year.rs_Yang(ii) = nanmean(A(:)); clear A;
    A = GridYear.ra(:,:,ii); Attribution_Year.ra(ii) = nanmean(A(:)); clear A;
    A = GridYear.ea(:,:,ii); Attribution_Year.ea(ii) = nanmean(A(:)); clear A;
    A = GridYear.pa(:,:,ii); Attribution_Year.pa(ii) = nanmean(A(:)); clear A;
    A = GridYear.Ca(:,:,ii); Attribution_Year.Ca(ii) = nanmean(A(:)); clear A;
    A = GridYear.Rn_s(:,:,ii); Attribution_Year.Rn_s(ii) = nanmean(A(:)); clear A;
    A = GridYear.VPD(:,:,ii); Attribution_Year.VPD(ii) = nanmean(A(:)); clear A;
end
clear ii Attribution_Var
Attribution_Var = GridYear; clear GridYear;
%% (1.2) Output GridYear from 1850-2100
save(strcat(OutputPath_Princeton , 'Attribution_Var_Princeton') , 'Attribution_Var');
clear Attribution_Var
save(strcat(OutputPath_Princeton , 'Attribution_Year_Princeton') , 'Attribution_Year');