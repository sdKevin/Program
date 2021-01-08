%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
clc
clear
%% Input and output path
% Precipitation input
InputpathPr = 'J:\Kaiwen_CMIP6\Drought_data\Pr';
% SPEI output
Ouputpath = 'J:\Kaiwen_CMIP6\Drought_data\SPEI-3';
%% New output folder
mkdir([Ouputpath,'\Historical'])
mkdir([Ouputpath,'\ScenarioMIP_ssp126'])
mkdir([Ouputpath,'\ScenarioMIP_ssp245'])
mkdir([Ouputpath,'\ScenarioMIP_ssp370'])
mkdir([Ouputpath,'\ScenarioMIP_ssp585'])

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
    %  precipitation
    R1 = load([InputpathPr,'\Historical\','Pr_Historical_',GCM,'.mat']);
    Pr_his = R1.Pr;clear R1
    Pr_his(:,:,[1:612]) = [];% Delete data from 1850 to 1900
    
    for i_ssp = 1 : length(ssp)
        ssp{i_ssp}
        %% load SSP data
        % precipitation
        R1 = load([InputpathPr,'\ScenarioMIP_',ssp{i_ssp},'\Pr_',ssp{i_ssp},'_',...
            GCM,'.mat']);
        Pr_ssp = R1.Pr;clear R1
       %% Concatenate historical data and SSP data
        Pr = cat(3,Pr_his,Pr_ssp);
        Pr(Pr<0) = 0;
        [m,n,p]=size(Pr);
        cal_mon=p;
        Year=[1901:2100];%Calculation period
        %% Calculate SPI
        for i=1:m
            i
            for j=1:n
                % Extract the precipitation data corresponding to the grid
                data1=squeeze(Pr(i,j,[1:cal_mon]));
                if nansum(isnan(data1(:,end)))==0 &&  nansum(isnan(data2(:,end)))==0
                   % Input data includes [year,month,monthly precipitation,
                   % monthly potential evapotranspiration]
                    DATA=[DateGens(Year),data1,data2];
                    % Calculate SPI.
                    % In this case, the calibration period is from 1901 to
                    % 2014; Scale is 3 months.               
                    SPI_v=SPIc(DATA,1901, 2014,3,12);;
                    if nansum(SPI_v)==0
                        spi_q(i,j,[1:cal_mon])=NaN;
                    else
                        spi_q(i,j,[1:cal_mon])=SPI_v;
                        clear SPI_v
                    end
                else
                    spi_q(i,j,[1:cal_mon])=NaN;
                end
                clear data1
            end
        end
        % SPI for ssp
        spi3 = spi_q(:,:,[1369:end]);
        if i_ssp == 1
            save([Ouputpath,'\ScenarioMIP_',ssp{i_ssp},'\spi3_',ssp{i_ssp},'_',GCM,'.mat'],'spi3','-v7.3')
            clear spi3
             % SPEI for historical period
            spei3 = spei_q(:,:,[1:1368]);
            save([Ouputpath,'\Historical\','spei3_Historical_',GCM,'.mat'],'spei3','-v7.3')
            clear spi3 spi_q Pr
        else
            save([Ouputpath,'\ScenarioMIP_',ssp{i_ssp},'\spei3_',ssp{i_ssp},'_',GCM,'.mat'],'spei3','-v7.3')
            clear spi3 spi_q Pr
        end
    end
    clear Pr_his PET_his
end