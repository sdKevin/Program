%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PDSI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% Setting the input/output paths
% CMIP6 Historical PDSI Data
InputPDSIPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\Historical\PDSI_Historical_';
OutputPDSIPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\Historical\PDSI_Historical_';
% CMIP6 ScenarioMIP ssp126 PDSI Data
InputPDSIPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp126\PDSI_ssp126_';
OutputPDSIPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp126\PDSI_ssp126_';
% CMIP6 ScenarioMIP ssp245 PDSI Data
InputPDSIPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp245\PDSI_ssp245_';
OutputPDSIPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp245\PDSI_ssp245_';
% CMIP6 ScenarioMIP ssp370 PDSI Data
InputPDSIPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp370\PDSI_ssp370_';
OutputPDSIPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp370\PDSI_ssp370_';
% CMIP6 ScenarioMIP ssp585 PDSI Data
InputPDSIPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp585\PDSI_ssp585_';
OutputPDSIPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\ScenarioMIP_ssp585\PDSI_ssp585_';

%% (1) Integrate Monthly CMIP6 data to yearly data
for i_Path = 1 : length(InputPDSIPath)
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
        %% (1.1) CMIP6 Historical and Scenarios
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputPDSIPath{i_Path} , GCM , '.mat'));
        % Handling outliers
        pdsi_PM_RC(pdsi_PM_RC>20) = nan; pdsi_PM_RC(pdsi_PM_RC<-20) = nan;
        pdsi_PM_RC_CO2_Jarvis_H(pdsi_PM_RC_CO2_Jarvis_H>20) = nan; pdsi_PM_RC_CO2_Jarvis_H(pdsi_PM_RC_CO2_Jarvis_H<-20) = nan;
        pdsi_PM_RC_CO2_Yang(pdsi_PM_RC_CO2_Yang>20) = nan; pdsi_PM_RC_CO2_Yang(pdsi_PM_RC_CO2_Yang<-20) = nan;
        % Monthly Grid to Yearly Grid : GridYear
        iii = 1;
        for ii = 1 : 12 : size(pdsi_PM_RC,3)
            A = pdsi_PM_RC(:,:,ii:ii+11);
            GridYear.pdsi_PM_RC(:,:,iii) = nanmean(A,3);
            B = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3);
            C = pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.pdsi_PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3);
            clear A B C
            iii = iii+1;
        end
        clear ii iii;
        % Yearly Grid to Yearly series : PDSI_Year
        for ii = 1 : size(GridYear.pdsi_PM_RC , 3)
            A = GridYear.pdsi_PM_RC(:,:,ii); PDSI_Year.pdsi_PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.pdsi_PM_RC_CO2_Yang(:,:,ii); PDSI_Year.pdsi_PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii pdsi_PM_RC pdsi_PM_RC_CO2_Jarvis_H pdsi_PM_RC_CO2_Yang
        PDSI = GridYear; clear GridYear;
        % Save PDSI to calculate Ensemble Mean
        All_PDSI.pdsi_PM_RC(:,:,:,i_GCM) = PDSI.pdsi_PM_RC;
        All_PDSI.pdsi_PM_RC_CO2_Jarvis_H(:,:,:,i_GCM) = PDSI.pdsi_PM_RC_CO2_Jarvis_H;
        All_PDSI.pdsi_PM_RC_CO2_Yang(:,:,:,i_GCM) = PDSI.pdsi_PM_RC_CO2_Yang;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputPDSIPath{i_Path} , GCM) , 'PDSI');
        clear PDSI GCM
    end
    clear i_GCM
    save(strcat(OutputPDSIPath{i_Path} , 'PDSI_Year') , 'PDSI_Year');
    Ensemble_Mean_PDSI.pdsi_PM_RC = nanmean(All_PDSI.pdsi_PM_RC,4);
    Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Jarvis_H = nanmean(All_PDSI.pdsi_PM_RC_CO2_Jarvis_H,4);
    Ensemble_Mean_PDSI.pdsi_PM_RC_CO2_Yang = nanmean(All_PDSI.pdsi_PM_RC_CO2_Yang,4);
    save(strcat(OutputPDSIPath{i_Path} , 'Ensemble_Mean') , 'Ensemble_Mean_PDSI');
    clear PDSI_Year All_PDSI
end

%% (2) Integrate Monthly Princeton data to yearly data
clc; clear all; close all;
% Princeton PDSI Data
InputPDSIPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\Princeton\PDSI_Princeton.mat';
OutputPDSIPath_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_PDSI\Princeton\';

load(InputPDSIPath_Princeton);
% Handling outliers
pdsi_PM_RC(pdsi_PM_RC>20) = nan; pdsi_PM_RC(pdsi_PM_RC<-20) = nan;
pdsi_PM_RC_CO2_Jarvis_H(pdsi_PM_RC_CO2_Jarvis_H>20) = nan; pdsi_PM_RC_CO2_Jarvis_H(pdsi_PM_RC_CO2_Jarvis_H<-20) = nan;
pdsi_PM_RC_CO2_Yang(pdsi_PM_RC_CO2_Yang>20) = nan; pdsi_PM_RC_CO2_Yang(pdsi_PM_RC_CO2_Yang<-20) = nan;

% Monthly Grid to Yearly Grid : GridYear
iii = 1;
for ii = 1 : 12 : size(pdsi_PM_RC,3)
    A = pdsi_PM_RC(:,:,ii:ii+11);
    GridYear.pdsi_PM_RC(:,:,iii) = nanmean(A,3);
    B = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3);
    C = pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.pdsi_PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3);
    clear A B C
    iii = iii+1;
end
clear ii iii;
% Yearly Grid to Yearly series : PDSI_Year
for ii = 1 : size(GridYear.pdsi_PM_RC , 3)
    A = GridYear.pdsi_PM_RC(:,:,ii); PDSI_Year.pdsi_PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.pdsi_PM_RC_CO2_Yang(:,:,ii); PDSI_Year.pdsi_PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
end
clear ii pdsi_PM_RC pdsi_PM_RC_CO2_Jarvis_H pdsi_PM_RC_CO2_Yang
PDSI = GridYear; clear GridYear;
Ensemble_Mean_PDSI = PDSI;
%% (1.2) Output GridYear from 1948-2014
save(strcat(OutputPDSIPath_Princeton , 'PDSI_Princeton') , 'PDSI');
clear PDSI
save(strcat(OutputPDSIPath_Princeton , 'Ensemble_Mean') , 'Ensemble_Mean_PDSI');
clear Ensemble_Mean_PDSI
save(strcat(OutputPDSIPath_Princeton , 'PDSI_Year_Princeton') , 'PDSI_Year');
clear PDSI_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% scPDSI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% Setting the input/output paths
% CMIP6 Historical scPDSI Data
InputscPDSIPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\Historical\scPDSI_Historical_';
OutputscPDSIPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\Historical\scPDSI_Historical_';
% CMIP6 ScenarioMIP ssp126 scPDSI Data
InputscPDSIPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\ScenarioMIP_ssp126\scPDSI_ssp126_';
OutputscPDSIPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp126\scPDSI_ssp126_';
% CMIP6 ScenarioMIP ssp245 scPDSI Data
InputscPDSIPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\ScenarioMIP_ssp245\scPDSI_ssp245_';
OutputscPDSIPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp245\scPDSI_ssp245_';
% CMIP6 ScenarioMIP ssp370 scPDSI Data
InputscPDSIPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\ScenarioMIP_ssp370\scPDSI_ssp370_';
OutputscPDSIPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp370\scPDSI_ssp370_';
% CMIP6 ScenarioMIP ssp585 scPDSI Data
InputscPDSIPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\ScenarioMIP_ssp585\scPDSI_ssp585_';
OutputscPDSIPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\ScenarioMIP_ssp585\scPDSI_ssp585_';

%% (1) Integrate Monthly CMIP6 data to yearly data
for i_Path = 1 : length(InputscPDSIPath)
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
        %% (1.1) CMIP6 Historical and Scenarios
        GCM = GCM_Ensemble{i_GCM};
        load(strcat(InputscPDSIPath{i_Path} , GCM , '.mat'));
        % Handling outliers
        scpdsi_PM_RC(scpdsi_PM_RC>20) = nan; scpdsi_PM_RC(scpdsi_PM_RC<-20) = nan;
        scpdsi_PM_RC_CO2_Jarvis_H(scpdsi_PM_RC_CO2_Jarvis_H>20) = nan; scpdsi_PM_RC_CO2_Jarvis_H(scpdsi_PM_RC_CO2_Jarvis_H<-20) = nan;
        scpdsi_PM_RC_CO2_Yang(scpdsi_PM_RC_CO2_Yang>20) = nan; scpdsi_PM_RC_CO2_Yang(scpdsi_PM_RC_CO2_Yang<-20) = nan;
        % Monthly Grid to Yearly Grid : GridYear
        iii = 1;
        for ii = 1 : 12 : size(scpdsi_PM_RC,3)
            A = scpdsi_PM_RC(:,:,ii:ii+11);
            GridYear.scpdsi_PM_RC(:,:,iii) = nanmean(A,3);
            B = scpdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.scpdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3);
            C = scpdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.scpdsi_PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3);
            clear A B C
            iii = iii+1;
        end
        clear ii iii;
        % Yearly Grid to Yearly series : scPDSI_Year
        for ii = 1 : size(GridYear.scpdsi_PM_RC , 3)
            A = GridYear.scpdsi_PM_RC(:,:,ii); scPDSI_Year.scpdsi_PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.scpdsi_PM_RC_CO2_Jarvis_H(:,:,ii); scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.scpdsi_PM_RC_CO2_Yang(:,:,ii); scPDSI_Year.scpdsi_PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii scpdsi_PM_RC scpdsi_PM_RC_CO2_Jarvis_H scpdsi_PM_RC_CO2_Yang
        scPDSI = GridYear; clear GridYear;
        % Save scPDSI to calculate Ensemble Mean
        All_scPDSI.scpdsi_PM_RC(:,:,:,i_GCM) = scPDSI.scpdsi_PM_RC;
        All_scPDSI.scpdsi_PM_RC_CO2_Jarvis_H(:,:,:,i_GCM) = scPDSI.scpdsi_PM_RC_CO2_Jarvis_H;
        All_scPDSI.scpdsi_PM_RC_CO2_Yang(:,:,:,i_GCM) = scPDSI.scpdsi_PM_RC_CO2_Yang;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputscPDSIPath{i_Path} , GCM) , 'scPDSI');
        clear scPDSI GCM
    end
    clear i_GCM
    save(strcat(OutputscPDSIPath{i_Path} , 'scPDSI_Year') , 'scPDSI_Year');
    Ensemble_Mean_scPDSI.scpdsi_PM_RC = nanmean(All_scPDSI.scpdsi_PM_RC,4);
    Ensemble_Mean_scPDSI.scpdsi_PM_RC_CO2_Jarvis_H = nanmean(All_scPDSI.scpdsi_PM_RC_CO2_Jarvis_H,4);
    Ensemble_Mean_scPDSI.scpdsi_PM_RC_CO2_Yang = nanmean(All_scPDSI.scpdsi_PM_RC_CO2_Yang,4);
    save(strcat(OutputscPDSIPath{i_Path} , 'Ensemble_Mean') , 'Ensemble_Mean_scPDSI');
    clear scPDSI_Year All_scPDSI
end

%% (2) Integrate Monthly Princeton data to yearly data
clc; clear all; close all;
% Princeton scPDSI Data
InputscPDSIPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\Princeton\scPDSI_Princeton.mat';
OutputscPDSIPath_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_scPDSI\Princeton\';

load(InputscPDSIPath_Princeton);
% Handling outliers
scpdsi_PM_RC(scpdsi_PM_RC>20) = nan; scpdsi_PM_RC(scpdsi_PM_RC<-20) = nan;
scpdsi_PM_RC_CO2_Jarvis_H(scpdsi_PM_RC_CO2_Jarvis_H>20) = nan; scpdsi_PM_RC_CO2_Jarvis_H(scpdsi_PM_RC_CO2_Jarvis_H<-20) = nan;
scpdsi_PM_RC_CO2_Yang(scpdsi_PM_RC_CO2_Yang>20) = nan; scpdsi_PM_RC_CO2_Yang(scpdsi_PM_RC_CO2_Yang<-20) = nan;

% Monthly Grid to Yearly Grid : GridYear
iii = 1;
for ii = 1 : 12 : size(scpdsi_PM_RC,3)
    A = scpdsi_PM_RC(:,:,ii:ii+11);
    GridYear.scpdsi_PM_RC(:,:,iii) = nanmean(A,3);
    B = scpdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.scpdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3);
    C = scpdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.scpdsi_PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3);
    clear A B C
    iii = iii+1;
end
clear ii iii;
% Yearly Grid to Yearly series : scPDSI_Year
for ii = 1 : size(GridYear.scpdsi_PM_RC , 3)
    A = GridYear.scpdsi_PM_RC(:,:,ii); scPDSI_Year.scpdsi_PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.scpdsi_PM_RC_CO2_Jarvis_H(:,:,ii); scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.scpdsi_PM_RC_CO2_Yang(:,:,ii); scPDSI_Year.scpdsi_PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
end
clear ii scpdsi_PM_RC scpdsi_PM_RC_CO2_Jarvis_H scpdsi_PM_RC_CO2_Yang
scPDSI = GridYear; clear GridYear;
Ensemble_Mean_scPDSI = scPDSI;
%% (1.2) Output GridYear from 1948-2014
save(strcat(OutputscPDSIPath_Princeton , 'scPDSI_Princeton') , 'scPDSI');
clear scPDSI
save(strcat(OutputscPDSIPath_Princeton , 'Ensemble_Mean') , 'Ensemble_Mean_scPDSI');
clear Ensemble_Mean_scPDSI
save(strcat(OutputscPDSIPath_Princeton , 'scPDSI_Year_Princeton') , 'scPDSI_Year');
clear scPDSI_Year