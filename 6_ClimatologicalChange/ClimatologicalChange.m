clc; clear all; close all;

%% Setting the input/output paths
% CMIP6 Historical Water cycle, Met, and AI Data
InputLandPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\Historical\Land_Var_Historical_';
InputMetPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\Historical\Met_Var_Historical_';
InputAIPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\Historical\AI_Historical_';
% CMIP6 ScenarioMIP ssp126 Water cycle, Met, and AI Data
InputLandPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp126\Land_Var_ssp126_';
InputMetPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_';
InputAIPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp126\AI_ssp126_';
% CMIP6 ScenarioMIP ssp245 Water cycle, Met, and AI Data
InputLandPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp245\Land_Var_ssp245_';
InputMetPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_';
InputAIPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp245\AI_ssp245_';
% CMIP6 ScenarioMIP ssp370 Water cycle, Met, and AI Data
InputLandPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp370\Land_Var_ssp370_';
InputMetPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_';
InputAIPath{4} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp370\AI_ssp370_';
% CMIP6 ScenarioMIP ssp585 Water cycle, Met, and AI Data
InputLandPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Land\ScenarioMIP_ssp585\Land_Var_ssp585_';
InputMetPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_';
InputAIPath{5} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_AridityIndex\ScenarioMIP_ssp585\AI_ssp585_';

OutputPath = 'D:\CMIP6\VariableStorage\ClimatologicalChange\';
ScenarioMIP = {'ssp126','ssp245','ssp370','ssp585'};
for i_Path = 2 : length(InputLandPath)
    if i_Path == 4
        % Name of Global Climate Model
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'GISS-E2-1-G','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    else
        % Name of Global Climate Model, since HadGEM3-GC31-LL model does
        % not have ssp370
        GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
            'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
            'GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
            'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
            'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};
    end
    %% Percentage Change Calculation
    for i_GCM = 1 : length(GCM_Ensemble)
        % Load GCM Historical yearly Land data
        load([InputLandPath{1} , GCM_Ensemble{i_GCM} , '.mat'])
        % Load GCM Historical yearly Met data
        load([InputMetPath{1} , GCM_Ensemble{i_GCM} , '.mat'])
        % Load GCM Historical yearly AI data
        load([InputAIPath{1} , GCM_Ensemble{i_GCM} , '.mat'])
        % Mean AI,pr,evspsbl,mrso£¬mrro for contemporary [1948-2014]
        AI_Con_Jarvis = mean(Grid_AI.PM_RC_CO2_Jarvis_H(:,:,99:end),3);
        AI_Con_Yang = mean(Grid_AI.PM_RC_CO2_Yang(:,:,99:end),3);
        AI_Con_FAO = mean(Grid_AI.PM_RC(:,:,99:end),3);
        pr_Con = mean(Met_Var.pr(:,:,99:end),3);
        evspsbl_Con = mean(Land_Var.evspsbl(:,:,99:end),3);
        mrso_Con = mean(Land_Var.mrso(:,:,99:end),3);
        mrro_Con = mean(Land_Var.mrro(:,:,99:end),3);
        clear Grid_AI Met_Var Land_Var
        
        % Load GCM ssp yearly Land data
        load([InputLandPath{i_Path} , GCM_Ensemble{i_GCM} , '.mat'])
        % Load GCM ssp yearly Met data
        load([InputMetPath{i_Path} , GCM_Ensemble{i_GCM} , '.mat'])
        % Load GCM ssp yearly AI data
        load([InputAIPath{i_Path} , GCM_Ensemble{i_GCM} , '.mat'])
        % AI, pr, evspsbl, mrso£¬mrro percentage change from contemporary to
        % far future [2070-2099]
        PerChange_AI_Jarvis = ...
            (mean(Grid_AI.PM_RC_CO2_Jarvis_H(:,:,56:end-1),3) - AI_Con_Jarvis) ./ AI_Con_Jarvis .* 100;
        PerChange_AI_Jarvis(PerChange_AI_Jarvis>100) = 100; % Percentage from -100 to 100%
        PerChange_AI_Jarvis(PerChange_AI_Jarvis<-100) = -100; % Percentage from -100 to 100%
        % Deal with where mrro_Con is zero
        PerChange_AI_Jarvis(AI_Con_Jarvis==0) = 0;
        PerChange_AI_Jarvis((mean(Grid_AI.PM_RC_CO2_Jarvis_H(:,:,56:end-1),3) - AI_Con_Jarvis)~=0 & AI_Con_Jarvis==0) = 100;
        
        PerChange_AI_Yang = ...
            (mean(Grid_AI.PM_RC_CO2_Yang(:,:,56:end-1),3) - AI_Con_Yang) ./ AI_Con_Yang .* 100;
        PerChange_AI_Yang(PerChange_AI_Yang>100) = 100; % Percentage from -100 to 100%
        PerChange_AI_Yang(PerChange_AI_Yang<-100) = -100; % Percentage from -100 to 100%
        % Deal with where mrro_Con is zero
        PerChange_AI_Yang(AI_Con_Yang==0) = 0;
        PerChange_AI_Yang((mean(Grid_AI.PM_RC_CO2_Yang(:,:,56:end-1),3) - AI_Con_Yang)~=0 & AI_Con_Yang==0) = 100;
        
        PerChange_AI_FAO = ...
            (mean(Grid_AI.PM_RC(:,:,56:end-1),3) - AI_Con_FAO) ./ AI_Con_FAO .* 100;
        PerChange_AI_FAO(PerChange_AI_FAO>100) = 100; % Percentage from -100 to 100%
        PerChange_AI_FAO(PerChange_AI_FAO<-100) = -100; % Percentage from -100 to 100%
        % Deal with where mrro_Con is zero
        PerChange_AI_FAO(AI_Con_FAO==0) = 0;
        PerChange_AI_FAO((mean(Grid_AI.PM_RC(:,:,56:end-1),3) - AI_Con_FAO)~=0 & AI_Con_FAO==0) = 100;
        
        PerChange_pr = ...
            (mean(Met_Var.pr(:,:,56:end-1),3) - pr_Con) ./ pr_Con .* 100;
        PerChange_pr(PerChange_pr>100) = 100; % Percentage from -100 to 100%
        PerChange_pr(PerChange_pr<-100) = -100; % Percentage from -100 to 100%
        % Deal with where mrro_Con is zero
        PerChange_pr(pr_Con==0) = 0;
        PerChange_pr((mean(Met_Var.pr(:,:,56:end-1),3) - pr_Con)~=0 & pr_Con==0) = 100;
        
        PerChange_evspsbl = ...
            (mean(Land_Var.evspsbl(:,:,56:end-1),3) - evspsbl_Con) ./ evspsbl_Con .* 100;
        PerChange_evspsbl(PerChange_evspsbl>100) = 100; % Percentage from -100 to 100%
        PerChange_evspsbl(PerChange_evspsbl<-100) = -100; % Percentage from -100 to 100%
        % Deal with where mrro_Con is zero
        PerChange_evspsbl(evspsbl_Con==0) = 0;
        PerChange_evspsbl((mean(Land_Var.evspsbl(:,:,56:end-1),3) - evspsbl_Con)~=0 & evspsbl_Con==0) = 100;
        
        PerChange_pr_evspsbl = ...
            (mean(Met_Var.pr(:,:,56:end-1),3) - mean(Land_Var.evspsbl(:,:,56:end-1),3)...
            - (pr_Con - evspsbl_Con) ) ./ (pr_Con - evspsbl_Con) .* 100;
        PerChange_pr_evspsbl(PerChange_pr_evspsbl>100) = 100; % Percentage from -100 to 100%
        PerChange_pr_evspsbl(PerChange_pr_evspsbl<-100) = -100; % Percentage from -100 to 100%
        % Deal with where mrro_Con is zero
        PerChange_pr_evspsbl((pr_Con - evspsbl_Con)==0) = 0;
        PerChange_pr_evspsbl((mean(Met_Var.pr(:,:,56:end-1),3) - mean(Land_Var.evspsbl(:,:,56:end-1),3)...
            - (pr_Con - evspsbl_Con) )~=0 & (pr_Con - evspsbl_Con)==0) = 100;
        
        PerChange_mrso = ...
            (mean(Land_Var.mrso(:,:,56:end-1),3) - mrso_Con) ./ mrso_Con .* 100;
        PerChange_mrso(PerChange_mrso>100) = 100; % Percentage from -100 to 100%
        PerChange_mrso(PerChange_mrso<-100) = -100; % Percentage from -100 to 100%
        % Deal with where mrro_Con is zero
        PerChange_mrso(mrso_Con==0) = 0;
        PerChange_mrso((mean(Land_Var.mrso(:,:,56:end-1),3) - mrso_Con)~=0 & mrso_Con==0) = 100;
        
        PerChange_mrro = ...
            (mean(Land_Var.mrro(:,:,56:end-1),3) - mrro_Con) ./ mrro_Con .* 100;
        PerChange_mrro(PerChange_mrro>100) = 100; % Percentage from -100 to 100%
        PerChange_mrro(PerChange_mrro<-100) = -100; % Percentage from -100 to 100%
        % Deal with where mrro_Con is zero
        PerChange_mrro(mrro_Con==0) = 0;
        PerChange_mrro((mean(Land_Var.mrro(:,:,56:end-1),3) - mrro_Con)~=0 & mrro_Con==0) = 100;
        
        clear Grid_AI Met_Var Land_Var
        clear AI_Con_Jarvis AI_Con_Yang AI_Con_FAO pr_Con evspsbl_Con mrso_Con mrro_Con
        
        % Adjust map range from 0~360 to -180~180
        A = PerChange_AI_Jarvis(1:360 , :); B = PerChange_AI_Jarvis(361:end , :);
        PerChange.PerChange_AI_Jarvis(:,:,i_GCM) = [B;A]; clear B A
        A = PerChange_AI_Yang(1:360 , :); B = PerChange_AI_Yang(361:end , :);
        PerChange.PerChange_AI_Yang(:,:,i_GCM) = [B;A]; clear B A
        A = PerChange_AI_FAO(1:360 , :); B = PerChange_AI_FAO(361:end , :);
        PerChange.PerChange_AI_FAO(:,:,i_GCM) = [B;A]; clear B A
        A = PerChange_evspsbl(1:360 , :); B = PerChange_evspsbl(361:end , :);
        PerChange.PerChange_evspsbl(:,:,i_GCM) = [B;A]; clear B A
        A = PerChange_mrro(1:360 , :); B = PerChange_mrro(361:end , :);
        PerChange.PerChange_mrro(:,:,i_GCM) = [B;A]; clear B A
        A = PerChange_mrso(1:360 , :); B = PerChange_mrso(361:end , :);
        PerChange.PerChange_mrso(:,:,i_GCM) = [B;A]; clear B A
        A = PerChange_pr(1:360 , :); B = PerChange_pr(361:end , :);
        PerChange.PerChange_pr(:,:,i_GCM) = [B;A]; clear B A
        A = PerChange_pr_evspsbl(1:360 , :); B = PerChange_pr_evspsbl(361:end , :);
        PerChange.PerChange_pr_evspsbl(:,:,i_GCM) = [B;A]; clear B A
        
        clear PerChange_AI_Jarvis PerChange_AI_Yang PerChange_AI_FAO PerChange_evspsbl PerChange_mrro
        clear PerChange_mrso PerChange_pr PerChange_pr_evspsbl
    end
    save([OutputPath , 'PerChange_' , ScenarioMIP{i_Path-1}] , 'PerChange');
    clear PerChange GCM_Ensemble i_GCM
end
clear i_Path
