clc; clear all; close all;
Path_ETrc_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Historical\ETrc_Historical_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_ETrc_Year.mat';
Path_ETrc_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_ETrc_Year.mat';
Path_ETrc_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_ETrc\Princeton\ETrc_Year_Princeton.mat';

Path_Met_Year_Historical_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Historical\Met_Var_Historical_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp126_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp245_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp370_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_Met_Year.mat';
Path_Met_Year_ScenarioMIP_ssp585_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_Met_Year.mat';
Path_Met_Year_Princeton_GCM = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Princeton\Met_Year_Princeton.mat';

Path_Fig2a_Output = 'Fig2a_Output\';

ETrc_Year = cat(2,load(Path_ETrc_Year_Historical_GCM),...
    load(Path_ETrc_Year_ScenarioMIP_ssp126_GCM),load(Path_ETrc_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_ETrc_Year_ScenarioMIP_ssp370_GCM),load(Path_ETrc_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_ETrc_Year_Princeton_GCM));
Met_Year = cat(2,load(Path_Met_Year_Historical_GCM),...
    load(Path_Met_Year_ScenarioMIP_ssp126_GCM),load(Path_Met_Year_ScenarioMIP_ssp245_GCM),...
    load(Path_Met_Year_ScenarioMIP_ssp370_GCM),load(Path_Met_Year_ScenarioMIP_ssp585_GCM),...
    load(Path_Met_Year_Princeton_GCM));

%% ET
subplot(1,2,1)
plot( mean(ETrc_Year(1).ETrc_Year.PM_RC.* 365), mean(ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365) ,...
    '.' , 'MarkerSize' , 16 , 'Color' , [167 , 167 , 167]./255); hold on;
plot(mean(ETrc_Year(1).ETrc_Year.PM_RC.* 365) , mean(ETrc_Year(1).ETrc_Year.PM_RC_CO2_Yang .* 365) ,...
    '.' , 'MarkerSize' , 16 , 'Color' , [138 , 138 , 138]./255);

plot( mean(ETrc_Year(2).ETrc_Year.PM_RC.* 365), mean(ETrc_Year(2).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365) ,...
    '.' , 'MarkerSize' , 16 , 'Color' , [146 , 197 , 222]./255);
plot(mean(ETrc_Year(2).ETrc_Year.PM_RC.* 365) , mean(ETrc_Year(2).ETrc_Year.PM_RC_CO2_Yang .* 365) ,...
    '.' , 'MarkerSize' , 16 , 'Color' , [254 , 224 , 139]./255);

plot( mean(ETrc_Year(3).ETrc_Year.PM_RC.* 365), mean(ETrc_Year(3).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365) ,...
    '.' , 'MarkerSize' , 16 ,  'Color' , [67 , 147 , 195]./255);
plot(mean(ETrc_Year(3).ETrc_Year.PM_RC.* 365) , mean(ETrc_Year(3).ETrc_Year.PM_RC_CO2_Yang .* 365) ,...
    '.' , 'MarkerSize' , 16 ,  'Color' , [250 , 190 , 56]./255);

plot( mean(ETrc_Year(4).ETrc_Year.PM_RC.* 365), mean(ETrc_Year(4).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365) ,...
    '.' , 'MarkerSize' , 16 , 'Color' , [99 , 141 , 201]./255);
plot(mean(ETrc_Year(4).ETrc_Year.PM_RC.* 365) , mean(ETrc_Year(4).ETrc_Year.PM_RC_CO2_Yang .* 365) ,...
    '.' , 'MarkerSize' , 16 , 'Color' , [249 , 161 , 89]./255);

plot( mean(ETrc_Year(5).ETrc_Year.PM_RC.* 365), mean(ETrc_Year(5).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365) ,...
    '.' , 'MarkerSize' , 16 , 'Color' , [34 , 86 , 166]./255);
plot(mean(ETrc_Year(5).ETrc_Year.PM_RC.* 365) , mean(ETrc_Year(5).ETrc_Year.PM_RC_CO2_Yang .* 365) ,...
    '.' , 'MarkerSize' , 16 , 'Color' , [244 , 109 , 67]./255);
axis equal;
plot([850,1100] , [850,1100] , 'k' , 'LineWidth' , 2.5);
xlim([850,1100]); ylim([850,1100]);
xlabel('PET-FAO'); ylabel('PET-Yang&Jarvis');
set(gca ,'yTick' ,[850:50:1100] , 'FontSize' , 24 , 'FontName' , 'Arial' , 'TickDir' , 'out' , 'LineWidth' , 2.5);

%% AI
subplot(1,2,2)
plot(mean(Met_Year(1).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(1).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(1).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365),...
    '.' , 'MarkerSize' , 16 , 'Color' , [167 , 167 , 167]./255); hold on;
plot(mean(Met_Year(1).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(1).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(1).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(1).ETrc_Year.PM_RC_CO2_Yang .* 365),...
    '.' , 'MarkerSize' , 16 , 'Color' , [138 , 138 , 138]./255);

plot(mean(Met_Year(2).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(2).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(2).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(2).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365),...
    '.' , 'MarkerSize' , 16 , 'Color' , [146 , 197 , 222]./255);
plot(mean(Met_Year(2).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(2).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(2).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(2).ETrc_Year.PM_RC_CO2_Yang .* 365),...
    '.' , 'MarkerSize' , 16 , 'Color' , [254 , 224 , 139]./255);

plot(mean(Met_Year(3).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(3).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(3).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(3).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365),...
    '.' , 'MarkerSize' , 16 ,  'Color' , [67 , 147 , 195]./255);
plot(mean(Met_Year(3).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(3).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(3).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(3).ETrc_Year.PM_RC_CO2_Yang .* 365),...
    '.' , 'MarkerSize' , 16 ,  'Color' , [250 , 190 , 56]./255);

plot(mean(Met_Year(4).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(4).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(4).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(4).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365),...
    '.' , 'MarkerSize' , 16 , 'Color' , [99 , 141 , 201]./255);
plot(mean(Met_Year(4).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(4).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(4).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(4).ETrc_Year.PM_RC_CO2_Yang .* 365),...
    '.' , 'MarkerSize' , 16 , 'Color' , [249 , 161 , 89]./255);

plot(mean(Met_Year(5).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(5).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(5).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(5).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365),...
    '.' , 'MarkerSize' , 16 , 'Color' , [34 , 86 , 166]./255);
plot(mean(Met_Year(5).Met_Year.pr .* 1000.*31536000./997)./ mean(ETrc_Year(5).ETrc_Year.PM_RC.* 365),...
    mean(Met_Year(5).Met_Year.pr .* 1000.*31536000./997)./mean(ETrc_Year(5).ETrc_Year.PM_RC_CO2_Yang .* 365),...
    '.' , 'MarkerSize' , 16 , 'Color' , [244 , 109 , 67]./255);
axis equal;
plot([0.7,0.9],[0.7,0.9], 'k' , 'LineWidth' , 2.5);
xlim([0.7,0.9]); ylim([0.7,0.9]);
view(0,90);
xlabel('AI-FAO'); ylabel('AI-Yang&Jarvis');
set(gca , 'Color' , 'none' , 'YAxisLocation' , 'Right' , 'XAxisLocation' , 'Top' , ...
    'yTick' , [0.7:0.04:0.9] ,'xTick' , [0.7:0.04:0.9] , 'FontSize' , 24 , 'FontName' , 'Arial' , 'TickDir' , 'out' , 'LineWidth' , 2.5);



A = ETrc_Year(1).ETrc_Year.PM_RC;
B = ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H;
C = ETrc_Year(1).ETrc_Year.PM_RC_CO2_Yang;
plot(A(:),B(:),'.');hold on;
plot(A(:),C(:),'.');


A = ETrc_Year(2).ETrc_Year.PM_RC;
B = ETrc_Year(2).ETrc_Year.PM_RC_CO2_Jarvis_H;
C = ETrc_Year(2).ETrc_Year.PM_RC_CO2_Yang;
plot(A(:),B(:),'.');hold on;
plot(A(:),C(:),'.');


A = ETrc_Year(3).ETrc_Year.PM_RC;
B = ETrc_Year(3).ETrc_Year.PM_RC_CO2_Jarvis_H;
C = ETrc_Year(3).ETrc_Year.PM_RC_CO2_Yang;
plot(A(:),B(:),'.');hold on;
plot(A(:),C(:),'.');


A = ETrc_Year(4).ETrc_Year.PM_RC;
B = ETrc_Year(4).ETrc_Year.PM_RC_CO2_Jarvis_H;
C = ETrc_Year(4).ETrc_Year.PM_RC_CO2_Yang;
plot(A(:),B(:),'.');hold on;
plot(A(:),C(:),'.');


A = ETrc_Year(5).ETrc_Year.PM_RC;
B = ETrc_Year(5).ETrc_Year.PM_RC_CO2_Jarvis_H;
C = ETrc_Year(5).ETrc_Year.PM_RC_CO2_Yang;
plot(A(:),B(:),'.');hold on;
plot(A(:),C(:),'.');

plot([2.2,3.6],[2.2,3.6],'k');
xlim([2.2,3.6]);
ylim([2.2,3.6]);
