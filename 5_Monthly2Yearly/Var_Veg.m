clc; clear all; close all;

%% Setting the input/output paths
% CMIP6 Historical Terrestrial Vegetation Data
InputPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Veg\Historical\Veg_Var_Historical_';
OutputPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Veg\Historical\Veg_Var_Historical_';
% CMIP6 ScenarioMIP ssp126 Terrestrial Vegetation Data
InputPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Veg\ScenarioMIP_ssp126\Veg_Var_ssp126_';
OutputPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Veg\ScenarioMIP_ssp126\Veg_Var_ssp126_';
% CMIP6 ScenarioMIP ssp245 Terrestrial Vegetation Data
InputPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Veg\ScenarioMIP_ssp245\Veg_Var_ssp245_';
OutputPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Veg\ScenarioMIP_ssp245\Veg_Var_ssp245_';
% CMIP6 ScenarioMIP ssp370 Terrestrial Vegetation Data
InputPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Veg\ScenarioMIP_ssp370\Veg_Var_ssp370_';
OutputPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Veg\ScenarioMIP_ssp370\Veg_Var_ssp370_';
% CMIP6 ScenarioMIP ssp585 Terrestrial Vegetation Data
InputPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Veg\ScenarioMIP_ssp585\Veg_Var_ssp585_';
OutputPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Veg\ScenarioMIP_ssp585\Veg_Var_ssp585_';

%% (1) Integrate Monthly CMIP6 data to yearly data
for i_Path = 1 : length(InputPath)
    if i_Path == 4
        % Name of Global Climate Model, since HadGEM3-GC31-LL model does
        % not have ssp370
        GCM_Ensemble = {'ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3-Veg',...
            'GISS-E2-1-G','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'NorESM2-MM','UKESM1-0-LL'};
    else
        % Name of Global Climate Model
        GCM_Ensemble = {'ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3-Veg',...
            'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'NorESM2-MM','UKESM1-0-LL'};
    end
    for i_GCM = 1 : length(GCM_Ensemble)
        %% (1.1) Monthly to Yearly
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputPath{i_Path} , GCM , '.mat'));
        % Monthly Grid to Yearly Grid : GridYear
        iii = 1;
        for ii = 1 : 12 : size(r1.lai , 3)
            % lai
            A = r1.lai(:,:,ii:ii+11);
            A(A==Inf|A==-Inf) = nan; %Set missing grids in original nc file as NAN
            GridYear.lai(:,:,iii) = nanmean(A,3);
            clear A
            iii = iii+1;
        end
        clear ii iii;
        % Yearly Grid to Yearly series : Veg_Year
        for ii = 1 : size(GridYear.lai,3)
            A = GridYear.lai(:,:,ii); Veg_Year.lai(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii r1
        Veg_Var = GridYear; clear GridYear;
        All_Veg_Var_LAI(:,:,:,i_GCM) = Veg_Var.lai;
        %% (1.2) Output Yearly data
        save(strcat(OutputPath{i_Path} , GCM) , 'Veg_Var');
        clear Veg_Var GCM
    end
    clear GCM i_GCM GCM_Ensemble
    save(strcat(OutputPath{i_Path} , 'Veg_Year') , 'Veg_Year');
    Ensemble_Veg_Var_LAI = nanmean(All_Veg_Var_LAI,4);
    save(strcat(OutputPath{i_Path} , 'Ensemble_Veg_Var_LAI') , 'Ensemble_Veg_Var_LAI');
    clear All_Veg_Var_LAI Ensemble_Veg_Var_LAI Veg_Year
end