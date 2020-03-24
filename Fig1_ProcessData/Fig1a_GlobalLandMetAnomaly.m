clc;clear all;close all;
% GlobalLand = Land from 60S to 90N
% Name of 13 CLMs
AllCLM = {'BCC-CSM2-MR_r1';'CanESM5_r1_r6';'CESM2_r1';'CESM2-WACCM_r1';...
    'CNRM-CM6-1_r1';'FGOALS-g3_r1';'GFDL-ESM4_r1';'IPSL-CM6A-LR_r1';...
    'MIROC6_r1';'MIROC-ES2L_r1';'MRI-ESM2-0_r1';'UKESM1-0-LL_r1';'CNRM-ESM2-1_r2'};
%% (1) Extract global average Climate variables Yearly Series over GlobalLand: Met_Year
%% CLM
for CLM_i = 1:13
    %% 1850-2014 Historical Year Series
    Met_Path = 'D:\CMIP6\Program\Output_Met\Met_Var_Historical_';
    CLM = AllCLM{CLM_i};
    load(strcat(Met_Path,CLM,'.mat'));
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
    GridYear_pr_Historical = GridYear.pr;
    clear ii GridYear Met_Var Met_Path
    %% 2015-2100 ssp585 Year Series
    Met_Path = 'D:\CMIP6\Program\Output_Met\Met_Var_ssp585_';
    load(strcat(Met_Path,CLM,'.mat'));
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
    % Yearly Grid to Yearly series : Year2
    for ii = 1:size(GridYear.Sg,3)
        A = GridYear.Sg(:,:,ii);Year2.Sg(ii) = nanmean(A(:));clear A;%Only Global Land
        A = GridYear.Ta(:,:,ii);Year2.Ta(ii) = nanmean(A(:));clear A;
        A = GridYear.VPD(:,:,ii);Year2.VPD(ii) = nanmean(A(:));clear A;
        A = GridYear.CO2(:,:,ii);Year2.CO2(ii) = nanmean(A(:));clear A;
        A = GridYear.U2(:,:,ii);Year2.U2(ii) = nanmean(A(:));clear A;
        A = GridYear.pr(:,:,ii);Year2.pr(ii) = nanmean(A(:));clear A;
    end
    GridYear_pr_Future = GridYear.pr;
    clear ii GridYear Met_Var Met_Path
    %% Output Met_Year from 1850-2100
    Met_Year.Sg(CLM_i,:)=[Year1.Sg,Year2.Sg];
    Met_Year.Ta(CLM_i,:)=[Year1.Ta,Year2.Ta];
    Met_Year.VPD(CLM_i,:)=[Year1.VPD,Year2.VPD];
    Met_Year.CO2(CLM_i,:)=[Year1.CO2,Year2.CO2];
    Met_Year.U2(CLM_i,:)=[Year1.U2,Year2.U2];
    Met_Year.pr(CLM_i,:)=[Year1.pr,Year2.pr];
    clear Year1 Year2 sftlf
    %% Output GridYear from 1850-2100
    pr_GridYear = cat(3,GridYear_pr_Historical,GridYear_pr_Future);
    clear GridYear_pr_Historical GridYear_pr_Future
    save(['pr_GridYear_' CLM],'pr_GridYear')
    clear GridYear CLM
end
clear AllCLM CLM CLM_i Mask_Path
save('Met_Year','Met_Year');
%% Princeton
Met_Path = 'D:\CMIP6\Program\Output_Met\Met_Var_Princeton.mat';
load(Met_Path);
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
load Met_Year; % Each Row represents Each CLM; Each Column represents Each Year;
load Frank_Ta_range; % Frank + BerkeleyÊý¾Ý Each Row represents Each CLM; Each Column represents Each Year;
load Year_CO2; % Meinshausen 2017, annual CO2 1000-1850
Fig1a_Plotting( Met_Year , Frank_Ta_range(1:850,:) , CO2 , Met_Year_NoBias);% 2&3 inputs from are before 1850
