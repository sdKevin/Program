%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Drought analysis using CMIP PDSI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% Setting the input/output paths
% CMIP6 Historical PDSI Data
InputPDSIPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\Historical\PDSI_Historical_';
OutputDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Historical\PDSI_Historical_';
% CMIP6 ScenarioMIP ssp126 PDSI Data
InputPDSIPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp126\PDSI_ssp126_';
OutputDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp126\PDSI_ssp126_';
% CMIP6 ScenarioMIP ssp245 PDSI Data
InputPDSIPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp245\PDSI_ssp245_';
OutputDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp245\PDSI_ssp245_';
% CMIP6 ScenarioMIP ssp370 PDSI Data
InputPDSIPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp370\PDSI_ssp370_';
OutputDroughtPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp370\PDSI_ssp370_';
% CMIP6 ScenarioMIP ssp585 PDSI Data
InputPDSIPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp585\PDSI_ssp585_';
OutputDroughtPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ScenarioMIP_ssp585\PDSI_ssp585_';

% global land surface Area including both land and water (km^2)
load EarthLandArea_05deg % Land and Water Area V4.11, download from https://sedac.ciesin.columbia.edu/data/set/gpw-v4-land-water-area-rev11
load LandInfo_05deg.mat
%% (1) Monthly PDSI calculated by CMIP6 data
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
        %% (1.1.1) Drought Extent Analysis
        for ii = 1 : size( pdsi_PM_RC , 3)
            % pdsi_PM_RC
            DroughtExtent_Month.SevereDrought_pdsi_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))<-3))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.ModerateDrought_pdsi_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))<-2))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.MildDrought_pdsi_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))<-1))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.SevereMoist_pdsi_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))>3))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.ModerateMoist_pdsi_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))>2))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.MildMoist_pdsi_PM_RC(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))>1))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            % pdsi_PM_RC_CO2_Jarvis_H
            DroughtExtent_Month.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))<-3))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))<-2))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))<-1))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))>3))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))>2))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))>1))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            % pdsi_PM_RC_CO2_Yang
            DroughtExtent_Month.SevereDrought_pdsi_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))<-3))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.ModerateDrought_pdsi_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))<-2))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.MildDrought_pdsi_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))<-1))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.SevereMoist_pdsi_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))>3))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.ModerateMoist_pdsi_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))>2))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
            DroughtExtent_Month.MildMoist_pdsi_PM_RC_CO2_Yang(i_GCM,ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))>1))...
                ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
        end
        clear ii
        % Monthly Drought Extent to Yearly
        iii = 1;
        for ii = 1 : 12 : size(DroughtExtent_Month.SevereDrought_pdsi_PM_RC,2)
            A = DroughtExtent_Month.SevereDrought_pdsi_PM_RC(i_GCM,ii:ii+11);
            DroughtExtent_Year.SevereDrought_pdsi_PM_RC(i_GCM,iii) = nanmean(A);
            B = DroughtExtent_Month.ModerateDrought_pdsi_PM_RC(i_GCM,ii:ii+11);
            DroughtExtent_Year.ModerateDrought_pdsi_PM_RC(i_GCM,iii) = nanmean(B);
            C = DroughtExtent_Month.MildDrought_pdsi_PM_RC(i_GCM,ii:ii+11);
            DroughtExtent_Year.MildDrought_pdsi_PM_RC(i_GCM,iii) = nanmean(C);
            AA = DroughtExtent_Month.SevereMoist_pdsi_PM_RC(i_GCM,ii:ii+11);
            DroughtExtent_Year.SevereMoist_pdsi_PM_RC(i_GCM,iii) = nanmean(AA);
            BB = DroughtExtent_Month.ModerateMoist_pdsi_PM_RC(i_GCM,ii:ii+11);
            DroughtExtent_Year.ModerateMoist_pdsi_PM_RC(i_GCM,iii) = nanmean(BB);
            CC = DroughtExtent_Month.MildMoist_pdsi_PM_RC(i_GCM,ii:ii+11);
            DroughtExtent_Year.MildMoist_pdsi_PM_RC(i_GCM,iii) = nanmean(CC);
            AAA = DroughtExtent_Month.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii:ii+11);
            DroughtExtent_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,iii) = nanmean(AAA);
            BBB = DroughtExtent_Month.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii:ii+11);
            DroughtExtent_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,iii) = nanmean(BBB);
            CCC = DroughtExtent_Month.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii:ii+11);
            DroughtExtent_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,iii) = nanmean(CCC);
            AAAA = DroughtExtent_Month.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii:ii+11);
            DroughtExtent_Year.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,iii) = nanmean(AAAA);
            BBBB = DroughtExtent_Month.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii:ii+11);
            DroughtExtent_Year.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,iii) = nanmean(BBBB);
            CCCC = DroughtExtent_Month.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,ii:ii+11);
            DroughtExtent_Year.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM,iii) = nanmean(CCCC);
            AAAAA = DroughtExtent_Month.SevereDrought_pdsi_PM_RC_CO2_Yang(i_GCM,ii:ii+11);
            DroughtExtent_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(i_GCM,iii) = nanmean(AAAAA);
            BBBBB = DroughtExtent_Month.ModerateDrought_pdsi_PM_RC_CO2_Yang(i_GCM,ii:ii+11);
            DroughtExtent_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(i_GCM,iii) = nanmean(BBBBB);
            CCCCC = DroughtExtent_Month.MildDrought_pdsi_PM_RC_CO2_Yang(i_GCM,ii:ii+11);
            DroughtExtent_Year.MildDrought_pdsi_PM_RC_CO2_Yang(i_GCM,iii) = nanmean(CCCCC);
            AAAAAA = DroughtExtent_Month.SevereMoist_pdsi_PM_RC_CO2_Yang(i_GCM,ii:ii+11);
            DroughtExtent_Year.SevereMoist_pdsi_PM_RC_CO2_Yang(i_GCM,iii) = nanmean(AAAAAA);
            BBBBBB = DroughtExtent_Month.ModerateMoist_pdsi_PM_RC_CO2_Yang(i_GCM,ii:ii+11);
            DroughtExtent_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang(i_GCM,iii) = nanmean(BBBBBB);
            CCCCCC = DroughtExtent_Month.MildMoist_pdsi_PM_RC_CO2_Yang(i_GCM,ii:ii+11);
            DroughtExtent_Year.MildMoist_pdsi_PM_RC_CO2_Yang(i_GCM,iii) = nanmean(CCCCCC);
            clear A B C AA BB CC AAA BBB CCC AAAA BBBB CCCC AAAAA BBBBB CCCCC AAAAAA BBBBBB CCCCCC
            iii = iii+1;
        end
        clear ii iii;
        
        %% (1.1.2) Drought Frequency Analysis
        % Frequency records whether (1 or 0) PDSI < some value for every month
        for ii = 1 : size( pdsi_PM_RC , 3)
            % pdsi_PM_RC
            Frequency.SevereDrought_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)<-3;
            Frequency.ModerateDrought_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)<-2;
            Frequency.MildDrought_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)<-1;
            Frequency.SevereMoist_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)>3;
            Frequency.ModerateMoist_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)>2;
            Frequency.MildMoist_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)>1;
            % pdsi_PM_RC_CO2_Jarvis_H
            Frequency.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)<-3;
            Frequency.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)<-2;
            Frequency.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)<-1;
            Frequency.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)>3;
            Frequency.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)>2;
            Frequency.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)>1;
            % pdsi_PM_RC_CO2_Yang
            Frequency.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)<-3;
            Frequency.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)<-2;
            Frequency.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)<-1;
            Frequency.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)>3;
            Frequency.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)>2;
            Frequency.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)>1;
        end
        clear ii
        % Drought Frequency: GridYear (how many months under drought or moist conditions for every year)
        iii = 1;
        for ii = 1 : 12 : size(Frequency.SevereDrought_pdsi_PM_RC,3)
            A = Frequency.SevereDrought_pdsi_PM_RC(:,:,ii:ii+11);
            GridYear.SevereDrought_pdsi_PM_RC(:,:,iii) = nansum(A,3).*landmask_05deg;
            B = Frequency.ModerateDrought_pdsi_PM_RC(:,:,ii:ii+11);
            GridYear.ModerateDrought_pdsi_PM_RC(:,:,iii) = nansum(B,3).*landmask_05deg;
            C = Frequency.MildDrought_pdsi_PM_RC(:,:,ii:ii+11);
            GridYear.MildDrought_pdsi_PM_RC(:,:,iii) = nansum(C,3).*landmask_05deg;
            AA = Frequency.SevereMoist_pdsi_PM_RC(:,:,ii:ii+11);
            GridYear.SevereMoist_pdsi_PM_RC(:,:,iii) = nansum(AA,3).*landmask_05deg;
            BB = Frequency.ModerateMoist_pdsi_PM_RC(:,:,ii:ii+11);
            GridYear.ModerateMoist_pdsi_PM_RC(:,:,iii) = nansum(BB,3).*landmask_05deg;
            CC = Frequency.MildMoist_pdsi_PM_RC(:,:,ii:ii+11);
            GridYear.MildMoist_pdsi_PM_RC(:,:,iii) = nansum(CC,3).*landmask_05deg;
            AAA = Frequency.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(AAA,3).*landmask_05deg;
            BBB = Frequency.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(BBB,3).*landmask_05deg;
            CCC = Frequency.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(CCC,3).*landmask_05deg;
            AAAA = Frequency.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(AAAA,3).*landmask_05deg;
            BBBB = Frequency.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(BBBB,3).*landmask_05deg;
            CCCC = Frequency.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
            GridYear.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(CCCC,3).*landmask_05deg;
            AAAAA = Frequency.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(AAAAA,3).*landmask_05deg;
            BBBBB = Frequency.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(BBBBB,3).*landmask_05deg;
            CCCCC = Frequency.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(CCCCC,3).*landmask_05deg;
            AAAAAA = Frequency.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(AAAAAA,3).*landmask_05deg;
            BBBBBB = Frequency.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(BBBBBB,3).*landmask_05deg;
            CCCCCC = Frequency.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
            GridYear.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(CCCCCC,3).*landmask_05deg;
            clear A B C AA BB CC AAA BBB CCC AAAA BBBB CCCC AAAAA BBBBB CCCCC AAAAAA BBBBBB CCCCCC
            iii = iii+1;
        end
        clear ii iii Frequency
        % Yearly Grid to global average Yearly series : DroughtFrequency_GMAYear
        for ii = 1 : size(GridYear.SevereDrought_pdsi_PM_RC , 3)
            A = GridYear.SevereDrought_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.ModerateDrought_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.ModerateDrought_pdsi_PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.MildDrought_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.MildDrought_pdsi_PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.SevereMoist_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.SevereMoist_pdsi_PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.ModerateMoist_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.ModerateMoist_pdsi_PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.MildMoist_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.MildMoist_pdsi_PM_RC(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.ModerateDrought_pdsi_PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.MildDrought_pdsi_PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.SevereMoist_pdsi_PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.ModerateMoist_pdsi_PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.MildMoist_pdsi_PM_RC_CO2_Yang(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii pdsi_PM_RC pdsi_PM_RC_CO2_Jarvis_H pdsi_PM_RC_CO2_Yang
        DroughtFrequency_Year = GridYear; clear GridYear;
        % Save DroughtFrequency_Year to calculate Ensemble Mean
        All_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC(:,:,:,i_GCM) = DroughtFrequency_Year.SevereDrought_pdsi_PM_RC;
        All_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC(:,:,:,i_GCM) = DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC;
        All_DroughtFrequency_Year.MildDrought_pdsi_PM_RC(:,:,:,i_GCM) = DroughtFrequency_Year.MildDrought_pdsi_PM_RC;
        All_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC(:,:,:,i_GCM) = DroughtFrequency_Year.SevereMoist_pdsi_PM_RC;
        All_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC(:,:,:,i_GCM) = DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC;
        All_DroughtFrequency_Year.MildMoist_pdsi_PM_RC(:,:,:,i_GCM) = DroughtFrequency_Year.MildMoist_pdsi_PM_RC;
        All_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,:,i_GCM) = DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
        All_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,:,i_GCM) = DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H;
        All_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,:,i_GCM) = DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H;
        All_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,:,i_GCM) = DroughtFrequency_Year.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H;
        All_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,:,i_GCM) = DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H;
        All_DroughtFrequency_Year.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,:,i_GCM) = DroughtFrequency_Year.MildMoist_pdsi_PM_RC_CO2_Jarvis_H;
        All_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,:,i_GCM) = DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang;
        All_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,:,i_GCM) = DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang;
        All_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,:,i_GCM) = DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang;
        All_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,:,i_GCM) = DroughtFrequency_Year.SevereMoist_pdsi_PM_RC_CO2_Yang;
        All_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,:,i_GCM) = DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang;
        All_DroughtFrequency_Year.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,:,i_GCM) = DroughtFrequency_Year.MildMoist_pdsi_PM_RC_CO2_Yang;
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
    Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC = nanmean(All_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC,4);
    Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC = nanmean(All_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC,4);
    Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC = nanmean(All_DroughtFrequency_Year.MildDrought_pdsi_PM_RC,4);
    Ensemble_Mean_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC = nanmean(All_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC,4);
    Ensemble_Mean_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC = nanmean(All_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC,4);
    Ensemble_Mean_DroughtFrequency_Year.MildMoist_pdsi_PM_RC = nanmean(All_DroughtFrequency_Year.MildMoist_pdsi_PM_RC,4);
    Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H = nanmean(All_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H,4);
    Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H = nanmean(All_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H,4);
    Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H = nanmean(All_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H,4);
    Ensemble_Mean_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H = nanmean(All_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H,4);
    Ensemble_Mean_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H = nanmean(All_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H,4);
    Ensemble_Mean_DroughtFrequency_Year.MildMoist_pdsi_PM_RC_CO2_Jarvis_H = nanmean(All_DroughtFrequency_Year.MildMoist_pdsi_PM_RC_CO2_Jarvis_H,4);
    Ensemble_Mean_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang = nanmean(All_DroughtFrequency_Year.SevereDrought_pdsi_PM_RC_CO2_Yang,4);
    Ensemble_Mean_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang = nanmean(All_DroughtFrequency_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang,4);
    Ensemble_Mean_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang = nanmean(All_DroughtFrequency_Year.MildDrought_pdsi_PM_RC_CO2_Yang,4);
    Ensemble_Mean_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC_CO2_Yang = nanmean(All_DroughtFrequency_Year.SevereMoist_pdsi_PM_RC_CO2_Yang,4);
    Ensemble_Mean_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang = nanmean(All_DroughtFrequency_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang,4);
    Ensemble_Mean_DroughtFrequency_Year.MildMoist_pdsi_PM_RC_CO2_Yang = nanmean(All_DroughtFrequency_Year.MildMoist_pdsi_PM_RC_CO2_Yang,4);
    
    save(strcat(OutputDroughtPath{i_Path} , 'Ensemble_Mean_DroughtFrequency_Year') , 'Ensemble_Mean_DroughtFrequency_Year');
    clear Ensemble_Mean_DroughtFrequency_Year All_DroughtFrequency_Year
end



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Drought analysis using Princeton PDSI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (2) Monthly PDSI calculated by Princeton
clc; clear all; close all;
% Princeton PDSI Data
InputPDSIPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\Princeton\PDSI_Princeton.mat';
OutputDroughtPath_Princeton = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\Princeton\PDSI_';
% global land surface Area including both land and water (km^2)
load EarthLandArea_05deg % Land and Water Area V4.11, download from https://sedac.ciesin.columbia.edu/data/set/gpw-v4-land-water-area-rev11
load LandInfo_05deg.mat

load(InputPDSIPath_Princeton);
% Handling outliers
pdsi_PM_RC(pdsi_PM_RC>20) = nan; pdsi_PM_RC(pdsi_PM_RC<-20) = nan;
pdsi_PM_RC_CO2_Jarvis_H(pdsi_PM_RC_CO2_Jarvis_H>20) = nan; pdsi_PM_RC_CO2_Jarvis_H(pdsi_PM_RC_CO2_Jarvis_H<-20) = nan;
pdsi_PM_RC_CO2_Yang(pdsi_PM_RC_CO2_Yang>20) = nan; pdsi_PM_RC_CO2_Yang(pdsi_PM_RC_CO2_Yang<-20) = nan;
%% (1.1.1) Drought Extent Analysis
for ii = 1 : size( pdsi_PM_RC , 3)
    % pdsi_PM_RC
    DroughtExtent_Month.SevereDrought_pdsi_PM_RC(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))<-3))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.ModerateDrought_pdsi_PM_RC(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))<-2))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.MildDrought_pdsi_PM_RC(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))<-1))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.SevereMoist_pdsi_PM_RC(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))>3))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.ModerateMoist_pdsi_PM_RC(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))>2))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.MildMoist_pdsi_PM_RC(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC(:,:,ii))>1))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    % pdsi_PM_RC_CO2_Jarvis_H
    DroughtExtent_Month.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))<-3))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))<-2))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))<-1))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))>3))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))>2))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Jarvis_H(:,:,ii))>1))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    % pdsi_PM_RC_CO2_Yang
    DroughtExtent_Month.SevereDrought_pdsi_PM_RC_CO2_Yang(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))<-3))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.ModerateDrought_pdsi_PM_RC_CO2_Yang(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))<-2))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.MildDrought_pdsi_PM_RC_CO2_Yang(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))<-1))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.SevereMoist_pdsi_PM_RC_CO2_Yang(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))>3))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.ModerateMoist_pdsi_PM_RC_CO2_Yang(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))>2))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
    DroughtExtent_Month.MildMoist_pdsi_PM_RC_CO2_Yang(ii) = nansum(EarthLandArea_05deg((pdsi_PM_RC_CO2_Yang(:,:,ii))>1))...
        ./nansum(nansum(EarthLandArea_05deg(~isnan(landmask_05deg)))) .* 100;
end
clear ii
% Monthly Drought Extent to Yearly
iii = 1;
for ii = 1 : 12 : size(DroughtExtent_Month.SevereDrought_pdsi_PM_RC,2)
    A = DroughtExtent_Month.SevereDrought_pdsi_PM_RC(ii:ii+11);
    DroughtExtent_Year.SevereDrought_pdsi_PM_RC(iii) = nanmean(A);
    B = DroughtExtent_Month.ModerateDrought_pdsi_PM_RC(ii:ii+11);
    DroughtExtent_Year.ModerateDrought_pdsi_PM_RC(iii) = nanmean(B);
    C = DroughtExtent_Month.MildDrought_pdsi_PM_RC(ii:ii+11);
    DroughtExtent_Year.MildDrought_pdsi_PM_RC(iii) = nanmean(C);
    AA = DroughtExtent_Month.SevereMoist_pdsi_PM_RC(ii:ii+11);
    DroughtExtent_Year.SevereMoist_pdsi_PM_RC(iii) = nanmean(AA);
    BB = DroughtExtent_Month.ModerateMoist_pdsi_PM_RC(ii:ii+11);
    DroughtExtent_Year.ModerateMoist_pdsi_PM_RC(iii) = nanmean(BB);
    CC = DroughtExtent_Month.MildMoist_pdsi_PM_RC(ii:ii+11);
    DroughtExtent_Year.MildMoist_pdsi_PM_RC(iii) = nanmean(CC);
    AAA = DroughtExtent_Month.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(ii:ii+11);
    DroughtExtent_Year.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(iii) = nanmean(AAA);
    BBB = DroughtExtent_Month.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(ii:ii+11);
    DroughtExtent_Year.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(iii) = nanmean(BBB);
    CCC = DroughtExtent_Month.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(ii:ii+11);
    DroughtExtent_Year.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(iii) = nanmean(CCC);
    AAAA = DroughtExtent_Month.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(ii:ii+11);
    DroughtExtent_Year.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(iii) = nanmean(AAAA);
    BBBB = DroughtExtent_Month.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(ii:ii+11);
    DroughtExtent_Year.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(iii) = nanmean(BBBB);
    CCCC = DroughtExtent_Month.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(ii:ii+11);
    DroughtExtent_Year.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(iii) = nanmean(CCCC);
    AAAAA = DroughtExtent_Month.SevereDrought_pdsi_PM_RC_CO2_Yang(ii:ii+11);
    DroughtExtent_Year.SevereDrought_pdsi_PM_RC_CO2_Yang(iii) = nanmean(AAAAA);
    BBBBB = DroughtExtent_Month.ModerateDrought_pdsi_PM_RC_CO2_Yang(ii:ii+11);
    DroughtExtent_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang(iii) = nanmean(BBBBB);
    CCCCC = DroughtExtent_Month.MildDrought_pdsi_PM_RC_CO2_Yang(ii:ii+11);
    DroughtExtent_Year.MildDrought_pdsi_PM_RC_CO2_Yang(iii) = nanmean(CCCCC);
    AAAAAA = DroughtExtent_Month.SevereMoist_pdsi_PM_RC_CO2_Yang(ii:ii+11);
    DroughtExtent_Year.SevereMoist_pdsi_PM_RC_CO2_Yang(iii) = nanmean(AAAAAA);
    BBBBBB = DroughtExtent_Month.ModerateMoist_pdsi_PM_RC_CO2_Yang(ii:ii+11);
    DroughtExtent_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang(iii) = nanmean(BBBBBB);
    CCCCCC = DroughtExtent_Month.MildMoist_pdsi_PM_RC_CO2_Yang(ii:ii+11);
    DroughtExtent_Year.MildMoist_pdsi_PM_RC_CO2_Yang(iii) = nanmean(CCCCCC);
    clear A B C AA BB CC AAA BBB CCC AAAA BBBB CCCC AAAAA BBBBB CCCCC AAAAAA BBBBBB CCCCCC
    iii = iii+1;
end
clear ii iii;

%% (1.1.2) Drought Frequency Analysis
% Frequency records whether (1 or 0) PDSI < some value for every month
for ii = 1 : size( pdsi_PM_RC , 3)
    % pdsi_PM_RC
    Frequency.SevereDrought_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)<-3;
    Frequency.ModerateDrought_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)<-2;
    Frequency.MildDrought_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)<-1;
    Frequency.SevereMoist_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)>3;
    Frequency.ModerateMoist_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)>2;
    Frequency.MildMoist_pdsi_PM_RC(:,:,ii) = pdsi_PM_RC(:,:,ii)>1;
    % pdsi_PM_RC_CO2_Jarvis_H
    Frequency.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)<-3;
    Frequency.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)<-2;
    Frequency.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)<-1;
    Frequency.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)>3;
    Frequency.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)>2;
    Frequency.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii) = pdsi_PM_RC_CO2_Jarvis_H(:,:,ii)>1;
    % pdsi_PM_RC_CO2_Yang
    Frequency.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)<-3;
    Frequency.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)<-2;
    Frequency.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)<-1;
    Frequency.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)>3;
    Frequency.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)>2;
    Frequency.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,ii) = pdsi_PM_RC_CO2_Yang(:,:,ii)>1;
end
clear ii
% Drought Frequency: GridYear (how many months under drought or moist conditions for every year)
iii = 1;
for ii = 1 : 12 : size(Frequency.SevereDrought_pdsi_PM_RC,3)
    A = Frequency.SevereDrought_pdsi_PM_RC(:,:,ii:ii+11);
    GridYear.SevereDrought_pdsi_PM_RC(:,:,iii) = nansum(A,3).*landmask_05deg;
    B = Frequency.ModerateDrought_pdsi_PM_RC(:,:,ii:ii+11);
    GridYear.ModerateDrought_pdsi_PM_RC(:,:,iii) = nansum(B,3).*landmask_05deg;
    C = Frequency.MildDrought_pdsi_PM_RC(:,:,ii:ii+11);
    GridYear.MildDrought_pdsi_PM_RC(:,:,iii) = nansum(C,3).*landmask_05deg;
    AA = Frequency.SevereMoist_pdsi_PM_RC(:,:,ii:ii+11);
    GridYear.SevereMoist_pdsi_PM_RC(:,:,iii) = nansum(AA,3).*landmask_05deg;
    BB = Frequency.ModerateMoist_pdsi_PM_RC(:,:,ii:ii+11);
    GridYear.ModerateMoist_pdsi_PM_RC(:,:,iii) = nansum(BB,3).*landmask_05deg;
    CC = Frequency.MildMoist_pdsi_PM_RC(:,:,ii:ii+11);
    GridYear.MildMoist_pdsi_PM_RC(:,:,iii) = nansum(CC,3).*landmask_05deg;
    AAA = Frequency.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(AAA,3).*landmask_05deg;
    BBB = Frequency.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(BBB,3).*landmask_05deg;
    CCC = Frequency.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(CCC,3).*landmask_05deg;
    AAAA = Frequency.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(AAAA,3).*landmask_05deg;
    BBBB = Frequency.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(BBBB,3).*landmask_05deg;
    CCCC = Frequency.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,iii) = nansum(CCCC,3).*landmask_05deg;
    AAAAA = Frequency.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(AAAAA,3).*landmask_05deg;
    BBBBB = Frequency.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(BBBBB,3).*landmask_05deg;
    CCCCC = Frequency.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(CCCCC,3).*landmask_05deg;
    AAAAAA = Frequency.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(AAAAAA,3).*landmask_05deg;
    BBBBBB = Frequency.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(BBBBBB,3).*landmask_05deg;
    CCCCCC = Frequency.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,iii) = nansum(CCCCCC,3).*landmask_05deg;
    clear A B C AA BB CC AAA BBB CCC AAAA BBBB CCCC AAAAA BBBBB CCCCC AAAAAA BBBBBB CCCCCC
    iii = iii+1;
end
clear ii iii Frequency
% Yearly Grid to global average Yearly series : DroughtFrequency_GMAYear
for ii = 1 : size(GridYear.SevereDrought_pdsi_PM_RC , 3)
    A = GridYear.SevereDrought_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.ModerateDrought_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.ModerateDrought_pdsi_PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.MildDrought_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.MildDrought_pdsi_PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.SevereMoist_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.SevereMoist_pdsi_PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.ModerateMoist_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.ModerateMoist_pdsi_PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.MildMoist_pdsi_PM_RC(:,:,ii); DroughtFrequency_GMYear.MildMoist_pdsi_PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.ModerateDrought_pdsi_PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.MildDrought_pdsi_PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.SevereMoist_pdsi_PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.ModerateMoist_pdsi_PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(:,:,ii); DroughtFrequency_GMYear.MildMoist_pdsi_PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.SevereDrought_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
    A = GridYear.ModerateDrought_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.ModerateDrought_pdsi_PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
    A = GridYear.MildDrought_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.MildDrought_pdsi_PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
    A = GridYear.SevereMoist_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.SevereMoist_pdsi_PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
    A = GridYear.ModerateMoist_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.ModerateMoist_pdsi_PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
    A = GridYear.MildMoist_pdsi_PM_RC_CO2_Yang(:,:,ii); DroughtFrequency_GMYear.MildMoist_pdsi_PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
end
clear ii pdsi_PM_RC pdsi_PM_RC_CO2_Jarvis_H pdsi_PM_RC_CO2_Yang
DroughtFrequency_Year = GridYear; clear GridYear;
Ensemble_Mean_DroughtFrequency_Year = DroughtFrequency_Year;
%% (1.2) Output GridYear from 1850-2100
save(strcat(OutputDroughtPath_Princeton , 'DroughtFrequency_Year') , 'DroughtFrequency_Year');
clear DroughtFrequency_Year
% save monthly drought extent
save(strcat(OutputDroughtPath_Princeton , 'DroughtExtent_Month') , 'DroughtExtent_Month');
clear DroughtExtent_Month
% save yearly drought extent
save(strcat(OutputDroughtPath_Princeton , 'DroughtExtent_Year') , 'DroughtExtent_Year');
clear DroughtExtent_Year
% save global mean yearly drought frequency
save(strcat(OutputDroughtPath_Princeton , 'DroughtFrequency_GMYear') , 'DroughtFrequency_GMYear');
clear DroughtFrequency_GMYear
% save ensemble mean DroughtFrequency_Year
save(strcat(OutputDroughtPath_Princeton , 'Ensemble_Mean_DroughtFrequency_Year') , 'Ensemble_Mean_DroughtFrequency_Year');
clear Ensemble_Mean_DroughtFrequency_Year
