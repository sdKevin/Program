clc; clear all; close all;
% Programmed by Wei Tian, Institute of Geographic Sciences and Natural
% Resources Research, China. Email: tianw.17b@igsnrr.ac.cn

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CMIP6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting the input/output paths
% CMIP6 Historical Data
InputETrcPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\Historical\ETrc_Historical_';
InputMetPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\Historical\Met_Var_Historical_';
OutputSPEIPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPEI\Historical\SPEI_Historical_';
% CMIP6 ScenarioMIP ssp126 Data
InputETrcPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_';
InputMetPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_';
OutputSPEIPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPEI\ScenarioMIP_ssp126\SPEI_ssp126_';
% CMIP6 ScenarioMIP ssp245 Data
InputETrcPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_';
InputMetPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_';
OutputSPEIPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPEI\ScenarioMIP_ssp245\SPEI_ssp245_';
% CMIP6 ScenarioMIP ssp370 Data
InputETrcPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_';
InputMetPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_';
OutputSPEIPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPEI\ScenarioMIP_ssp370\SPEI_ssp370_';
% CMIP6 ScenarioMIP ssp585 Data
InputETrcPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_';
InputMetPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_';
OutputSPEIPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPEI\ScenarioMIP_ssp585\SPEI_ssp585_';

% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};

for i_GCM = 1 : length(GCM_Ensemble)
    GCM = GCM_Ensemble{i_GCM}
    if strcmp(GCM_Ensemble{i_GCM} , 'HadGEM3-GC31-LL') %since HadGEM3-GC31-LL model does not have ssp370
        ssp = [1 , 2 , 4];
    else
        ssp = [1 , 2 , 3 , 4];
    end
    
    %% (1) load historical data (1850-2014)
    % (1.1) Load ETrc (mm/day)
    load(strcat(InputETrcPath{1} , GCM , '.mat'));
    PM_RC_hist = PM_RC .* 30; % from mm/day to mm/mon
    PM_RC_CO2_Jarvis_H_hist = PM_RC_CO2_Jarvis_H .* 30; % from mm/day to mm/mon
    PM_RC_CO2_Yang_hist = PM_RC_CO2_Yang .* 30; % from mm/day to mm/mon
    clear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Jarvis_L PM_RC_CO2_Yang
    % (1.2) Load Precipitation (kg/(m2s))
    load(strcat(InputMetPath{1} , GCM , '.mat'));
    Pr_hist = Met_Var.pr .* 1000 .* 2592000 ./ 997; % from kg/(m2s) to mm/mon
    clear Met_Var
    
    for i_ssp = 1 : length(ssp)
        %% (2) load SSP data
        % (2.1) Load ETrc (mm/day)
        load(strcat(InputETrcPath{ssp(i_ssp) + 1} , GCM , '.mat'));
        PM_RC_ssp = PM_RC .* 30; % from mm/day to mm/mon
        PM_RC_CO2_Jarvis_H_ssp = PM_RC_CO2_Jarvis_H .* 30; % from mm/day to mm/mon
        PM_RC_CO2_Yang_ssp = PM_RC_CO2_Yang .* 30; % from mm/day to mm/mon
        clear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Jarvis_L PM_RC_CO2_Yang
        % (2.2) Load Precipitation (kg/(m2s))
        load(strcat(InputMetPath{ssp(i_ssp) + 1} , GCM , '.mat'));
        Pr_ssp = Met_Var.pr .* 1000 .* 2592000 ./ 997; % from kg/(m2s) to mm/mon
        clear Met_Var
        
        %% (3) Concatenate historical data and SSP data
        Pr = cat(3 , Pr_hist , Pr_ssp);
        PET_PM_RC = cat(3 , PM_RC_hist , PM_RC_ssp);
        PET_PM_RC_CO2_Jarvis_H = cat(3 , PM_RC_CO2_Jarvis_H_hist , PM_RC_CO2_Jarvis_H_ssp);
        PET_PM_RC_CO2_Yang = cat(3 , PM_RC_CO2_Yang_hist , PM_RC_CO2_Yang_ssp);
        clear Pr_ssp PM_RC_ssp PM_RC_CO2_Jarvis_H_ssp PM_RC_CO2_Yang_ssp
        
        [m , n , p] = size(Pr);
        cal_mon = p;
        Year = [1850 : 2100]; % Calculation period
        %% (4) Calculate SPEI
        for ii = 1 : m
            ii
            for j = 1 : n
                % Extract the precipitation data corresponding to the grid
                data1 = squeeze(Pr(ii,j,[1:cal_mon]));
                % Extract the potential evapotranspiration data corresponding to the grid
                data2_PM_RC = squeeze(PET_PM_RC(ii,j,[1:cal_mon]));
                data2_PM_RC_CO2_Jarvis_H = squeeze(PET_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]));
                data2_PM_RC_CO2_Yang = squeeze(PET_PM_RC_CO2_Yang(ii,j,[1:cal_mon]));
                
                if nansum(isnan(data1(:,end)))==0 && nansum(isnan(data2_PM_RC(:,end)))==0
                    % Input data includes [year,month,monthly potential evapotranspiration,
                    % monthly precipitation]
                    DATA_PM_RC = [DateGens(Year) , data1 , data2_PM_RC];
                    DATA_PM_RC_CO2_Jarvis_H = [DateGens(Year) , data1 , data2_PM_RC_CO2_Jarvis_H];
                    DATA_PM_RC_CO2_Yang = [DateGens(Year) , data1 , data2_PM_RC_CO2_Yang];
                    % Calculate SPEI.
                    % In this case, the calibration period is from 1850 to 2014
                    SPEI_v_PM_RC = SPEIcc(DATA_PM_RC,1850,2014,3,12);
                    SPEI_v_PM_RC_CO2_Jarvis_H = SPEIcc(DATA_PM_RC_CO2_Jarvis_H,1850,2014,3,12);
                    SPEI_v_PM_RC_CO2_Yang = SPEIcc(DATA_PM_RC_CO2_Yang,1850,2014,3,12);
                    
                    if nansum(SPEI_v_PM_RC)==0
                        spei_q_PM_RC(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC;
                        spei_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC_CO2_Jarvis_H;
                        spei_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC_CO2_Yang;
                    else
                        spei_q_PM_RC(ii,j,[1:cal_mon]) = SPEI_v_PM_RC; clear SPEI_v_PM_RC;
                        spei_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = SPEI_v_PM_RC_CO2_Jarvis_H; clear SPEI_v_PM_RC_CO2_Jarvis_H;
                        spei_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = SPEI_v_PM_RC_CO2_Yang; clear SPEI_v_PM_RC_CO2_Yang;
                    end
                    
                else
                    spei_q_PM_RC(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC;
                    spei_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC_CO2_Jarvis_H;
                    spei_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC_CO2_Yang;
                end
                clear data1 data2_PM_RC data2_PM_RC_CO2_Jarvis_H data2_PM_RC_CO2_Yang
                clear DATA_PM_RC DATA_PM_RC_CO2_Jarvis_H DATA_PM_RC_CO2_Yang
            end
        end
        clear ii j m n p cal_mon Year
        %% (5) Output SPEI
        spei_PM_RC = spei_q_PM_RC(: , : , [1981:end]);
        spei_PM_RC_CO2_Jarvis_H = spei_q_PM_RC_CO2_Jarvis_H(:,:,[1981:end]);
        spei_PM_RC_CO2_Yang = spei_q_PM_RC_CO2_Yang(:,:,[1981:end]);
        if i_ssp == 1
            % save SPEI for future period
            save(strcat(OutputSPEIPath{ssp(i_ssp) + 1} , GCM) ,...
                'spei_PM_RC' , 'spei_PM_RC_CO2_Jarvis_H' , 'spei_PM_RC_CO2_Yang');
            clear spei_PM_RC spei_PM_RC_CO2_Jarvis_H spei_PM_RC_CO2_Yang
            
            % save SPEI for historical period
            spei_PM_RC = spei_q_PM_RC(: , : , [1:1980]);
            spei_PM_RC_CO2_Jarvis_H = spei_q_PM_RC_CO2_Jarvis_H(: , : , [1:1980]);
            spei_PM_RC_CO2_Yang = spei_q_PM_RC_CO2_Yang(: , : , [1:1980]);
            
            save(strcat(OutputSPEIPath{1} , GCM) ,...
                'spei_PM_RC' , 'spei_PM_RC_CO2_Jarvis_H' , 'spei_PM_RC_CO2_Yang');
            clear spei_PM_RC spei_PM_RC_CO2_Jarvis_H spei_PM_RC_CO2_Yang
            
            clear Pr PET_PM_RC PET_PM_RC_CO2_Jarvis_H PET_PM_RC_CO2_Yang
            clear spei_q_PM_RC spei_q_PM_RC_CO2_Jarvis_H spei_q_PM_RC_CO2_Yang
        else
            save(strcat(OutputSPEIPath{ssp(i_ssp) + 1} , GCM) ,...
                'spei_PM_RC' , 'spei_PM_RC_CO2_Jarvis_H' , 'spei_PM_RC_CO2_Yang');
            clear spei_PM_RC spei_PM_RC_CO2_Jarvis_H spei_PM_RC_CO2_Yang
            clear Pr PET_PM_RC PET_PM_RC_CO2_Jarvis_H PET_PM_RC_CO2_Yang
            clear spei_q_PM_RC spei_q_PM_RC_CO2_Jarvis_H spei_q_PM_RC_CO2_Yang
        end
    end
    clear i_ssp ssp GCM Pr_hist PM_RC_hist PM_RC_CO2_Jarvis_H_hist PM_RC_CO2_Yang_hist
end



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Princeton %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% Setting the input/output paths
InputETrcPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\Princeton\ETrc_Princeton.mat';
InputMetPath_Princeton = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\Princeton\Met_Var_Princeton.mat';
OutputSPEIPath = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_SPEI\Princeton\SPEI_Princeton';

%% (1) load Princeton data (1948-2014)
% (1.1) Load ETrc (mm/day)
load(InputETrcPath_Princeton);
PET_PM_RC = PM_RC .* 30; % from mm/day to mm/mon
PET_PM_RC_CO2_Jarvis_H = PM_RC_CO2_Jarvis_H .* 30; % from mm/day to mm/mon
PET_PM_RC_CO2_Yang = PM_RC_CO2_Yang .* 30; % from mm/day to mm/mon
clear PM_RC PM_RC_CO2_Jarvis_H PM_RC_CO2_Jarvis_L PM_RC_CO2_Yang
% (1.2) Load Precipitation (kg/(m2s))
load(InputMetPath_Princeton);
Pr = Met_Var.pr .* 1000 .* 2592000 ./ 997; % from kg/(m2s) to mm/mon
clear Met_Var

[m , n , p] = size(Pr);
cal_mon = p;
Year = [1948 : 2014]; % Calculation period
%% (2) Calculate SPEI
for ii = 1 : m
    ii
    for j = 1 : n
        % Extract the precipitation data corresponding to the grid
        data1 = squeeze(Pr(ii,j,[1:cal_mon]));
        % Extract the potential evapotranspiration data corresponding to the grid
        data2_PM_RC = squeeze(PET_PM_RC(ii,j,[1:cal_mon]));
        data2_PM_RC_CO2_Jarvis_H = squeeze(PET_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]));
        data2_PM_RC_CO2_Yang = squeeze(PET_PM_RC_CO2_Yang(ii,j,[1:cal_mon]));
        
        if nansum(isnan(data1(:,end)))==0 && nansum(isnan(data2_PM_RC(:,end)))==0
            % Input data includes [year,month,monthly potential evapotranspiration,
            % monthly precipitation]
            DATA_PM_RC = [DateGens(Year) , data1 , data2_PM_RC];
            DATA_PM_RC_CO2_Jarvis_H = [DateGens(Year) , data1 , data2_PM_RC_CO2_Jarvis_H];
            DATA_PM_RC_CO2_Yang = [DateGens(Year) , data1 , data2_PM_RC_CO2_Yang];
            % Calculate SPEI.
            % In this case, the calibration period is from 1948 to 2014
            SPEI_v_PM_RC = SPEIcc(DATA_PM_RC,1948,2014,3,12);
            SPEI_v_PM_RC_CO2_Jarvis_H = SPEIcc(DATA_PM_RC_CO2_Jarvis_H,1948,2014,3,12);
            SPEI_v_PM_RC_CO2_Yang = SPEIcc(DATA_PM_RC_CO2_Yang,1948,2014,3,12);
            
            if nansum(SPEI_v_PM_RC)==0
                spei_q_PM_RC(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC;
                spei_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC_CO2_Jarvis_H;
                spei_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC_CO2_Yang;
            else
                spei_q_PM_RC(ii,j,[1:cal_mon]) = SPEI_v_PM_RC; clear SPEI_v_PM_RC;
                spei_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = SPEI_v_PM_RC_CO2_Jarvis_H; clear SPEI_v_PM_RC_CO2_Jarvis_H;
                spei_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = SPEI_v_PM_RC_CO2_Yang; clear SPEI_v_PM_RC_CO2_Yang;
            end
            
        else
            spei_q_PM_RC(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC;
            spei_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC_CO2_Jarvis_H;
            spei_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = NaN; clear SPEI_v_PM_RC_CO2_Yang;
        end
        clear data1 data2_PM_RC data2_PM_RC_CO2_Jarvis_H data2_PM_RC_CO2_Yang
        clear DATA_PM_RC DATA_PM_RC_CO2_Jarvis_H DATA_PM_RC_CO2_Yang
    end
end
clear ii j m n p cal_mon Year
%% (3) Output SPEI
spei_PM_RC = spei_q_PM_RC;
spei_PM_RC_CO2_Jarvis_H = spei_q_PM_RC_CO2_Jarvis_H;
spei_PM_RC_CO2_Yang = spei_q_PM_RC_CO2_Yang;

% save SPEI
save(OutputSPEIPath ,...
    'spei_PM_RC' , 'spei_PM_RC_CO2_Jarvis_H' , 'spei_PM_RC_CO2_Yang');
clear spei_PM_RC spei_PM_RC_CO2_Jarvis_H spei_PM_RC_CO2_Yang