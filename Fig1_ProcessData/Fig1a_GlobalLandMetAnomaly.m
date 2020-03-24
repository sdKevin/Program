clc;clear all;close all;

%% Setting the input/output paths
InputPath_HistoricalMet = 'D:\CMIP6\Output\Output_Met\Met_Var_Historical_';
InputPath_ScenarioMet = 'D:\CMIP6\Output\Output_Met\Met_Var_ssp585_';
InputPath_Princeton = 'D:\CMIP6\Output\Output_Met\Met_Var_Princeton.mat';

% GlobalLand = Land from 60S to 90N
% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-LM','NorESM2-MM','UKESM1-0-LL'};

%% (1) Extract global average Climate variables Yearly Series over GlobalLand: Met_Year
for i_GCM = 1 : length(GCM_Ensemble)
    %% 1850-2014 Historical Year Series
    GCM = GCM_Ensemble{i_GCM};
    load(strcat(InputPath_HistoricalMet , GCM , '.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1 : 12 : size(Met_Var.Sg,3)
        A = Met_Var.Sg(:,:,ii:ii+11);
        GridYear.Sg(:,:,iii) = nanmean(A,3);
        B = Met_Var.Ta(:,:,ii:ii+11);
        GridYear.Ta(:,:,iii) = nanmean(B,3);
        C = Met_Var.VPD(:,:,ii:ii+11);
        GridYear.VPD(:,:,iii) = nanmean(C,3);
        D = Met_Var.CO2(:,:,ii:ii+11);
        GridYear.CO2(:,:,iii) = nanmean(D,3);
        E = Met_Var.U2(:,:,ii:ii+11);
        GridYear.U2(:,:,iii) = nanmean(E,3);
        F = Met_Var.pr(:,:,ii:ii+11);
        GridYear.pr(:,:,iii) = nanmean(F,3);
        clear A B C D E F
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year1
    for ii = 1:size(GridYear.Sg,3)
        A = GridYear.Sg(:,:,ii); Year1.Sg(ii) = nanmean(A(:));clear A;%Only Global Land
        A = GridYear.Ta(:,:,ii); Year1.Ta(ii) = nanmean(A(:));clear A;
        A = GridYear.VPD(:,:,ii); Year1.VPD(ii) = nanmean(A(:));clear A;
        A = GridYear.CO2(:,:,ii); Year1.CO2(ii) = nanmean(A(:));clear A;
        A = GridYear.U2(:,:,ii); Year1.U2(ii) = nanmean(A(:));clear A;
        A = GridYear.pr(:,:,ii); Year1.pr(ii) = nanmean(A(:));clear A;
    end
    GridYear_pr_Historical = GridYear.pr;
    clear ii GridYear Met_Var
    %% 2015-2100 ssp585 Year Series
    load(strcat(InputPath_ScenarioMet , GCM , '.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1 : 12:size(Met_Var.Sg,3)
        A = Met_Var.Sg(:,:,ii:ii+11);
        GridYear.Sg(:,:,iii) = nanmean(A,3);
        B = Met_Var.Ta(:,:,ii:ii+11);
        GridYear.Ta(:,:,iii) = nanmean(B,3);
        C = Met_Var.VPD(:,:,ii:ii+11);
        GridYear.VPD(:,:,iii) = nanmean(C,3);
        D = Met_Var.CO2(:,:,ii:ii+11);
        GridYear.CO2(:,:,iii) = nanmean(D,3);
        E = Met_Var.U2(:,:,ii:ii+11);
        GridYear.U2(:,:,iii) = nanmean(E,3);
        F = Met_Var.pr(:,:,ii:ii+11);
        GridYear.pr(:,:,iii) = nanmean(F,3);
        clear A B C D E F
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year2
    for ii = 1:size(GridYear.Sg,3)
        A = GridYear.Sg(:,:,ii); Year2.Sg(ii) = nanmean(A(:));clear A;%Only Global Land
        A = GridYear.Ta(:,:,ii); Year2.Ta(ii) = nanmean(A(:));clear A;
        A = GridYear.VPD(:,:,ii); Year2.VPD(ii) = nanmean(A(:));clear A;
        A = GridYear.CO2(:,:,ii); Year2.CO2(ii) = nanmean(A(:));clear A;
        A = GridYear.U2(:,:,ii); Year2.U2(ii) = nanmean(A(:));clear A;
        A = GridYear.pr(:,:,ii); Year2.pr(ii) = nanmean(A(:));clear A;
    end
    GridYear_pr_Future = GridYear.pr;
    clear ii GridYear Met_Var
    %% Output Met_Year from 1850-2100
    Met_Year.Sg(i_GCM,:) = [Year1.Sg , Year2.Sg];
    Met_Year.Ta(i_GCM,:) = [Year1.Ta , Year2.Ta];
    Met_Year.VPD(i_GCM,:) = [Year1.VPD , Year2.VPD];
    Met_Year.CO2(i_GCM,:) = [Year1.CO2 , Year2.CO2];
    Met_Year.U2(i_GCM,:) = [Year1.U2 , Year2.U2];
    Met_Year.pr(i_GCM,:) = [Year1.pr , Year2.pr];
    clear Year1 Year2
    %% Output GridYear from 1850-2100
    pr_GridYear = cat(3 , GridYear_pr_Historical , GridYear_pr_Future);
    clear GridYear_pr_Historical GridYear_pr_Future
    save(['pr_GridYear_' GCM],'pr_GridYear')
    clear GridYear GCM
end
clear GCM_Ensemble GCM i_GCM Mask_Path
save('Met_Year','Met_Year');
%% Princeton
load(InputPath_Princeton);
% Monthly Grid to Yearly Grid : GridYear
iii = 1;
for ii = 1:12:size(Met_Var.Sg,3)
    A = Met_Var.Sg(:,:,ii:ii+11);
    GridYear.Sg(:,:,iii) = nanmean(A,3);
    B = Met_Var.Ta(:,:,ii:ii+11);
    GridYear.Ta(:,:,iii) = nanmean(B,3);
    C = Met_Var.VPD(:,:,ii:ii+11);
    GridYear.VPD(:,:,iii) = nanmean(C,3);
    D = Met_Var.CO2(:,:,ii:ii+11);
    GridYear.CO2(:,:,iii) = nanmean(D,3);
    E = Met_Var.U2(:,:,ii:ii+11);
    GridYear.U2(:,:,iii) = nanmean(E,3);
    F = Met_Var.pr(:,:,ii:ii+11);
    GridYear.pr(:,:,iii) = nanmean(F,3);
    clear A B C D E F
    iii = iii+1;
end
clear ii iii;
% Yearly Grid to Yearly series : Year1
for ii = 1:size(GridYear.Sg,3)
    A = GridYear.Sg(:,:,ii);Year1.Sg(ii) = nanmean(A(:));clear A;%Only Global Land
    A = GridYear.Ta(:,:,ii);Year1.Ta(ii) = nanmean(A(:));clear A;
    A = GridYear.VPD(:,:,ii);Year1.VPD(ii) = nanmean(A(:));clear A;
    A = GridYear.CO2(:,:,ii);Year1.CO2(ii) = nanmean(A(:));clear A;
    A = GridYear.U2(:,:,ii);Year1.U2(ii) = nanmean(A(:));clear A;
    A = GridYear.pr(:,:,ii);Year1.pr(ii) = nanmean(A(:));clear A;
end
%% Output GridYear from 1850-2100
pr_GridYear = GridYear.pr;
save(['pr_GridYear_Princeton'],'pr_GridYear')
Met_Year_Princeton = Year1;
save('Met_Year_Princeton','Met_Year_Princeton');
%% (2) Drawing
clc;clear all;
load('D:\CMIP6\Program1\Fig1_ProcessData\Met_Year.mat')
Met_Year_NoBias = Met_Year;clear Met_Year; % Use Met_Year_NoBias to draw Bar indicate need Bias Correction
load Met_Year; % Each Row represents Each GCM; Each Column represents Each Year;
load Frank_Ta_range; % Frank + BerkeleyÊý¾Ý Each Row represents Each GCM; Each Column represents Each Year;
load Year_CO2; % Meinshausen 2017, annual CO2 1000-1850
Fig1a_Plotting( Met_Year , Frank_Ta_range(1:850,:) , CO2 , Met_Year_NoBias);% 2&3 inputs from are before 1850
