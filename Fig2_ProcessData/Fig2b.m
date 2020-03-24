clc;clear all;
% Name of 13 CLMs
AllCLM = {'BCC-CSM2-MR_r1';'CanESM5_r1_r6';'CESM2_r1';'CESM2-WACCM_r1';...
    'CNRM-CM6-1_r1';'FGOALS-g3_r1';'GFDL-ESM4_r1';'IPSL-CM6A-LR_r1';...
    'MIROC6_r1';'MIROC-ES2L_r1';'MRI-ESM2-0_r1';'UKESM1-0-LL_r1';'CNRM-ESM2-1_r2'};
%% (1) Data Prep
for CLM_i = 1:13
    load(['D:\CMIP6\Program\Fig1_ProcessData\ETrc_GridYear_',AllCLM{CLM_i},'.mat'])
    load(['D:\CMIP6\Program\Fig1_ProcessData\pr_GridYear_',AllCLM{CLM_i},'.mat'])
    
    PM_RC_1948_2014(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC(:,:,99:165),3);
    PM_RC_CO2_Yang_1948_2014(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Yang(:,:,99:165),3);
    PM_RC_CO2_Jarvis_H_1948_2014(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,99:165),3);
    pr_1948_2014(:,:,CLM_i) = mean(pr_GridYear(:,:,99:165),3);
    
    PM_RC_1990_2019(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC(:,:,141:170),3);
    PM_RC_CO2_Yang_1990_2019(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Yang(:,:,141:170),3);
    PM_RC_CO2_Jarvis_H_1990_2019(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,141:170),3);
    pr_1990_2019(:,:,CLM_i) = mean(pr_GridYear(:,:,141:170),3);
    
    PM_RC_2070_2099(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC(:,:,221:250),3);
    PM_RC_CO2_Yang_2070_2099(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Yang(:,:,221:250),3);
    PM_RC_CO2_Jarvis_H_2070_2099(:,:,CLM_i) = mean(ETrc_GridYear.PM_RC_CO2_Jarvis_H(:,:,221:250),3);
    pr_2070_2099(:,:,CLM_i) = mean(pr_GridYear(:,:,221:250),3);
    
    clear ETrc_GridYear pr_GridYear
end
load(['D:\CMIP6\Program\Fig1_ProcessData\ETrc_GridYear_Princeton.mat'])%1948-2014
load(['D:\CMIP6\Program\Fig1_ProcessData\pr_GridYear_Princeton.mat'])%1948-2014
PM_RC_Princeton = mean(ETrc_GridYear.PM_RC,3);
PM_RC_CO2_Yang_Princeton = mean(ETrc_GridYear.PM_RC_CO2_Yang,3);
PM_RC_CO2_Jarvis_H_Princeton = mean(ETrc_GridYear.PM_RC_CO2_Jarvis_H,3);
pr_Princeton = mean(pr_GridYear,3);
%% (2) Output tiff
while 1==1
    % Adjust map range to -180 --- 180
    for ii = 1:size(PM_RC_1948_2014,3)
        A = PM_RC_1948_2014(1:360,:,ii);B = PM_RC_1948_2014(361:end,:,ii);
        PM_RC_1948_2014(:,:,ii) = [B;A];
        A = PM_RC_1990_2019(1:360,:,ii);B = PM_RC_1990_2019(361:end,:,ii);
        PM_RC_1990_2019(:,:,ii) = [B;A];
        A = PM_RC_2070_2099(1:360,:,ii);B = PM_RC_2070_2099(361:end,:,ii);
        PM_RC_2070_2099(:,:,ii) = [B;A];
        A = PM_RC_CO2_Jarvis_H_1948_2014(1:360,:,ii);B = PM_RC_CO2_Jarvis_H_1948_2014(361:end,:,ii);
        PM_RC_CO2_Jarvis_H_1948_2014(:,:,ii) = [B;A];
        A = PM_RC_CO2_Jarvis_H_1990_2019(1:360,:,ii);B = PM_RC_CO2_Jarvis_H_1990_2019(361:end,:,ii);
        PM_RC_CO2_Jarvis_H_1990_2019(:,:,ii) = [B;A];
        A = PM_RC_CO2_Jarvis_H_2070_2099(1:360,:,ii);B = PM_RC_CO2_Jarvis_H_2070_2099(361:end,:,ii);
        PM_RC_CO2_Jarvis_H_2070_2099(:,:,ii) = [B;A];
        A = PM_RC_CO2_Yang_1948_2014(1:360,:,ii);B = PM_RC_CO2_Yang_1948_2014(361:end,:,ii);
        PM_RC_CO2_Yang_1948_2014(:,:,ii) = [B;A];
        A = PM_RC_CO2_Yang_1990_2019(1:360,:,ii);B = PM_RC_CO2_Yang_1990_2019(361:end,:,ii);
        PM_RC_CO2_Yang_1990_2019(:,:,ii) = [B;A];
        A = PM_RC_CO2_Yang_2070_2099(1:360,:,ii);B = PM_RC_CO2_Yang_2070_2099(361:end,:,ii);
        PM_RC_CO2_Yang_2070_2099(:,:,ii) = [B;A];
        A = pr_1948_2014(1:360,:,ii);B = pr_1948_2014(361:end,:,ii);
        pr_1948_2014(:,:,ii) = [B;A];
        A = pr_1990_2019(1:360,:,ii);B = pr_1990_2019(361:end,:,ii);
        pr_1990_2019(:,:,ii) = [B;A];
        A = pr_2070_2099(1:360,:,ii);B = pr_2070_2099(361:end,:,ii);
        pr_2070_2099(:,:,ii) = [B;A];
    end
    A = PM_RC_CO2_Jarvis_H_Princeton(1:360,:);B = PM_RC_CO2_Jarvis_H_Princeton(361:end,:);
    PM_RC_CO2_Jarvis_H_Princeton = [B;A];
    A = PM_RC_CO2_Yang_Princeton(1:360,:);B = PM_RC_CO2_Yang_Princeton(361:end,:);
    PM_RC_CO2_Yang_Princeton = [B;A];
    A = PM_RC_Princeton(1:360,:);B = PM_RC_Princeton(361:end,:);
    PM_RC_Princeton = [B;A];
    A = pr_Princeton(1:360,:);B = pr_Princeton(361:end,:);
    pr_Princeton = [B;A];
    extent=[-179.75,179.75,-59.75+0.195,89.75+0.195];
    % extent=[-359.75,0.25,-59.75+0.195,89.75+0.195];
    %% (2.1) AI for 1990_2019
    % (2.1.1) PM_RC
    AI_PM_RC_1990_2019 = (nanmean(pr_1990_2019,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_1990_2019,3);
    AI_PM_RC_1990_2019(360,:) = AI_PM_RC_1990_2019(359,:); % fill nan value
    Humid = AI_PM_RC_1990_2019 >= 0.65;
    Hyper_arid = AI_PM_RC_1990_2019 < 0.05;
    Arid = AI_PM_RC_1990_2019 < 0.2 & AI_PM_RC_1990_2019 >= 0.05;
    Semi_arid = AI_PM_RC_1990_2019 < 0.5 & AI_PM_RC_1990_2019 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_1990_2019 < 0.65 & AI_PM_RC_1990_2019 >= 0.5;
    Cold = [nanmean(PM_RC_1990_2019(:,1:250,:),3)<450,nanmean(PM_RC_1990_2019(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_1990_2019(Humid) = 1;AI_PM_RC_1990_2019(Hyper_arid) = 5;
    AI_PM_RC_1990_2019(Arid) = 4;AI_PM_RC_1990_2019(Semi_arid) = 3;
    AI_PM_RC_1990_2019(Dry_Sub_humid) = 2;AI_PM_RC_1990_2019(Cold) = 6;
    AI_PM_RC_1990_2019(isnan(AI_PM_RC_1990_2019))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_1990_2019',extent,AI_PM_RC_1990_2019');
    % (2.1.2) PM_RC_CO2_Yang
    AI_PM_RC_CO2_Yang_1990_2019 = (nanmean(pr_1990_2019,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_CO2_Yang_1990_2019,3);
    AI_PM_RC_CO2_Yang_1990_2019(360,:) = AI_PM_RC_CO2_Yang_1990_2019(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Yang_1990_2019 >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Yang_1990_2019 < 0.05;
    Arid = AI_PM_RC_CO2_Yang_1990_2019 < 0.2 & AI_PM_RC_CO2_Yang_1990_2019 >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Yang_1990_2019 < 0.5 & AI_PM_RC_CO2_Yang_1990_2019 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Yang_1990_2019 < 0.65 & AI_PM_RC_CO2_Yang_1990_2019 >= 0.5;
    Cold = [nanmean(PM_RC_CO2_Yang_1990_2019(:,1:250,:),3)<450,nanmean(PM_RC_CO2_Yang_1990_2019(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Yang_1990_2019(Humid) = 1;AI_PM_RC_CO2_Yang_1990_2019(Hyper_arid) = 5;
    AI_PM_RC_CO2_Yang_1990_2019(Arid) = 4;AI_PM_RC_CO2_Yang_1990_2019(Semi_arid) = 3;
    AI_PM_RC_CO2_Yang_1990_2019(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Yang_1990_2019(Cold) = 6;
    AI_PM_RC_CO2_Yang_1990_2019(isnan(AI_PM_RC_CO2_Yang_1990_2019))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_CO2_Yang_1990_2019',extent,AI_PM_RC_CO2_Yang_1990_2019');
    % (2.1.3) PM_RC_CO2_Jarvis_H
    AI_PM_RC_CO2_Jarvis_H_1990_2019 = (nanmean(pr_1990_2019,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_CO2_Jarvis_H_1990_2019,3);
    AI_PM_RC_CO2_Jarvis_H_1990_2019(360,:) = AI_PM_RC_CO2_Jarvis_H_1990_2019(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Jarvis_H_1990_2019 >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Jarvis_H_1990_2019 < 0.05;
    Arid = AI_PM_RC_CO2_Jarvis_H_1990_2019 < 0.2 & AI_PM_RC_CO2_Jarvis_H_1990_2019 >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Jarvis_H_1990_2019 < 0.5 & AI_PM_RC_CO2_Jarvis_H_1990_2019 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Jarvis_H_1990_2019 < 0.65 & AI_PM_RC_CO2_Jarvis_H_1990_2019 >= 0.5;
    Cold = [nanmean(PM_RC_CO2_Jarvis_H_1990_2019(:,1:250,:),3)<450,nanmean(PM_RC_CO2_Jarvis_H_1990_2019(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Jarvis_H_1990_2019(Humid) = 1;AI_PM_RC_CO2_Jarvis_H_1990_2019(Hyper_arid) = 5;
    AI_PM_RC_CO2_Jarvis_H_1990_2019(Arid) = 4;AI_PM_RC_CO2_Jarvis_H_1990_2019(Semi_arid) = 3;
    AI_PM_RC_CO2_Jarvis_H_1990_2019(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Jarvis_H_1990_2019(Cold) = 6;
    AI_PM_RC_CO2_Jarvis_H_1990_2019(isnan(AI_PM_RC_CO2_Jarvis_H_1990_2019))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_CO2_Jarvis_H_1990_2019',extent,AI_PM_RC_CO2_Jarvis_H_1990_2019');
    
    %% (2.2) AI for 2070_2099
    % (2.2.1) PM_RC
    AI_PM_RC_2070_2099 = (nanmean(pr_2070_2099,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_2070_2099,3);
    AI_PM_RC_2070_2099(360,:) = AI_PM_RC_2070_2099(359,:); % fill nan value
    Humid = AI_PM_RC_2070_2099 >= 0.65;
    Hyper_arid = AI_PM_RC_2070_2099 < 0.05;
    Arid = AI_PM_RC_2070_2099 < 0.2 & AI_PM_RC_2070_2099 >= 0.05;
    Semi_arid = AI_PM_RC_2070_2099 < 0.5 & AI_PM_RC_2070_2099 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_2070_2099 < 0.65 & AI_PM_RC_2070_2099 >= 0.5;
    Cold = [nanmean(PM_RC_2070_2099(:,1:250,:),3)<450,nanmean(PM_RC_2070_2099(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_2070_2099(Humid) = 1;AI_PM_RC_2070_2099(Hyper_arid) = 5;
    AI_PM_RC_2070_2099(Arid) = 4;AI_PM_RC_2070_2099(Semi_arid) = 3;
    AI_PM_RC_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_2070_2099(Cold) = 6;
    AI_PM_RC_2070_2099(isnan(AI_PM_RC_2070_2099))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_2070_2099',extent,AI_PM_RC_2070_2099');
    % (2.2.2) PM_RC_CO2_Yang
    AI_PM_RC_CO2_Yang_2070_2099 = (nanmean(pr_2070_2099,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_CO2_Yang_2070_2099,3);
    AI_PM_RC_CO2_Yang_2070_2099(360,:) = AI_PM_RC_CO2_Yang_2070_2099(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Yang_2070_2099 >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.05;
    Arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.2 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.5 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Yang_2070_2099 < 0.65 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.5;
    Cold = [nanmean(PM_RC_CO2_Yang_2070_2099(:,1:250,:),3)<450,nanmean(PM_RC_CO2_Yang_2070_2099(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Yang_2070_2099(Humid) = 1;AI_PM_RC_CO2_Yang_2070_2099(Hyper_arid) = 5;
    AI_PM_RC_CO2_Yang_2070_2099(Arid) = 4;AI_PM_RC_CO2_Yang_2070_2099(Semi_arid) = 3;
    AI_PM_RC_CO2_Yang_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Yang_2070_2099(Cold) = 6;
    AI_PM_RC_CO2_Yang_2070_2099(isnan(AI_PM_RC_CO2_Yang_2070_2099))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_CO2_Yang_2070_2099',extent,AI_PM_RC_CO2_Yang_2070_2099');
    % (2.2.3) PM_RC_CO2_Jarvis_H
    AI_PM_RC_CO2_Jarvis_H_2070_2099 = (nanmean(pr_2070_2099,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_CO2_Jarvis_H_2070_2099,3);
    AI_PM_RC_CO2_Jarvis_H_2070_2099(360,:) = AI_PM_RC_CO2_Jarvis_H_2070_2099(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.05;
    Arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.2 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.5 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.65 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.5;
    Cold = [nanmean(PM_RC_CO2_Jarvis_H_2070_2099(:,1:250,:),3)<400,nanmean(PM_RC_CO2_Jarvis_H_2070_2099(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(Humid) = 1;AI_PM_RC_CO2_Jarvis_H_2070_2099(Hyper_arid) = 5;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(Arid) = 4;AI_PM_RC_CO2_Jarvis_H_2070_2099(Semi_arid) = 3;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Jarvis_H_2070_2099(Cold) = 6;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(isnan(AI_PM_RC_CO2_Jarvis_H_2070_2099))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_CO2_Jarvis_H_2070_2099',extent,AI_PM_RC_CO2_Jarvis_H_2070_2099');
    
    %% (2.3) AI for 1948_2014
    % (2.3.1) PM_RC
    AI_PM_RC_1948_2014 = (nanmean(pr_1948_2014,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_1948_2014,3);
    AI_PM_RC_1948_2014(360,:) = AI_PM_RC_1948_2014(359,:); % fill nan value
    Humid = AI_PM_RC_1948_2014 >= 0.65;
    Hyper_arid = AI_PM_RC_1948_2014 < 0.05;
    Arid = AI_PM_RC_1948_2014 < 0.2 & AI_PM_RC_1948_2014 >= 0.05;
    Semi_arid = AI_PM_RC_1948_2014 < 0.5 & AI_PM_RC_1948_2014 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_1948_2014 < 0.65 & AI_PM_RC_1948_2014 >= 0.5;
    Cold = [nanmean(PM_RC_1948_2014(:,1:250,:),3)<450,nanmean(PM_RC_1948_2014(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_1948_2014(Humid) = 1;AI_PM_RC_1948_2014(Hyper_arid) = 5;
    AI_PM_RC_1948_2014(Arid) = 4;AI_PM_RC_1948_2014(Semi_arid) = 3;
    AI_PM_RC_1948_2014(Dry_Sub_humid) = 2;AI_PM_RC_1948_2014(Cold) = 6;
    AI_PM_RC_1948_2014(isnan(AI_PM_RC_1948_2014))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_1948_2014',extent,AI_PM_RC_1948_2014');
    % (2.3.2) PM_RC_CO2_Yang
    AI_PM_RC_CO2_Yang_1948_2014 = (nanmean(pr_1948_2014,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_CO2_Yang_1948_2014,3);
    AI_PM_RC_CO2_Yang_1948_2014(360,:) = AI_PM_RC_CO2_Yang_1948_2014(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Yang_1948_2014 >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Yang_1948_2014 < 0.05;
    Arid = AI_PM_RC_CO2_Yang_1948_2014 < 0.2 & AI_PM_RC_CO2_Yang_1948_2014 >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Yang_1948_2014 < 0.5 & AI_PM_RC_CO2_Yang_1948_2014 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Yang_1948_2014 < 0.65 & AI_PM_RC_CO2_Yang_1948_2014 >= 0.5;
    Cold = [nanmean(PM_RC_CO2_Yang_1948_2014(:,1:250,:),3)<450,nanmean(PM_RC_CO2_Yang_1948_2014(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Yang_1948_2014(Humid) = 1;AI_PM_RC_CO2_Yang_1948_2014(Hyper_arid) = 5;
    AI_PM_RC_CO2_Yang_1948_2014(Arid) = 4;AI_PM_RC_CO2_Yang_1948_2014(Semi_arid) = 3;
    AI_PM_RC_CO2_Yang_1948_2014(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Yang_1948_2014(Cold) = 6;
    AI_PM_RC_CO2_Yang_1948_2014(isnan(AI_PM_RC_CO2_Yang_1948_2014))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_CO2_Yang_1948_2014',extent,AI_PM_RC_CO2_Yang_1948_2014');
    % (2.3.3) PM_RC_CO2_Jarvis_H
    AI_PM_RC_CO2_Jarvis_H_1948_2014 = (nanmean(pr_1948_2014,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_CO2_Jarvis_H_1948_2014,3);
    AI_PM_RC_CO2_Jarvis_H_1948_2014(360,:) = AI_PM_RC_CO2_Jarvis_H_1948_2014(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Jarvis_H_1948_2014 >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Jarvis_H_1948_2014 < 0.05;
    Arid = AI_PM_RC_CO2_Jarvis_H_1948_2014 < 0.2 & AI_PM_RC_CO2_Jarvis_H_1948_2014 >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Jarvis_H_1948_2014 < 0.5 & AI_PM_RC_CO2_Jarvis_H_1948_2014 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Jarvis_H_1948_2014 < 0.65 & AI_PM_RC_CO2_Jarvis_H_1948_2014 >= 0.5;
    Cold = [nanmean(PM_RC_CO2_Jarvis_H_1948_2014(:,1:250,:),3)<450,nanmean(PM_RC_CO2_Jarvis_H_1948_2014(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Jarvis_H_1948_2014(Humid) = 1;AI_PM_RC_CO2_Jarvis_H_1948_2014(Hyper_arid) = 5;
    AI_PM_RC_CO2_Jarvis_H_1948_2014(Arid) = 4;AI_PM_RC_CO2_Jarvis_H_1948_2014(Semi_arid) = 3;
    AI_PM_RC_CO2_Jarvis_H_1948_2014(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Jarvis_H_1948_2014(Cold) = 6;
    AI_PM_RC_CO2_Jarvis_H_1948_2014(isnan(AI_PM_RC_CO2_Jarvis_H_1948_2014))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_CO2_Jarvis_H_1948_2014',extent,AI_PM_RC_CO2_Jarvis_H_1948_2014');
    
    %% (2.4) AI for Princeton
    % (2.4.1) PM_RC
    AI_PM_RC_Princeton = (nanmean(pr_Princeton,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_Princeton,3);
    AI_PM_RC_Princeton(360,:) = AI_PM_RC_Princeton(359,:); % fill nan value
    Humid = AI_PM_RC_Princeton >= 0.65;
    Hyper_arid = AI_PM_RC_Princeton < 0.05;
    Arid = AI_PM_RC_Princeton < 0.2 & AI_PM_RC_Princeton >= 0.05;
    Semi_arid = AI_PM_RC_Princeton < 0.5 & AI_PM_RC_Princeton >= 0.2;
    Dry_Sub_humid = AI_PM_RC_Princeton < 0.65 & AI_PM_RC_Princeton >= 0.5;
    Cold = [nanmean(PM_RC_Princeton(:,1:250,:),3)<450,nanmean(PM_RC_Princeton(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_Princeton(Humid) = 1;AI_PM_RC_Princeton(Hyper_arid) = 5;
    AI_PM_RC_Princeton(Arid) = 4;AI_PM_RC_Princeton(Semi_arid) = 3;
    AI_PM_RC_Princeton(Dry_Sub_humid) = 2;AI_PM_RC_Princeton(Cold) = 6;
    AI_PM_RC_Princeton(isnan(AI_PM_RC_Princeton))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_Princeton',extent,AI_PM_RC_Princeton');
    % (2.4.2) PM_RC_CO2_Yang
    AI_PM_RC_CO2_Yang_Princeton = (nanmean(pr_Princeton,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_CO2_Yang_Princeton,3);
    AI_PM_RC_CO2_Yang_Princeton(360,:) = AI_PM_RC_CO2_Yang_Princeton(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Yang_Princeton >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Yang_Princeton < 0.05;
    Arid = AI_PM_RC_CO2_Yang_Princeton < 0.2 & AI_PM_RC_CO2_Yang_Princeton >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Yang_Princeton < 0.5 & AI_PM_RC_CO2_Yang_Princeton >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Yang_Princeton < 0.65 & AI_PM_RC_CO2_Yang_Princeton >= 0.5;
    Cold = [nanmean(PM_RC_CO2_Yang_Princeton(:,1:250,:),3)<450,nanmean(PM_RC_CO2_Yang_Princeton(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Yang_Princeton(Humid) = 1;AI_PM_RC_CO2_Yang_Princeton(Hyper_arid) = 5;
    AI_PM_RC_CO2_Yang_Princeton(Arid) = 4;AI_PM_RC_CO2_Yang_Princeton(Semi_arid) = 3;
    AI_PM_RC_CO2_Yang_Princeton(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Yang_Princeton(Cold) = 6;
    AI_PM_RC_CO2_Yang_Princeton(isnan(AI_PM_RC_CO2_Yang_Princeton))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_CO2_Yang_Princeton',extent,AI_PM_RC_CO2_Yang_Princeton');
    % (2.4.3) PM_RC_CO2_Jarvis_H
    AI_PM_RC_CO2_Jarvis_H_Princeton = (nanmean(pr_Princeton,3).*1000.*31536000./997)...
        ./nanmean(PM_RC_CO2_Jarvis_H_Princeton,3);
    AI_PM_RC_CO2_Jarvis_H_Princeton(360,:) = AI_PM_RC_CO2_Jarvis_H_Princeton(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Jarvis_H_Princeton >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Jarvis_H_Princeton < 0.05;
    Arid = AI_PM_RC_CO2_Jarvis_H_Princeton < 0.2 & AI_PM_RC_CO2_Jarvis_H_Princeton >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Jarvis_H_Princeton < 0.5 & AI_PM_RC_CO2_Jarvis_H_Princeton >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Jarvis_H_Princeton < 0.65 & AI_PM_RC_CO2_Jarvis_H_Princeton >= 0.5;
    Cold = [nanmean(PM_RC_CO2_Jarvis_H_Princeton(:,1:250,:),3)<450,nanmean(PM_RC_CO2_Jarvis_H_Princeton(:,251:end,:),3)<400];
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Jarvis_H_Princeton(Humid) = 1;AI_PM_RC_CO2_Jarvis_H_Princeton(Hyper_arid) = 5;
    AI_PM_RC_CO2_Jarvis_H_Princeton(Arid) = 4;AI_PM_RC_CO2_Jarvis_H_Princeton(Semi_arid) = 3;
    AI_PM_RC_CO2_Jarvis_H_Princeton(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Jarvis_H_Princeton(Cold) = 6;
    AI_PM_RC_CO2_Jarvis_H_Princeton(isnan(AI_PM_RC_CO2_Jarvis_H_Princeton))=-9999;
    SaveData2GeoTIFF('AI_PM_RC_CO2_Jarvis_H_Princeton',extent,AI_PM_RC_CO2_Jarvis_H_Princeton');
end
%% (3) Calculate Matrix and Write them down
while 1==1
    load EarthLandArea_05deg
    AI_PM_RC_2070_2099(AI_PM_RC_2070_2099==-9999)=nan;
    AI_PM_RC_CO2_Yang_2070_2099(AI_PM_RC_CO2_Yang_2070_2099==-9999)=nan;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(AI_PM_RC_CO2_Jarvis_H_2070_2099==-9999)=nan;
    
    AI_PM_RC_Princeton(AI_PM_RC_Princeton==-9999)=nan;
    AI_PM_RC_CO2_Yang_Princeton(AI_PM_RC_CO2_Yang_Princeton==-9999)=nan;
    AI_PM_RC_CO2_Jarvis_H_Princeton(AI_PM_RC_CO2_Jarvis_H_Princeton==-9999)=nan;
    
    AI_PM_RC_Change = AI_PM_RC_Princeton.*10 + AI_PM_RC_2070_2099;
    AI_PM_RC_CO2_Yang_Change = AI_PM_RC_CO2_Yang_Princeton.*10 + AI_PM_RC_CO2_Yang_2070_2099;
    AI_PM_RC_CO2_Jarvis_H_Change = AI_PM_RC_CO2_Jarvis_H_Princeton.*10 + AI_PM_RC_CO2_Jarvis_H_2070_2099;
    
    %% PM_RC_Jarvis_H
    % 1948-2014 Humid converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==11)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==12)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==13)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==14)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==15)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==16)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==1)) .*100]
    % 1948-2014 subhumid converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==21)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==22)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==23)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==24)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==25)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==26)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==2)) .*100]
    % 1948-2014 3 converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==31)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==32)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==33)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==34)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==35)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==36)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==3)) .*100]
    % 1948-2014 4 converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==41)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==42)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==43)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==44)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==45)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==46)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==4)) .*100]
    % 1948-2014 hyper-aird converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==51)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==52)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==53)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==54)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==55)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==56)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==5)) .*100]
    % 1948-2014 Cold converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==61)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==62)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==63)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==64)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==65)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==66)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Princeton==6)) .*100]
    
    
    %% PM_RC_Yang
    % 1948-2014 Humid converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==11)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==12)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==13)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==14)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==15)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==16)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==1)) .*100]
    % 1948-2014 subhumid converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==21)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==22)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==23)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==24)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==25)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==26)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==2)) .*100]
    % 1948-2014 3 converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==31)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==32)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==33)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==34)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==35)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==36)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==3)) .*100]
    % 1948-2014 4 converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==41)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==42)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==43)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==44)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==45)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==46)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==4)) .*100]
    % 1948-2014 hyper-aird converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==51)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==52)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==53)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==54)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==55)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==56)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==5)) .*100]
    % 1948-2014 Cold converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==61)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==62)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==63)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==64)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==65)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Change==66)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Yang_Princeton==6)) .*100]
    
    %% PM_RC
    % 1948-2014 Humid converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_Change==11)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==12)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==13)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==14)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==15)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==1)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==16)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==1)) .*100]
    % 1948-2014 subhumid converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_Change==21)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==22)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==23)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==24)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==25)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==2)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==26)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==2)) .*100]
    % 1948-2014 3 converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_Change==31)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==32)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==33)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==34)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==35)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==3)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==36)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==3)) .*100]
    % 1948-2014 4 converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_Change==41)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==42)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==43)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==44)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==45)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==4)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==46)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==4)) .*100]
    % 1948-2014 hyper-aird converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_Change==51)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==52)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==53)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==54)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==55)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==5)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==56)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==5)) .*100]
    % 1948-2014 Cold converted to What
    [nansum(EarthLandArea_05deg(AI_PM_RC_Change==61)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==62)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==63)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==64)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==65)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==6)) .*100,...
        nansum(EarthLandArea_05deg(AI_PM_RC_Change==66)) ./ nansum(EarthLandArea_05deg(AI_PM_RC_Princeton==6)) .*100]
end
%% (4) Calculate Permafrost Melting
% Jarvis
% permafrost: 5-Continuous,4-sporadic,3-discontinuous,2-isolated.
load Permafrost
Permafrost = fliplr(Permafrost');
% Cold to Humid
P51 = nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==61&Permafrost==5))./nansum(EarthLandArea_05deg(~isnan(Permafrost))).*100;
P41 = nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==61&Permafrost==4))./nansum(EarthLandArea_05deg(~isnan(Permafrost))).*100;
P31 = nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==61&Permafrost==3))./nansum(EarthLandArea_05deg(~isnan(Permafrost))).*100;
P21 = nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==61&Permafrost==2))./nansum(EarthLandArea_05deg(~isnan(Permafrost))).*100;
% Plot Pie Chart
CCC = gray(6);
colormap(CCC(2:5,:));
pie(double([P51,P31,P41,P21]))
set(gca,'LineWidth',2.5)
applyhatch(gcf,'+/\..',CCC(2:5,:));
% plot Permafrost change to Hunmid and Dry
figure
Cold_Humid = sum([P51,P31,P41,P21]);
Cold_Dry = sum([nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==62&~isnan(Permafrost)))./nansum(EarthLandArea_05deg(~isnan(Permafrost))).*100,...
    nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==63&~isnan(Permafrost)))./nansum(EarthLandArea_05deg(~isnan(Permafrost))).*100,...
    nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==64&~isnan(Permafrost)))./nansum(EarthLandArea_05deg(~isnan(Permafrost))).*100,...
    nansum(EarthLandArea_05deg(AI_PM_RC_CO2_Jarvis_H_Change==65&~isnan(Permafrost)))./nansum(EarthLandArea_05deg(~isnan(Permafrost))).*100]);

hBar = bar([1,2;4,5],[Cold_Humid,Cold_Dry;Cold_Humid,Cold_Dry]);
set(hBar(1),'FaceColor',[206,230,192]./255,'FaceAlpha',0.9,'EdgeColor','none')%Cold_Humid
set(hBar(2),'FaceColor',[251,191,164]./255,'FaceAlpha',0.9,'EdgeColor','none')%Cold_Dry

hold on;
errorbar([0.58,2.42],[Cold_Humid,Cold_Dry],[3.7,0.4],'k.','LineWidth',1.6)
ylabel('Change Ratio (%)')
set(gca,'xlim',[0,3],'ylim',[0,34],'FontName','Arial','FontSize',24,'LineWidth',2.5)













