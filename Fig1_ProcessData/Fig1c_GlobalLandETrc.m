clc;clear all;close all;
% GlobalLand = Land from 60S to 90N
% Name of 13 CLMs
AllCLM = {'BCC-CSM2-MR_r1';'CanESM5_r1_r6';'CESM2_r1';'CESM2-WACCM_r1';...
    'CNRM-CM6-1_r1';'FGOALS-g3_r1';'GFDL-ESM4_r1';'IPSL-CM6A-LR_r1';...
    'MIROC6_r1';'MIROC-ES2L_r1';'MRI-ESM2-0_r1';'UKESM1-0-LL_r1';'CNRM-ESM2-1_r2'};
%% (1) ETrc_GridYear: from 1850-2100 Yearly gridded ETrc; ETrc_Year from 1850-2100 Year ETrc time series
for CLM_i = 1:13
    %% 1850-2014 Historical Year Series
    PM_RC_CO2_Jarvis_H_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_CO2_Jarvis_H_Historical_';
    PM_RC_CO2_Yang_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_CO2_Yang_Historical_';
    PM_RC_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_Historical_';
    CLM = AllCLM{CLM_i};
    load(strcat(PM_RC_CO2_Jarvis_H_Path,CLM,'.mat'));
    load(strcat(PM_RC_CO2_Yang_Path,CLM,'.mat'));
    load(strcat(PM_RC_Path,CLM,'.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1:12:size(PM_RC,3)
        A = PM_RC(:,:,ii:ii+11);
        GridYear.PM_RC(:,:,iii) = nanmean(A,3).*365; %% mm/day to mm/year
        B = PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
        GridYear.PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3).*365;
        C = PM_RC_CO2_Yang(:,:,ii:ii+11);
        GridYear.PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3).*365;
        clear A B C
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year1
    for ii = 1:size( GridYear.PM_RC,3)
        A = GridYear.PM_RC(:,:,ii);Year1.PM_RC(ii) = nanmean(A(:));clear A;%Only Global Land
        A = GridYear.PM_RC_CO2_Jarvis_H(:,:,ii);Year1.PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:));clear A;
        A = GridYear.PM_RC_CO2_Yang(:,:,ii);Year1.PM_RC_CO2_Yang(ii) = nanmean(A(:));clear A;
    end
    GridYear_Historical = GridYear;
    clear ii GridYear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Yang PM_RC_CO2_Jarvis_H_Path PM_RC_CO2_Yang_Path PM_RC_Path
    %% 2015-2100 ssp585 Year Series
    PM_RC_CO2_Jarvis_H_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_CO2_Jarvis_H_ssp585_';
    PM_RC_CO2_Yang_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_CO2_Yang_ssp585_';
    PM_RC_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_ssp585_';
    load(strcat(PM_RC_CO2_Jarvis_H_Path,CLM,'.mat'));
    load(strcat(PM_RC_CO2_Yang_Path,CLM,'.mat'));
    load(strcat(PM_RC_Path,CLM,'.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1:12:size(PM_RC,3)
        A = PM_RC(:,:,ii:ii+11);
        GridYear.PM_RC(:,:,iii) = nanmean(A,3).*365; %% mm/day to mm/year
        B = PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
        GridYear.PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3).*365;
        C = PM_RC_CO2_Yang(:,:,ii:ii+11);
        GridYear.PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3).*365;
        clear A B C
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year2
    for ii = 1:size( GridYear.PM_RC,3)
        A = GridYear.PM_RC(:,:,ii);Year2.PM_RC(ii) = nanmean(A(:));clear A;%Only Global Land
        A = GridYear.PM_RC_CO2_Jarvis_H(:,:,ii);Year2.PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:));clear A;
        A = GridYear.PM_RC_CO2_Yang(:,:,ii);Year2.PM_RC_CO2_Yang(ii) = nanmean(A(:));clear A;
    end
    GridYear_Future = GridYear;
    clear ii GridYear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Yang PM_RC_CO2_Jarvis_H_Path PM_RC_CO2_Yang_Path PM_RC_Path
    %% Output ETrc_Year from 1850-2100
    ETrc_Year.PM_RC(CLM_i,:)=[Year1.PM_RC,Year2.PM_RC];
    ETrc_Year.PM_RC_CO2_Jarvis_H(CLM_i,:)=[Year1.PM_RC_CO2_Jarvis_H,Year2.PM_RC_CO2_Jarvis_H];
    ETrc_Year.PM_RC_CO2_Yang(CLM_i,:)=[Year1.PM_RC_CO2_Yang,Year2.PM_RC_CO2_Yang];
    clear Year1 Year2
    %% Output GridYear from 1850-2100
    ETrc_GridYear.PM_RC = cat(3,GridYear_Historical.PM_RC,GridYear_Future.PM_RC);
    ETrc_GridYear.PM_RC_CO2_Jarvis_H = cat(3,GridYear_Historical.PM_RC_CO2_Jarvis_H,GridYear_Future.PM_RC_CO2_Jarvis_H);
    ETrc_GridYear.PM_RC_CO2_Yang = cat(3,GridYear_Historical.PM_RC_CO2_Yang,GridYear_Future.PM_RC_CO2_Yang);
    clear GridYear_Historical GridYear_Future
    save(['ETrc_GridYear_' CLM],'ETrc_GridYear')
    clear GridYear CLM
end
clear AllCLM CLM CLM_i
save('ETrc_Year','ETrc_Year');
%% (2) Princeton
PM_RC_CO2_Jarvis_H_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_CO2_Jarvis_H_Princeton.mat';
PM_RC_CO2_Yang_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_CO2_Yang_Princeton.mat';
PM_RC_Path = 'D:\CMIP6\Program\Output_ETrc\PM_RC_Princeton.mat';
load(PM_RC_CO2_Jarvis_H_Path);
load(PM_RC_CO2_Yang_Path);
load(PM_RC_Path);
% Monthly Grid to Yearly Grid : GridYear
iii = 1;
for ii = 1:12:size(PM_RC,3)
    A = PM_RC(:,:,ii:ii+11);
    GridYear.PM_RC(:,:,iii) = nanmean(A,3).*365; %% mm/day to mm/year
    B = PM_RC_CO2_Jarvis_H(:,:,ii:ii+11);
    GridYear.PM_RC_CO2_Jarvis_H(:,:,iii) = nanmean(B,3).*365;
    C = PM_RC_CO2_Yang(:,:,ii:ii+11);
    GridYear.PM_RC_CO2_Yang(:,:,iii) = nanmean(C,3).*365;
    clear A B C
    iii = iii+1;
end
clear ii iii;
% Yearly Grid to Yearly series : Year2
for ii = 1:size( GridYear.PM_RC,3)
    A = GridYear.PM_RC(:,:,ii);Year2.PM_RC(ii) = nanmean(A(:));clear A;%Only Global Land
    A = GridYear.PM_RC_CO2_Jarvis_H(:,:,ii);Year2.PM_RC_CO2_Jarvis_H(ii) = nanmean(A(:));clear A;
    A = GridYear.PM_RC_CO2_Yang(:,:,ii);Year2.PM_RC_CO2_Yang(ii) = nanmean(A(:));clear A;
end
ETrc_Year = Year2;
ETrc_GridYear = GridYear;
save('ETrc_GridYear_Princeton','ETrc_GridYear')
save('ETrc_Year_Princeton','ETrc_Year');
clear ii GridYear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Yang PM_RC_CO2_Jarvis_H_Path PM_RC_CO2_Yang_Path PM_RC_Path
%% (3) Drawing
clc;clear all;
load ETrc_Year
load Met_Year
% Name of 13 CLMs
AllCLM = {'BCC-CSM2-MR_r1';'CanESM5_r1_r6';'CESM2_r1';'CESM2-WACCM_r1';...
    'CNRM-CM6-1_r1';'FGOALS-g3_r1';'GFDL-ESM4_r1';'IPSL-CM6A-LR_r1';...
    'MIROC6_r1';'MIROC-ES2L_r1';'MRI-ESM2-0_r1';'UKESM1-0-LL_r1';'CNRM-ESM2-1_r2'};
% Ensemble Analysis
for CLM_i = 1:13
    load(['ETrc_GridYear_',AllCLM{CLM_i},'.mat'])
    close all
    PM_RC_1990_2019(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC(:,:,141:170),3);
    PM_RC_CO2_Yang_1990_2019(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Yang(:,:,141:170),3);
    PM_RC_CO2_Jarvis_H_1990_2019(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,141:170),3);
    
    PM_RC_2070_2099(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC(:,:,221:250),3);
    PM_RC_CO2_Yang_2070_2099(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Yang(:,:,221:250),3);
    PM_RC_CO2_Jarvis_H_2070_2099(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,221:250),3);
    
    %     mesh((PM_RC_CO2_Yang_2070_2099(:,:,CLM_i)-PM_RC_2070_2099(:,:,CLM_i))./PM_RC_2070_2099(:,:,CLM_i).*100);
    %     mesh((PM_RC_CO2_Jarvis_H_2070_2099(:,:,CLM_i)-PM_RC_2070_2099(:,:,CLM_i))./PM_RC_2070_2099(:,:,CLM_i).*100);
    %     view(90,-90)
    %     colorbar
    clear GridYear
    %     pause(5)
end
Fig1c_Plotting( ETrc_Year , Met_Year.pr.*1000.*31536000./997 , PM_RC_2070_2099 , PM_RC_CO2_Yang_2070_2099 , PM_RC_CO2_Jarvis_H_2070_2099)


