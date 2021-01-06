clc; clear all; close all;
% Programmed by Wei Tian, Institute of Geographic Sciences and Natural
% Resources Research, China. Email: tianw.17b@igsnrr.ac.cn
%% Setting the input/output paths
% CMIP6 Historical Data
InputETrcPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\Historical\ETrc_Historical_';
InputMetPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\Historical\Met_Var_Historical_';
OutputPDSIPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\Historical\PDSI_Historical_';
OutputscPDSIPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\Historical\scPDSI_Historical_';
% CMIP6 ScenarioMIP ssp126 Data
InputETrcPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp126\ETrc_ssp126_';
InputMetPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp126\Met_Var_ssp126_';
OutputPDSIPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp126\PDSI_ssp126_';
OutputscPDSIPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\ScenarioMIP_ssp126\scPDSI_ssp126_';
% CMIP6 ScenarioMIP ssp245 Data
InputETrcPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp245\ETrc_ssp245_';
InputMetPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp245\Met_Var_ssp245_';
OutputPDSIPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp245\PDSI_ssp245_';
OutputscPDSIPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\ScenarioMIP_ssp245\scPDSI_ssp245_';
% CMIP6 ScenarioMIP ssp370 Data
InputETrcPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp370\ETrc_ssp370_';
InputMetPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp370\Met_Var_ssp370_';
OutputPDSIPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp370\PDSI_ssp370_';
OutputscPDSIPath{4} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\ScenarioMIP_ssp370\scPDSI_ssp370_';
% CMIP6 ScenarioMIP ssp585 Data
InputETrcPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_ETrc\ScenarioMIP_ssp585\ETrc_ssp585_';
InputMetPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Met\ScenarioMIP_ssp585\Met_Var_ssp585_';
OutputPDSIPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_PDSI\ScenarioMIP_ssp585\PDSI_ssp585_';
OutputscPDSIPath{5} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_scPDSI\ScenarioMIP_ssp585\scPDSI_ssp585_';

% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};

for i_GCM = 12 : length(GCM_Ensemble)
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
    % (1.3) load available water capacity (AWC)
    % Global Gridded Surfaces of Selected Soil Characteristics
    % (https://webmap.ornl.gov/ogcdown/dataset.jsp?ds_id=569£©
    load('AWC.mat');
    
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
        %% (4) Calculate PDSI
        for ii = 1 : m
            ii
            for j = 1 : n
                % Extract the precipitation data corresponding to the grid
                data1 = squeeze(Pr(ii,j,[1:cal_mon]));
                % Extract the potential evapotranspiration data corresponding to the grid
                data2_PM_RC = squeeze(PET_PM_RC(ii,j,[1:cal_mon]));
                data2_PM_RC_CO2_Jarvis_H = squeeze(PET_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]));
                data2_PM_RC_CO2_Yang = squeeze(PET_PM_RC_CO2_Yang(ii,j,[1:cal_mon]));
                % Extract the AWC data corresponding to the grid
                awc = AWC(ii,j);
                
                if nansum(isnan(data1(:,end)))==0 &&  nansum(isnan(data2_PM_RC(:,end)))==0 && isnan(awc)==0
                    % Input data includes [year,month,monthly potential evapotranspiration,
                    % monthly precipitation,available water capacity]
                    DATA_PM_RC = [DateGens(Year) , data2_PM_RC , data1 , awc*ones(cal_mon,1)];
                    DATA_PM_RC_CO2_Jarvis_H = [DateGens(Year) , data2_PM_RC_CO2_Jarvis_H , data1 , awc*ones(cal_mon,1)];
                    DATA_PM_RC_CO2_Yang = [DateGens(Year) , data2_PM_RC_CO2_Yang , data1 , awc*ones(cal_mon,1)];
                    % Calculate PDSI.
                    % In this case, the calibration period is from 1850 to 2014
                    PDSI_v_PM_RC = PDSI(DATA_PM_RC,1850,2014); PDSI_v_PM_RC = real(PDSI_v_PM_RC);
                    PDSI_v_PM_RC_CO2_Jarvis_H = PDSI(DATA_PM_RC_CO2_Jarvis_H,1850,2014); PDSI_v_PM_RC_CO2_Jarvis_H = real(PDSI_v_PM_RC_CO2_Jarvis_H);
                    PDSI_v_PM_RC_CO2_Yang = PDSI(DATA_PM_RC_CO2_Yang,1850,2014); PDSI_v_PM_RC_CO2_Yang = real(PDSI_v_PM_RC_CO2_Yang);
                    % Calculate scPDSI.
                    % In this case, the calibration period is from 1850 to 2014
                    scPDSI_v_PM_RC = sc_PDSI(DATA_PM_RC,1850,2014,1,1); scPDSI_v_PM_RC = real(scPDSI_v_PM_RC);
                    scPDSI_v_PM_RC_CO2_Jarvis_H = sc_PDSI(DATA_PM_RC_CO2_Jarvis_H,1850,2014,1,1); scPDSI_v_PM_RC_CO2_Jarvis_H = real(scPDSI_v_PM_RC_CO2_Jarvis_H);
                    scPDSI_v_PM_RC_CO2_Yang = sc_PDSI(DATA_PM_RC_CO2_Yang,1850,2014,1,1); scPDSI_v_PM_RC_CO2_Yang = real(scPDSI_v_PM_RC_CO2_Yang);
                    clear DATA_PM_RC DATA_PM_RC_CO2_Jarvis_H DATA_PM_RC_CO2_Yang
                    
                    if nansum(PDSI_v_PM_RC)==0
                        pdsi_q_PM_RC(ii,j,[1:cal_mon]) = NaN; clear PDSI_v_PM_RC;
                        pdsi_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = NaN; clear PDSI_v_PM_RC_CO2_Jarvis_H;
                        pdsi_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = NaN; clear PDSI_v_PM_RC_CO2_Yang;
                    else
                        pdsi_q_PM_RC(ii,j,[1:cal_mon]) = PDSI_v_PM_RC; clear PDSI_v_PM_RC;
                        pdsi_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = PDSI_v_PM_RC_CO2_Jarvis_H; clear PDSI_v_PM_RC_CO2_Jarvis_H;
                        pdsi_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = PDSI_v_PM_RC_CO2_Yang; clear PDSI_v_PM_RC_CO2_Yang;
                    end
                    
                    if nansum(scPDSI_v_PM_RC)==0
                        scpdsi_q_PM_RC(ii,j,[1:cal_mon]) = NaN; clear scPDSI_v_PM_RC;
                        scpdsi_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = NaN; clear scPDSI_v_PM_RC_CO2_Jarvis_H;
                        scpdsi_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = NaN; clear scPDSI_v_PM_RC_CO2_Yang;
                    else
                        scpdsi_q_PM_RC(ii,j,[1:cal_mon]) = scPDSI_v_PM_RC; clear scPDSI_v_PM_RC;
                        scpdsi_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = scPDSI_v_PM_RC_CO2_Jarvis_H; clear scPDSI_v_PM_RC_CO2_Jarvis_H;
                        scpdsi_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = scPDSI_v_PM_RC_CO2_Yang; clear scPDSI_v_PM_RC_CO2_Yang;
                    end
                    
                else
                    pdsi_q_PM_RC(ii,j,[1:cal_mon]) = NaN; clear PDSI_v_PM_RC;
                    pdsi_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = NaN; clear PDSI_v_PM_RC_CO2_Jarvis_H;
                    pdsi_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = NaN; clear PDSI_v_PM_RC_CO2_Yang;
                    
                    scpdsi_q_PM_RC(ii,j,[1:cal_mon]) = NaN; clear scPDSI_v_PM_RC;
                    scpdsi_q_PM_RC_CO2_Jarvis_H(ii,j,[1:cal_mon]) = NaN; clear scPDSI_v_PM_RC_CO2_Jarvis_H;
                    scpdsi_q_PM_RC_CO2_Yang(ii,j,[1:cal_mon]) = NaN; clear scPDSI_v_PM_RC_CO2_Yang;
                end
                clear data1 data2_PM_RC data2_PM_RC_CO2_Jarvis_H data2_PM_RC_CO2_Yang awc
            end
        end
        clear ii j m n p cal_mon Year
        %% (5) Output PDSI and scPDSI
        pdsi_PM_RC = pdsi_q_PM_RC(: , : , [1981:end]);
        pdsi_PM_RC_CO2_Jarvis_H = pdsi_q_PM_RC_CO2_Jarvis_H(:,:,[1981:end]);
        pdsi_PM_RC_CO2_Yang = pdsi_q_PM_RC_CO2_Yang(:,:,[1981:end]);
        
        scpdsi_PM_RC = scpdsi_q_PM_RC(: , : , [1981:end]);
        scpdsi_PM_RC_CO2_Jarvis_H = scpdsi_q_PM_RC_CO2_Jarvis_H(:,:,[1981:end]);
        scpdsi_PM_RC_CO2_Yang = scpdsi_q_PM_RC_CO2_Yang(:,:,[1981:end]);
        if i_ssp == 1
            % save PDSI for future period
            save(strcat(OutputPDSIPath{ssp(i_ssp) + 1} , GCM) ,...
                'pdsi_PM_RC' , 'pdsi_PM_RC_CO2_Jarvis_H' , 'pdsi_PM_RC_CO2_Yang');
            clear pdsi_PM_RC pdsi_PM_RC_CO2_Jarvis_H pdsi_PM_RC_CO2_Yang
            % save scPDSI for future period
            save(strcat(OutputscPDSIPath{ssp(i_ssp) + 1} , GCM) ,...
                'scpdsi_PM_RC' , 'scpdsi_PM_RC_CO2_Jarvis_H' , 'scpdsi_PM_RC_CO2_Yang');
            clear scpdsi_PM_RC scpdsi_PM_RC_CO2_Jarvis_H scpdsi_PM_RC_CO2_Yang
            
            % save PDSI and scPDSI for historical period
            pdsi_PM_RC = pdsi_q_PM_RC(: , : , [1:1980]);
            pdsi_PM_RC_CO2_Jarvis_H = pdsi_q_PM_RC_CO2_Jarvis_H(: , : , [1:1980]);
            pdsi_PM_RC_CO2_Yang = pdsi_q_PM_RC_CO2_Yang(: , : , [1:1980]);
            
            scpdsi_PM_RC = scpdsi_q_PM_RC(: , : , [1:1980]);
            scpdsi_PM_RC_CO2_Jarvis_H = scpdsi_q_PM_RC_CO2_Jarvis_H(: , : , [1:1980]);
            scpdsi_PM_RC_CO2_Yang = scpdsi_q_PM_RC_CO2_Yang(: , : , [1:1980]);
            
            save(strcat(OutputPDSIPath{1} , GCM) ,...
                'pdsi_PM_RC' , 'pdsi_PM_RC_CO2_Jarvis_H' , 'pdsi_PM_RC_CO2_Yang');
            clear pdsi_PM_RC pdsi_PM_RC_CO2_Jarvis_H pdsi_PM_RC_CO2_Yang
            save(strcat(OutputscPDSIPath{1} , GCM) ,...
                'scpdsi_PM_RC' , 'scpdsi_PM_RC_CO2_Jarvis_H' , 'scpdsi_PM_RC_CO2_Yang');
            clear scpdsi_PM_RC scpdsi_PM_RC_CO2_Jarvis_H scpdsi_PM_RC_CO2_Yang
            clear Pr PET_PM_RC PET_PM_RC_CO2_Jarvis_H PET_PM_RC_CO2_Yang
            clear pdsi_q_PM_RC pdsi_q_PM_RC_CO2_Jarvis_H pdsi_q_PM_RC_CO2_Yang
            clear scpdsi_q_PM_RC scpdsi_q_PM_RC_CO2_Jarvis_H scpdsi_q_PM_RC_CO2_Yang
        else
            save(strcat(OutputPDSIPath{ssp(i_ssp) + 1} , GCM) ,...
                'pdsi_PM_RC' , 'pdsi_PM_RC_CO2_Jarvis_H' , 'pdsi_PM_RC_CO2_Yang');
            clear pdsi_PM_RC pdsi_PM_RC_CO2_Jarvis_H pdsi_PM_RC_CO2_Yang
            save(strcat(OutputscPDSIPath{ssp(i_ssp) + 1} , GCM) ,...
                'scpdsi_PM_RC' , 'scpdsi_PM_RC_CO2_Jarvis_H' , 'scpdsi_PM_RC_CO2_Yang');
            clear scpdsi_PM_RC scpdsi_PM_RC_CO2_Jarvis_H scpdsi_PM_RC_CO2_Yang
            clear Pr PET_PM_RC PET_PM_RC_CO2_Jarvis_H PET_PM_RC_CO2_Yang
            clear pdsi_q_PM_RC pdsi_q_PM_RC_CO2_Jarvis_H pdsi_q_PM_RC_CO2_Yang
            clear scpdsi_q_PM_RC scpdsi_q_PM_RC_CO2_Jarvis_H scpdsi_q_PM_RC_CO2_Yang
        end
    end
    clear i_ssp ssp GCM Pr_hist PM_RC_hist PM_RC_CO2_Jarvis_H_hist PM_RC_CO2_Yang_hist
end
