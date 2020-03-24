clc;clear all;close all;
%% (1) GlobalLand = Land from 60S to 90N Year 1850-2100
% Name of 13 CLMs
AllCLM = {'BCC-CSM2-MR_r1';'CanESM5_r1_r6';'CESM2_r1';'CESM2-WACCM_r1';...
    'CNRM-CM6-1_r1';'FGOALS-g3_r1';'GFDL-ESM4_r1';'IPSL-CM6A-LR_r1';...
    'MIROC6_r1';'MIROC-ES2L_r1';'MRI-ESM2-0_r1';'UKESM1-0-LL_r1';'CNRM-ESM2-1_r2'};
for CLM_i = 1:13
    %% 1850-2014 Historical Year Series
    Middle_Path = 'D:\CMIP6\Program\Output_Attribution\Middle_Var_Historical_';
    CLM = AllCLM{CLM_i};
    load(strcat(Middle_Path,CLM,'.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1:12:size(Middle_Var.rs_H,3)
        A = Middle_Var.rs_H(:,:,ii:ii+11);
        GridYear.rs_H(:,:,iii) = nanmean(A,3);
        B = Middle_Var.rs_L(:,:,ii:ii+11);
        GridYear.rs_L(:,:,iii) = nanmean(B,3);
        C = Middle_Var.rs_Yang(:,:,ii:ii+11);
        GridYear.rs_Yang(:,:,iii) = nanmean(C,3);
        clear A B C
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year1
    for ii = 1:size(GridYear.rs_H,3)
        A = GridYear.rs_H(:,:,ii);Year1.rs_H(ii) = nanmean(A(:));GridYear.rs_H(:,:,ii)=A;clear A;%Only Global Land
        A = GridYear.rs_L(:,:,ii);Year1.rs_L(ii) = nanmean(A(:));GridYear.rs_L(:,:,ii)=A;clear A;
        A = GridYear.rs_Yang(:,:,ii);Year1.rs_Yang(ii) = nanmean(A(:));GridYear.rs_Yang(:,:,ii)=A;clear A;
    end
    GridYear_Historical = GridYear;
    clear ii GridYear Middle_Var Middle_Path
    %% 2015-2100 ssp585 Year Series
    Middle_Path = 'D:\CMIP6\Program\Output_Attribution\Middle_Var_ssp585_';
    load(strcat(Middle_Path,CLM,'.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1:12:size(Middle_Var.rs_H,3)
        A = Middle_Var.rs_H(:,:,ii:ii+11);
        GridYear.rs_H(:,:,iii) = nanmean(A,3);
        B = Middle_Var.rs_L(:,:,ii:ii+11);
        GridYear.rs_L(:,:,iii) = nanmean(B,3);
        C = Middle_Var.rs_Yang(:,:,ii:ii+11);
        GridYear.rs_Yang(:,:,iii) = nanmean(C,3);
        clear A B C
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year2
    for ii = 1:size(GridYear.rs_H,3)
        A = GridYear.rs_H(:,:,ii);Year2.rs_H(ii) = nanmean(A(:));GridYear.rs_H(:,:,ii) = A;clear A;%Only Global Land
        A = GridYear.rs_L(:,:,ii);Year2.rs_L(ii) = nanmean(A(:));GridYear.rs_L(:,:,ii) = A;clear A;
        A = GridYear.rs_Yang(:,:,ii);Year2.rs_Yang(ii) = nanmean(A(:));GridYear.rs_Yang(:,:,ii) = A;clear A;
    end
    GridYear_Future = GridYear;
    clear ii GridYear Middle_Var Middle_Path
    %% Output Middle_Year from 1850-2100
    Middle_Year.rs_H(CLM_i,:)=[Year1.rs_H,Year2.rs_H];
    Middle_Year.rs_L(CLM_i,:)=[Year1.rs_L,Year2.rs_L];
    Middle_Year.rs_Yang(CLM_i,:)=[Year1.rs_Yang,Year2.rs_Yang];
    clear Year1 Year2 sftlf
    %% Output GridYear from 1850-2100
    GridYear.rs_H = cat(3,GridYear_Historical.rs_H,GridYear_Future.rs_H);
    GridYear.rs_L = cat(3,GridYear_Historical.rs_L,GridYear_Future.rs_L);
    GridYear.rs_Yang = cat(3,GridYear_Historical.rs_Yang,GridYear_Future.rs_Yang);
    clear GridYear_Historical GridYear_Future
    save(['rs_GridYear_' CLM],'GridYear')
    clear GridYear CLM
end
clear AllCLM CLM CLM_i Mask_Path
save('Middle_Year','Middle_Year');
%% (2) Drawing
clc;clear all;
load Middle_Year
% Name of 13 CLMs
AllCLM = {'BCC-CSM2-MR_r1';'CanESM5_r1_r6';'CESM2_r1';'CESM2-WACCM_r1';...
    'CNRM-CM6-1_r1';'FGOALS-g3_r1';'GFDL-ESM4_r1';'IPSL-CM6A-LR_r1';...
    'MIROC6_r1';'MIROC-ES2L_r1';'MRI-ESM2-0_r1';'UKESM1-0-LL_r1';'CNRM-ESM2-1_r2'};
% Ensemble Analysis
for CLM_i = 1:13
    load(['rs_GridYear_',AllCLM{CLM_i},'.mat'])
    close all
    rs_H_1990_2019(:,:,CLM_i) = mean(GridYear.rs_H(:,:,141:170),3);
    rs_Yang_1990_2019(:,:,CLM_i) = mean(GridYear.rs_Yang(:,:,141:170),3);
    
    rs_H_1948_2014(:,:,CLM_i) = mean(GridYear.rs_H(:,:,99:165),3);
    rs_Yang_1948_2014(:,:,CLM_i) = mean(GridYear.rs_Yang(:,:,99:165),3);
    
    rs_H_2070_2099(:,:,CLM_i) = mean(GridYear.rs_H(:,:,221:250),3);
    rs_Yang_2070_2099(:,:,CLM_i) = mean(GridYear.rs_Yang(:,:,221:250),3);
    
    mesh((rs_H_2070_2099(:,:,CLM_i)-rs_H_1990_2019(:,:,CLM_i))./rs_H_1990_2019(:,:,CLM_i).*100);
    view(90,-90)
    colorbar
    clear GridYear
    %     pause(5)
end

% Relative Change of rs_Yang which is only related to CO2 therefore only
% one value
nanmean(nanmean((nanmean(rs_Yang_2070_2099,3) - nanmean(rs_Yang_1948_2014,3))./nanmean(rs_Yang_1948_2014,3).*100))

Fig1b_Plotting( Middle_Year , rs_H_1948_2014 , rs_H_2070_2099)
