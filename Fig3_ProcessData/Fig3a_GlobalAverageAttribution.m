clc;clear all;close all;
%% (1) Global average Attribution
% Name of 13 CLMs
AllCLM = {'BCC-CSM2-MR_r1';'CanESM5_r1_r6';'CESM2_r1';'CESM2-WACCM_r1';...
    'CNRM-CM6-1_r1';'FGOALS-g3_r1';'GFDL-ESM4_r1';'IPSL-CM6A-LR_r1';...
    'MIROC6_r1';'MIROC-ES2L_r1';'MRI-ESM2-0_r1';'UKESM1-0-LL_r1';'CNRM-ESM2-1_r2'};
% Ensemble Analysis
for CLM_i = 1:13
    %% 1850-2014 Historical Year Series
    Met_Path = 'D:\CMIP6\Program\Output_Attribution\Middle_Var_Historical_';
    CLM = AllCLM{CLM_i};
    load(strcat(Met_Path,CLM,'.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1:12:size(Middle_Var.s,3)
        A = Middle_Var.s(:,:,ii:ii+11);
        GridYear.s(:,:,iii) = nanmean(A,3);
        B = Middle_Var.lamda(:,:,ii:ii+11);
        GridYear.lamda(:,:,iii) = nanmean(B,3);
        C = Middle_Var.gamma(:,:,ii:ii+11);
        GridYear.gamma(:,:,iii) = nanmean(C,3);
        D = Middle_Var.rs_H(:,:,ii:ii+11);
        GridYear.rs_H(:,:,iii) = nanmean(D,3);
        E = Middle_Var.rs_Yang(:,:,ii:ii+11);
        GridYear.rs_Yang(:,:,iii) = nanmean(E,3);
        F = Middle_Var.ra(:,:,ii:ii+11);
        GridYear.ra(:,:,iii) = nanmean(F,3);
        AA = Middle_Var.ea(:,:,ii:ii+11);
        GridYear.ea(:,:,iii) = nanmean(AA,3);
        BB = Middle_Var.pa(:,:,ii:ii+11);
        GridYear.pa(:,:,iii) = nanmean(BB,3);
        CC = Middle_Var.Ca(:,:,ii:ii+11);
        GridYear.Ca(:,:,iii) = nanmean(CC,3);
        DD = Middle_Var.Rn_s(:,:,ii:ii+11);
        GridYear.Rn_s(:,:,iii) = nanmean(DD,3);
        EE = Middle_Var.VPD(:,:,ii:ii+11);
        GridYear.VPD(:,:,iii) = nanmean(EE,3);
        clear A B C D E F AA BB CC DD EE FF
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year1
    for ii = 1:size(GridYear.s,3)
        A = GridYear.s(:,:,ii);Year1.s(ii) = nanmean(A(:));clear A;%Only Global Land
        A = GridYear.lamda(:,:,ii);Year1.lamda(ii) = nanmean(A(:));clear A;
        A = GridYear.gamma(:,:,ii);Year1.gamma(ii) = nanmean(A(:));clear A;
        A = GridYear.rs_H(:,:,ii);Year1.rs_H(ii) = nanmean(A(:));clear A;
        A = GridYear.rs_Yang(:,:,ii);Year1.rs_Yang(ii) = nanmean(A(:));clear A;
        A = GridYear.ra(:,:,ii);Year1.ra(ii) = nanmean(A(:));clear A;
        A = GridYear.ea(:,:,ii);Year1.ea(ii) = nanmean(A(:));clear A;
        A = GridYear.pa(:,:,ii);Year1.pa(ii) = nanmean(A(:));clear A;
        A = GridYear.Ca(:,:,ii);Year1.Ca(ii) = nanmean(A(:));clear A;
        A = GridYear.Rn_s(:,:,ii);Year1.Rn_s(ii) = nanmean(A(:));clear A;
        A = GridYear.VPD(:,:,ii);Year1.VPD(ii) = nanmean(A(:));clear A;
    end
    GridYear_Historical = GridYear;
    clear ii GridYear Middle_Var Met_Path
    %% 2015-2100 ssp585 Year Series
    Met_Path = 'D:\CMIP6\Program\Output_Attribution\Middle_Var_ssp585_';
    load(strcat(Met_Path,CLM,'.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1:12:size(Middle_Var.s,3)
        A = Middle_Var.s(:,:,ii:ii+11);
        GridYear.s(:,:,iii) = nanmean(A,3);
        B = Middle_Var.lamda(:,:,ii:ii+11);
        GridYear.lamda(:,:,iii) = nanmean(B,3);
        C = Middle_Var.gamma(:,:,ii:ii+11);
        GridYear.gamma(:,:,iii) = nanmean(C,3);
        D = Middle_Var.rs_H(:,:,ii:ii+11);
        GridYear.rs_H(:,:,iii) = nanmean(D,3);
        E = Middle_Var.rs_Yang(:,:,ii:ii+11);
        GridYear.rs_Yang(:,:,iii) = nanmean(E,3);
        F = Middle_Var.ra(:,:,ii:ii+11);
        GridYear.ra(:,:,iii) = nanmean(F,3);
        AA = Middle_Var.ea(:,:,ii:ii+11);
        GridYear.ea(:,:,iii) = nanmean(AA,3);
        BB = Middle_Var.pa(:,:,ii:ii+11);
        GridYear.pa(:,:,iii) = nanmean(BB,3);
        CC = Middle_Var.Ca(:,:,ii:ii+11);
        GridYear.Ca(:,:,iii) = nanmean(CC,3);
        DD = Middle_Var.Rn_s(:,:,ii:ii+11);
        GridYear.Rn_s(:,:,iii) = nanmean(DD,3);
        EE = Middle_Var.VPD(:,:,ii:ii+11);
        GridYear.VPD(:,:,iii) = nanmean(EE,3);
        clear A B C D E F AA BB CC DD EE FF
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year2
    for ii = 1:size(GridYear.s,3)
        A = GridYear.s(:,:,ii);Year2.s(ii) = nanmean(A(:));clear A;%Only Global Land
        A = GridYear.lamda(:,:,ii);Year2.lamda(ii) = nanmean(A(:));clear A;
        A = GridYear.gamma(:,:,ii);Year2.gamma(ii) = nanmean(A(:));clear A;
        A = GridYear.rs_H(:,:,ii);Year2.rs_H(ii) = nanmean(A(:));clear A;
        A = GridYear.rs_Yang(:,:,ii);Year2.rs_Yang(ii) = nanmean(A(:));clear A;
        A = GridYear.ra(:,:,ii);Year2.ra(ii) = nanmean(A(:));clear A;
        A = GridYear.ea(:,:,ii);Year2.ea(ii) = nanmean(A(:));clear A;
        A = GridYear.pa(:,:,ii);Year2.pa(ii) = nanmean(A(:));clear A;
        A = GridYear.Ca(:,:,ii);Year2.Ca(ii) = nanmean(A(:));clear A;
        A = GridYear.Rn_s(:,:,ii);Year2.Rn_s(ii) = nanmean(A(:));clear A;
        A = GridYear.VPD(:,:,ii);Year2.VPD(ii) = nanmean(A(:));clear A;
    end
    GridYear_Future = GridYear;
    clear ii GridYear Middle_Var Met_Path
    %% Output Middle_Var_Year from 1850-2100
    Middle_Var_Year.s(CLM_i,:)=[Year1.s,Year2.s];
    Middle_Var_Year.lamda(CLM_i,:)=[Year1.lamda,Year2.lamda];
    Middle_Var_Year.gamma(CLM_i,:)=[Year1.gamma,Year2.gamma];
    Middle_Var_Year.rs_H(CLM_i,:)=[Year1.rs_H,Year2.rs_H];
    Middle_Var_Year.rs_Yang(CLM_i,:)=[Year1.rs_Yang,Year2.rs_Yang];
    Middle_Var_Year.ra(CLM_i,:)=[Year1.ra,Year2.ra];
    Middle_Var_Year.ea(CLM_i,:)=[Year1.ea,Year2.ea];
    Middle_Var_Year.pa(CLM_i,:)=[Year1.pa,Year2.pa];
    Middle_Var_Year.Ca(CLM_i,:)=[Year1.Ca,Year2.Ca];
    Middle_Var_Year.Rn_s(CLM_i,:)=[Year1.Rn_s,Year2.Rn_s];
    Middle_Var_Year.VPD(CLM_i,:)=[Year1.VPD,Year2.VPD];
    clear Year1 Year2
    %% Output GridYear from 1850-2100
    Middle_Var_GridYear.s = cat(3,GridYear_Historical.s,GridYear_Future.s);
    Middle_Var_GridYear.lamda = cat(3,GridYear_Historical.lamda,GridYear_Future.lamda);
    Middle_Var_GridYear.gamma = cat(3,GridYear_Historical.gamma,GridYear_Future.gamma);
    Middle_Var_GridYear.rs_H = cat(3,GridYear_Historical.rs_H,GridYear_Future.rs_H);
    Middle_Var_GridYear.rs_Yang = cat(3,GridYear_Historical.rs_Yang,GridYear_Future.rs_Yang);
    Middle_Var_GridYear.ra = cat(3,GridYear_Historical.ra,GridYear_Future.ra);
    Middle_Var_GridYear.ea = cat(3,GridYear_Historical.ea,GridYear_Future.ea);
    Middle_Var_GridYear.pa = cat(3,GridYear_Historical.pa,GridYear_Future.pa);
    Middle_Var_GridYear.Ca = cat(3,GridYear_Historical.Ca,GridYear_Future.Ca);
    Middle_Var_GridYear.Rn_s = cat(3,GridYear_Historical.Rn_s,GridYear_Future.Rn_s);
    Middle_Var_GridYear.VPD = cat(3,GridYear_Historical.VPD,GridYear_Future.VPD);
    clear GridYear_Historical GridYear_Future
    save(['Middle_Var_GridYear_' CLM],'Middle_Var_GridYear')
    clear Middle_Var_GridYear CLM
end
clear AllCLM CLM CLM_i Mask_Path
save('Middle_Var_Year','Middle_Var_Year');

%% (2) Plotting
clc;clear all;close all;
load Middle_Var_Year
load('D:\CMIP6\Program\Fig1_ProcessData\ETrc_Year.mat')
load('D:\CMIP6\Program\Fig1_ProcessData\Met_Year.mat')
Fig3a_Plotting( ETrc_Year , Met_Year)
Fig3b_Plotting( ETrc_Year , Met_Year , Middle_Var_Year)