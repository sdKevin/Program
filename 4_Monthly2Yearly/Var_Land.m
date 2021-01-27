clc; clear all; close all;

%% Setting the input/output paths
% CMIP6 Historical Meteorological Data
InputPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\Historical\Land_Var_Historical_';
OutputPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\Historical\Land_Var_Historical_';
% CMIP6 ScenarioMIP ssp126 Meteorological Data
InputPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ScenarioMIP_ssp126\Land_Var_ssp126_';
OutputPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp126\Land_Var_ssp126_';
% CMIP6 ScenarioMIP ssp245 Meteorological Data
InputPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ScenarioMIP_ssp245\Land_Var_ssp245_';
OutputPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp245\Land_Var_ssp245_';
% CMIP6 ScenarioMIP ssp370 Meteorological Data
InputPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_';
OutputPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_';
% CMIP6 ScenarioMIP ssp585 Meteorological Data
InputPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ScenarioMIP_ssp585\Land_Var_ssp585_';
OutputPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp585\Land_Var_ssp585_';

%% (1) Integrate Monthly CMIP6 data to yearly data
for i_Path = 1 : length(InputPath)
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
        %% (1.1) 1850-2014 Historical Year Series
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputPath{i_Path} , GCM , '.mat'));
        % Monthly Grid to Yearly Grid : GridYear
        iii = 1;
        for ii = 1 : 12 : size(r1.evspsbl , 3)
            % evspsbl
            A = r1.evspsbl(:,:,ii:ii+11);
            A(A==Inf|A==-Inf) = nan; %Set missing grids in original nc file as NAN
            GridYear.evspsbl(:,:,iii) = nanmean(A,3);
            % mrso
            B = r1.mrso(:,:,ii:ii+11);
            B(B==Inf|B==-Inf) = nan; %Set missing grids in original nc file as NAN
            GridYear.mrso(:,:,iii) = nanmean(B,3);
            % mrro
            C = r1.mrro(:,:,ii:ii+11);
            C(C==Inf|C==-Inf) = nan; %Set missing grids in original nc file as NAN
            GridYear.mrro(:,:,iii) = nanmean(C,3);
            clear A B C
            iii = iii+1;
        end
        clear ii iii;
        % Yearly Grid to Yearly series : Land_Year
        for ii = 1 : size(GridYear.evspsbl,3)
            A = GridYear.evspsbl(:,:,ii); Land_Year.evspsbl(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.mrso(:,:,ii); Land_Year.mrso(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.mrro(:,:,ii); Land_Year.mrro(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii r1
        Land_Var = GridYear; clear GridYear;
        All_Land_Var_Mrro(:,:,:,i_GCM) = Land_Var.mrro;
        All_Land_Var_Evspsbl(:,:,:,i_GCM) = Land_Var.evspsbl;
        All_Land_Var_Mrso(:,:,:,i_GCM) = Land_Var.mrso;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputPath{i_Path} , GCM) , 'Land_Var');
        clear Land_Var GCM
    end
    clear GCM i_GCM GCM_Ensemble
    save(strcat(OutputPath{i_Path} , 'Land_Year') , 'Land_Year');
    Ensemble_Land_Var_Mrro = nanmean(All_Land_Var_Mrro,4);
    save(strcat(OutputPath{i_Path} , 'Ensemble_Land_Var_Mrro') , 'Ensemble_Land_Var_Mrro');
    Ensemble_Land_Var_Evspsbl = nanmean(All_Land_Var_Evspsbl,4);
    save(strcat(OutputPath{i_Path} , 'Ensemble_Land_Var_Evspsbl') , 'Ensemble_Land_Var_Evspsbl');
    Ensemble_Land_Var_Mrso = nanmean(All_Land_Var_Mrso,4);
    save(strcat(OutputPath{i_Path} , 'Ensemble_Land_Var_Mrso') , 'Ensemble_Land_Var_Mrso');
    clear All_Land_Var_Mrro All_Land_Var_Evspsbl All_Land_Var_Mrso
    clear Ensemble_Land_Var_Mrro Ensemble_Land_Var_Evspsbl Ensemble_Land_Var_Mrso Land_Year
end