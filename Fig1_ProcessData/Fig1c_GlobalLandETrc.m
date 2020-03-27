clc; clear all; close all;

%% Setting the input/output paths
InputPath_ETrc = 'D:\CMIP6\Output\Output_ETrc';
OutputPath_Yearly = 'D:\CMIP6\Output\Output_Yearly';

% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
%% (1) ETrc_GridYear: from 1850-2100 Yearly gridded ETrc; ETrc_Year from 1850-2100 Year ETrc time series
for i_GCM = 1 : length(GCM_Ensemble)
    %% 1850-2014 Historical Year Series
    GCM = GCM_Ensemble{i_GCM};
    load(strcat(InputPath_ETrc , '\PM_RC_CO2_Jarvis_H_Historical_' , GCM , '.mat'));
    load(strcat(InputPath_ETrc , '\PM_RC_CO2_Yang_Historical_' , GCM , '.mat'));
    load(strcat(InputPath_ETrc , '\PM_RC_Historical_' , GCM , '.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1:12:size(PM_RC,3)
        A = PM_RC(:,:,ii:ii+11);
        GridYear.PM_RC(:,:,iii) = nanmean(A,3) .* 365; % mm/day to mm/year
        B = PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
        GridYear.PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3) .* 365;
        C = PM_RC_CO2_Yang(:,:,ii:ii+11);
        GridYear.PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3) .* 365;
        clear A B C
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year1
    for ii = 1:size( GridYear.PM_RC,3)
        A = GridYear.PM_RC(:,:,ii); Year1.PM_RC(ii) = nanmean(A(:)); clear A;
        A = GridYear.PM_RC_CO2_Jarvis_H(:,:,ii); Year1.PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
        A = GridYear.PM_RC_CO2_Yang(:,:,ii); Year1.PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
    end
    GridYear_Historical = GridYear;
    clear ii GridYear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Yang 
    %% 2015-2100 ssp Year Series
    load(strcat(InputPath_ETrc , '\PM_RC_CO2_Jarvis_H_ssp585_' , GCM , '.mat'));
    load(strcat(InputPath_ETrc , '\PM_RC_CO2_Yang_ssp585_' , GCM , '.mat'));
    load(strcat(InputPath_ETrc , '\PM_RC_ssp585_' , GCM , '.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1 : 12 : size(PM_RC , 3)
        A = PM_RC(:,:,ii:ii+11);
        GridYear.PM_RC(:,:,iii) = nanmean(A,3) .* 365; %% mm/day to mm/year
        B = PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
        GridYear.PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3) .* 365;
        C = PM_RC_CO2_Yang(:,:,ii:ii+11);
        GridYear.PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3) .* 365;
        clear A B C
        iii = iii + 1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year2
    for ii = 1 : size(GridYear.PM_RC , 3)
        A = GridYear.PM_RC(:,:,ii); Year2.PM_RC(ii) = nanmean(A(:)); clear A;
        A = GridYear.PM_RC_CO2_Jarvis_H(:,:,ii); Year2.PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
        A = GridYear.PM_RC_CO2_Yang(:,:,ii); Year2.PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
    end
    GridYear_Future = GridYear;
    clear ii GridYear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Yang
    %% Output ETrc_Year from 1850-2100
    ETrc_Year.PM_RC(i_GCM,:) = [Year1.PM_RC , Year2.PM_RC];
    ETrc_Year.PM_RC_CO2_Jarvis_H(i_GCM,:) = [Year1.PM_RC_CO2_Jarvis_H , Year2.PM_RC_CO2_Jarvis_H];
    ETrc_Year.PM_RC_CO2_Yang(i_GCM,:) = [Year1.PM_RC_CO2_Yang , Year2.PM_RC_CO2_Yang];
    clear Year1 Year2
    %% Output GridYear from 1850-2100
    ETrc_GridYear.PM_RC = cat(3,GridYear_Historical.PM_RC,GridYear_Future.PM_RC);
    ETrc_GridYear.PM_RC_CO2_Jarvis_H = cat(3,GridYear_Historical.PM_RC_CO2_Jarvis_H,GridYear_Future.PM_RC_CO2_Jarvis_H);
    ETrc_GridYear.PM_RC_CO2_Yang = cat(3,GridYear_Historical.PM_RC_CO2_Yang,GridYear_Future.PM_RC_CO2_Yang);
    
    save(strcat(OutputPath_Yearly , '\ETrc_GridYear_' , GCM) , 'ETrc_GridYear');
    clear GCM GridYear_Historical GridYear_Future ETrc_GridYear
end
clear GCM_Ensemble GCM i_GCM
save(strcat(OutputPath_Yearly , '\ETrc_Year') , 'ETrc_Year');
%% (2) Princeton
load(strcat(InputPath_ETrc , '\PM_RC_CO2_Jarvis_H_Princeton.mat'));
load(strcat(InputPath_ETrc , '\PM_RC_CO2_Yang_Princeton.mat'));
load(strcat(InputPath_ETrc , '\PM_RC_Princeton.mat'));
% Monthly Grid to Yearly Grid : GridYear
iii = 1;
for ii = 1 : 12 : size(PM_RC , 3)
    A = PM_RC(:,:,ii:ii+11);
    GridYear.PM_RC(:,:,iii) = nanmean(A,3) .* 365; %% mm/day to mm/year
    B = PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3) .* 365;
    C = PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3) .* 365;
    clear A B C
    iii = iii+1;
end
clear ii iii;
% Yearly Grid to Yearly series : Year2
for ii = 1:size( GridYear.PM_RC,3)
    A = GridYear.PM_RC(:,:,ii); Year2.PM_RC(ii) = nanmean(A(:)); clear A;
    A = GridYear.PM_RC_CO2_Jarvis_H(:,:,ii); Year2.PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:)); clear A;
    A = GridYear.PM_RC_CO2_Yang(:,:,ii); Year2.PM_RC_CO2_Yang(ii) = nanmean(A(:)); clear A;
end
ETrc_Year = Year2;
ETrc_GridYear = GridYear;

save(strcat(OutputPath_Yearly , '\ETrc_GridYear_Princeton'),'ETrc_GridYear');
save(strcat(OutputPath_Yearly , '\ETrc_Year_Princeton') , 'ETrc_Year');
clear ii GridYear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Yang
%% (3) Drawing
load([OutputPath_Yearly , '\ETrc_Year.mat'])
load([OutputPath_Yearly , '\Met_Year.mat'])
% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','UKESM1-0-LL'};
% Ensemble Analysis
for i_GCM = 1 : length(GCM_Ensemble)
    
    load([OutputPath_Yearly '\ETrc_GridYear_',GCM_Ensemble{i_GCM},'.mat'])
    close all
    PM_RC_1990_2019(: , : , i_GCM) = mean(ETrc_GridYear.PM_RC(:,:,141:170),3);
    PM_RC_CO2_Yang_1990_2019(: , : , i_GCM) = mean(ETrc_GridYear.PM_RC_CO2_Yang(:,:,141:170),3);
    PM_RC_CO2_Jarvis_H_1990_2019(: , : , i_GCM) = mean(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,141:170),3);
    
    PM_RC_2070_2099(: , : , i_GCM) = mean(ETrc_GridYear.PM_RC(:,:,221:250),3);
    PM_RC_CO2_Yang_2070_2099(: , : , i_GCM) = mean(ETrc_GridYear.PM_RC_CO2_Yang(:,:,221:250),3);
    PM_RC_CO2_Jarvis_H_2070_2099(: , : , i_GCM) = mean(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,221:250),3);
    
    %     mesh((PM_RC_CO2_Yang_2070_2099(:,:,i_GCM)-PM_RC_2070_2099(:,:,i_GCM))./PM_RC_2070_2099(:,:,i_GCM).*100);
    %     mesh((PM_RC_CO2_Jarvis_H_2070_2099(:,:,i_GCM)-PM_RC_2070_2099(:,:,i_GCM))./PM_RC_2070_2099(:,:,i_GCM).*100);
    %     view(90,-90)
    %     colorbar
    clear GridYear
    %     pause(5)
end
Fig1c_Plotting( ETrc_Year , Met_Year.pr.*1000.*31536000./997 , PM_RC_2070_2099 , PM_RC_CO2_Yang_2070_2099 , PM_RC_CO2_Jarvis_H_2070_2099)
