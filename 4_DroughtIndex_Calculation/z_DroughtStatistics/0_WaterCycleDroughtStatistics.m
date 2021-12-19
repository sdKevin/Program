%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Drought analysis using CMIP Met&Land Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% Setting the input/output paths
% CMIP6 Historical Met Data
InputMetPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\Historical\Met_Var_Historical_';
InputLandPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\Historical\Land_Var_Historical_';
OutputDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\Met_Land_Historical_';
% CMIP6 ScenarioMIP ssp126 Data
InputMetPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_';
InputLandPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ScenarioMIP_ssp126\Land_Var_ssp126_';
OutputDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\Met_Land_ssp126_';
% CMIP6 ScenarioMIP ssp245 Data
InputMetPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_';
InputLandPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ScenarioMIP_ssp245\Land_Var_ssp245_';
OutputDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\Met_Land_ssp245_';
% CMIP6 ScenarioMIP ssp370 Data
InputMetPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_';
InputLandPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_';
OutputDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\Met_Land_ssp370_';
% CMIP6 ScenarioMIP ssp585 Data
InputMetPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_';
InputLandPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ScenarioMIP_ssp585\Land_Var_ssp585_';
OutputDroughtPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\Met_Land_ssp585_';

% global land surface Area including both land and water (km^2)
load EarthLandArea_05deg % Land and Water Area V4.11, download from https://sedac.ciesin.columbia.edu/data/set/gpw-v4-land-water-area-rev11
load LandInfo_05deg.mat
%% (1) Monthly Met calculated by CMIP6 data
for i_Path = 1 : length(InputMetPath)
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
        %% (1.1) CMIP6 Historical and Scenarios
        GCM = GCM_Ensemble{i_GCM};
        
        %% (1.1.1) Calculate Threshold During reference period 1948-2014
        load(strcat(InputMetPath{1} , GCM , '.mat'));
        load(strcat(InputLandPath{1} , GCM , '.mat'));
        %Pr_ref = Met_Var.pr(:,:,1177:end); %kg/(m2s), from 1850-2014 to 1948-2014
        %Q_ref = r1.mrro(:,:,1177:end); %kg/(m2s), from 1850-2014 to 1948-2014
        %SM_ref = r1.mrso(:,:,1177:end); %kg/(m2), from 1850-2014 to 1948-2014
        %Pr_ET_ref = Pr_ref - r1.evspsbl(:,:,1177:end); %kg/(m2s), from 1850-2014 to 1948-2014 !!! Warning Negative Pr-ET caused by bias correction using different reference data
        Pr_ref = Met_Var.pr(:,:,:); %kg/(m2s)
        Q_ref = r1.mrro(:,:,:); %kg/(m2s)
        SM_ref = r1.mrso(:,:,:); %kg/(m2)
        Pr_ET_ref = Pr_ref - r1.evspsbl(:,:,:); %kg/(m2s)
        clear r1 Met_Var
        for ii = 1 : size(Pr_ref,1)
            for iii = 1 : size(Pr_ref,2)
                for i_month = 1 : 12 % Each Grid has 12 threshold for each month
                    All_Month = size(Pr_ref,3);
                    if nansum(isnan(Pr_ref(ii,iii,i_month:12:All_Month)))==0
                        A = Pr_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        Threshold.Pr(ii,iii,i_month) = B(ceil(length(B)*0.1)); clear B; %10th Percentile
                        A = Q_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        Threshold.Q(ii,iii,i_month) = B(ceil(length(B)*0.1)); clear B; %10th Percentile
                        A = SM_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        Threshold.SM(ii,iii,i_month) = B(ceil(length(B)*0.1)); clear B; %10th Percentile
                        A = Pr_ET_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        Threshold.Pr_ET(ii,iii,i_month) = B(ceil(length(B)*0.1)); clear B; %10th Percentile
                    else
                        Threshold.Pr(ii,iii,i_month) = nan;
                        Threshold.Q(ii,iii,i_month) = nan;
                        Threshold.SM(ii,iii,i_month) = nan;
                        Threshold.Pr_ET(ii,iii,i_month) = nan;
                    end
                end
            end
        end
        clear ii iii Pr_ref Q_ref SM_ref Pr_ET_ref i_month All_Month
        
        %% (1.1.2) Drought Extent Analysis
        load(strcat(InputMetPath{i_Path} , GCM , '.mat'));
        load(strcat(InputLandPath{i_Path} , GCM , '.mat'));
        Pr = Met_Var.pr; %kg/(m2s)
        Q = r1.mrro; %kg/(m2s)
        SM = r1.mrso; %kg/(m2)
        Pr_ET = Pr - r1.evspsbl; %kg/(m2s)
        clear r1 Met_Var
        for ii = 1 : size( Pr , 3)
            if mod(ii,12)~=0
                i_month = mod(ii,12);
            else
                i_month = 12;
            end
            % Pr
            DroughtExtent_Month.Pr(i_GCM,ii) = nansum(EarthLandArea_05deg(Pr(:,:,ii)<Threshold.Pr(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % Q
            DroughtExtent_Month.Q(i_GCM,ii) = nansum(EarthLandArea_05deg(Q(:,:,ii)<Threshold.Q(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % SM
            DroughtExtent_Month.SM(i_GCM,ii) = nansum(EarthLandArea_05deg(SM(:,:,ii)<Threshold.SM(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % Compound Drought
            
            % Pr_ET
            DroughtExtent_Month.Pr_ET(i_GCM,ii) = nansum(EarthLandArea_05deg(Pr_ET(:,:,ii)<Threshold.Pr_ET(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
        end
        clear ii i_month
        % Monthly Drought Extent to Yearly
        iii = 1;
        for ii = 1 : 12 : size(DroughtExtent_Month.Pr,2)
            A = DroughtExtent_Month.Pr(i_GCM,ii:ii+11);
            DroughtExtent_Year.Pr(i_GCM,iii) = nanmean(A);
            B = DroughtExtent_Month.Q(i_GCM,ii:ii+11);
            DroughtExtent_Year.Q(i_GCM,iii) = nanmean(B);
            C = DroughtExtent_Month.SM(i_GCM,ii:ii+11);
            DroughtExtent_Year.SM(i_GCM,iii) = nanmean(C);
            AA = DroughtExtent_Month.Pr_ET(i_GCM,ii:ii+11);
            DroughtExtent_Year.Pr_ET(i_GCM,iii) = nanmean(AA);
            
            clear A B C AA
            iii = iii+1;
        end
        clear ii iii;
        
        %% (1.1.3) Drought Frequency Analysis
        % Frequency records whether (1 or 0) Variables < Threshold for every month
        for ii = 1 : size( Pr , 3)
            if mod(ii,12)~=0
                i_month = mod(ii,12);
            else
                i_month = 12;
            end
            Frequency.Pr(:,:,ii) = Pr(:,:,ii) < Threshold.Pr(:,:,i_month);
            Frequency.Q(:,:,ii) = Q(:,:,ii) < Threshold.Q(:,:,i_month);
            Frequency.SM(:,:,ii) = SM(:,:,ii) < Threshold.SM(:,:,i_month);
            Frequency.Pr_ET(:,:,ii) = Pr_ET(:,:,ii) < Threshold.Pr_ET(:,:,i_month);
        end
        clear ii i_month
        % Drought Frequency: GridYear (how many months under drought or moist conditions for every year)
        iii = 1;
        for ii = 1 : 12 : size(Frequency.Pr,3)
            A = Frequency.Pr(:,:,ii:ii+11);
            GridYear.Pr(:,:,iii) = nansum(A,3).*landmask_05deg;
            B = Frequency.Q(:,:,ii:ii+11);
            GridYear.Q(:,:,iii) = nansum(B,3).*landmask_05deg;
            C = Frequency.SM(:,:,ii:ii+11);
            GridYear.SM(:,:,iii) = nansum(C,3).*landmask_05deg;
            AA = Frequency.Pr_ET(:,:,ii:ii+11);
            GridYear.Pr_ET(:,:,iii) = nansum(AA,3).*landmask_05deg;
            
            clear A B C AA
            iii = iii+1;
        end
        clear ii iii Frequency
        % Yearly Grid to global average Yearly series : DroughtFrequency_GMYear
        for ii = 1 : size(GridYear.Pr , 3)
            A = GridYear.Pr(:,:,ii); DroughtFrequency_GMYear.Pr(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.Q(:,:,ii); DroughtFrequency_GMYear.Q(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.SM(:,:,ii); DroughtFrequency_GMYear.SM(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.Pr_ET(:,:,ii); DroughtFrequency_GMYear.Pr_ET(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii Pr Q SM Pr_ET
        DroughtFrequency_Year = GridYear; clear GridYear;
        % Save DroughtFrequency_Year to calculate Ensemble Mean
        All_DroughtFrequency_Year.Pr(:,:,:,i_GCM) = DroughtFrequency_Year.Pr;
        All_DroughtFrequency_Year.Q(:,:,:,i_GCM) = DroughtFrequency_Year.Q;
        All_DroughtFrequency_Year.SM(:,:,:,i_GCM) = DroughtFrequency_Year.SM;
        All_DroughtFrequency_Year.Pr_ET(:,:,:,i_GCM) = DroughtFrequency_Year.Pr_ET;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputDroughtPath{i_Path} , GCM) , 'DroughtFrequency_Year');
        clear DroughtFrequency_Year GCM
    end
    clear i_GCM
    % save monthly drought extent
    save(strcat(OutputDroughtPath{i_Path} , 'DroughtExtent_Month') , 'DroughtExtent_Month');
    clear DroughtExtent_Month
    % save yearly drought extent
    save(strcat(OutputDroughtPath{i_Path} , 'DroughtExtent_Year') , 'DroughtExtent_Year');
    clear DroughtExtent_Year
    % save global mean yearly drought frequency
    save(strcat(OutputDroughtPath{i_Path} , 'DroughtFrequency_GMYear') , 'DroughtFrequency_GMYear');
    clear DroughtFrequency_GMYear
    % save ensemble mean DroughtFrequency_Year
    Ensemble_Mean_DroughtFrequency_Year.Pr = nanmean(All_DroughtFrequency_Year.Pr,4);
    Ensemble_Mean_DroughtFrequency_Year.Q = nanmean(All_DroughtFrequency_Year.Q,4);
    Ensemble_Mean_DroughtFrequency_Year.SM = nanmean(All_DroughtFrequency_Year.SM,4);
    Ensemble_Mean_DroughtFrequency_Year.Pr_ET = nanmean(All_DroughtFrequency_Year.Pr_ET,4);
    
    save(strcat(OutputDroughtPath{i_Path} , 'Ensemble_Mean_DroughtFrequency_Year') , 'Ensemble_Mean_DroughtFrequency_Year');
    clear Ensemble_Mean_DroughtFrequency_Year All_DroughtFrequency_Year
end
