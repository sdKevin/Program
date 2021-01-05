%%
% Programmed by Wei Tian,  Jan.5,2021
% IGSNRR, Beijing, China
clc
clear
%% Input and output path
% Precipitation input
InputpathPr = 'J:\Kaiwen_CMIP6\Drought_data_PM\Pr';
% potential evapotranspiration input
InputpathET = 'J:\Kaiwen_CMIP6\Drought_data_PM\PET';
% available water capacity input
Inputpathbasic = 'J:\Kaiwen_CMIP6\Drought_data\BasicData';
% PDSI output
Ouputpath = 'J:\Kaiwen_CMIP6\Drought_data_PM\PDSI';

%% New output folder
mkdir([Ouputpath,'\Historical'])
mkdir([Ouputpath,'\ScenarioMIP_ssp126'])
mkdir([Ouputpath,'\ScenarioMIP_ssp245'])
mkdir([Ouputpath,'\ScenarioMIP_ssp370'])
mkdir([Ouputpath,'\ScenarioMIP_ssp585'])

%% load available water capacity (AWC)
% Global Gridded Surfaces of Selected Soil Characteristics
% (https://webmap.ornl.gov/ogcdown/dataset.jsp?ds_id=569£©
load([Inputpathbasic,'\AWC.mat'])

% Mode name
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};

for i_GCM = 1 : length(GCM_Ensemble)
    GCM = GCM_Ensemble{i_GCM}
    if strcmp(GCM_Ensemble{i_GCM},'HadGEM3-GC31-LL')
        ssp = {'ssp126','ssp245','ssp585'};
    else
        ssp = {'ssp126','ssp245','ssp370','ssp585'};
    end
    
    %% load historical data
    % (1) precipitation
    R1 = load([InputpathPr,'\Historical\','Pr_Historical_',GCM,'.mat']);
    Pr_his = R1.Pr;clear R1
    Pr_his(:,:,[1:612]) = [];
    % (2) potential evapotranspiration
    R1 = load([InputpathET,'\Historical\','PET_Historical_',GCM,'.mat']);
    PET_his = R1.PET;clear R1
    PET_his(:,:,[1:612]) = [];% Delete data from 1850 to 1900
    
    for i_ssp = 1 : length(ssp)
        ssp{i_ssp}
        %% load SSP data
        % (1) precipitation
        R1 = load([InputpathPr,'\ScenarioMIP_',ssp{i_ssp},'\Pr_',ssp{i_ssp},'_',...
            GCM,'.mat']);
        Pr_ssp = R1.Pr;clear R1
        % (2) potential evapotranspiration
        R1 = load([InputpathET,'\ScenarioMIP_',ssp{i_ssp},'\PET_',ssp{i_ssp},'_',...
            GCM,'.mat']);
        PET_ssp = R1.PET;clear R1
        
        %% Concatenate historical data and SSP data
        Pr = cat(3,Pr_his,Pr_ssp);
        PET = cat(3,PET_his,PET_ssp);
        [m,n,p]=size(Pr);
        cal_mon=p;
        Year=[1901:2100]; %Calculation period
        %% Calculate PDSI
        for i=1:m
            i
            for j=1:n
                % Extract the precipitation data corresponding to the grid
                data1=squeeze(Pr(i,j,[1:cal_mon]));
                % Extract the potential evapotranspiration data corresponding to the grid
                data2=squeeze(PET(i,j,[1:cal_mon]));
                % Extract the AWC data corresponding to the grid
                awc=AWC(i,j);
                
                if nansum(isnan(data1(:,end)))==0 &&  nansum(isnan(data2(:,end)))==0 && isnan(awc)==0
                    % Input data includes [year,month,monthly potential evapotranspiration,
                    % monthly precipitation,available water capacity]
                    DATA=[DateGens(Year),data2,data1,awc*ones(cal_mon,1)];
                    % Calculate PDSI.
                    % In this case, the calibration period is from 1901 to 2014
                    PDSI_v = PDSI(DATA,1901,2014);
                    PDSI_v = real(PDSI_v);
                    if nansum(PDSI_v)==0
                        pdsi_q(i,j,[1:cal_mon])=NaN;
                    else
                        pdsi_q(i,j,[1:cal_mon])=PDSI_v;
                        clear PDSI_v
                    end
                else
                    pdsi_q(i,j,[1:cal_mon])=NaN;
                end
                clear data1 data2
            end
        end
        % PDSI for ssp
        pdsi = pdsi_q(:,:,[1369:end]);
        if i_ssp == 1
            save([Ouputpath,'\ScenarioMIP_',ssp{i_ssp},'\PDSI_',ssp{i_ssp},'_',GCM,'.mat'],'pdsi','-v7.3')
            clear pdsi
            % PDSI for historical period
            pdsi = pdsi_q(:,:,[1:1368]);
            save([Ouputpath,'\Historical\','PDSI_Historical_',GCM,'.mat'],'pdsi','-v7.3')
            clear pdsi pdsi_q Pr PET
        else
            save([Ouputpath,'\ScenarioMIP_',ssp{i_ssp},'\PDSI_',ssp{i_ssp},'_',GCM,'.mat'],'pdsi','-v7.3')
            clear pdsi pdsi_q Pr PET
        end
    end
    clear Pr_his PET_his
end