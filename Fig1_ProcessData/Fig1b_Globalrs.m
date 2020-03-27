clc;clear all;close all;

%% Setting the input/output paths
InputPath_HistoricalMiddle = 'D:\CMIP6\Output\Output_Attribution\Middle_Var_Historical_';
InputPath_ScenarioMiddle = 'D:\CMIP6\Output\Output_Attribution\Middle_Var_ssp585_';
OutputPath_Yearly = 'D:\CMIP6\Output\Output_Yearly';

%% (1) GlobalLand = Land from 60S to 90N Year 1850-2100
% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','NorESM2-MM','UKESM1-0-LL'};

for i_GCM = 1 : length(GCM_Ensemble)
    %% 1850-2014 Historical Year Series
    GCM = GCM_Ensemble{i_GCM};
    load(strcat(InputPath_HistoricalMiddle , GCM , '.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1:12:size(Middle_Var.rs_H,3)
        % rs_H
        A = Middle_Var.rs_H(:,:,ii:ii+11);
        GridYear.rs_H(:,:,iii) = nanmean(A,3);
        % rs_L
        B = Middle_Var.rs_L(:,:,ii:ii+11);
        GridYear.rs_L(:,:,iii) = nanmean(B,3);
        % rs_Yang
        C = Middle_Var.rs_Yang(:,:,ii:ii+11);
        GridYear.rs_Yang(:,:,iii) = nanmean(C,3);
        clear A B C
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year1
    for ii = 1 : size(GridYear.rs_H , 3)
        A = GridYear.rs_H(:,:,ii); Year1.rs_H(ii) = nanmean(A(:)); GridYear.rs_H(:,:,ii)=A; clear A;
        A = GridYear.rs_L(:,:,ii); Year1.rs_L(ii) = nanmean(A(:)); GridYear.rs_L(:,:,ii)=A; clear A;
        A = GridYear.rs_Yang(:,:,ii); Year1.rs_Yang(ii) = nanmean(A(:)); GridYear.rs_Yang(:,:,ii)=A; clear A;
    end
    GridYear_Historical = GridYear;
    clear ii GridYear Middle_Var
    %% 2015-2100 ssp Year Series
    load(strcat(InputPath_ScenarioMiddle , GCM , '.mat'));
    % Monthly Grid to Yearly Grid : GridYear
    iii = 1;
    for ii = 1 : 12 : size(Middle_Var.rs_H,3)
        % rs_H
        A = Middle_Var.rs_H(:,:,ii:ii+11);
        GridYear.rs_H(:,:,iii) = nanmean(A,3);
        % rs_L
        B = Middle_Var.rs_L(:,:,ii:ii+11);
        GridYear.rs_L(:,:,iii) = nanmean(B,3);
        % rs_Yang
        C = Middle_Var.rs_Yang(:,:,ii:ii+11);
        GridYear.rs_Yang(:,:,iii) = nanmean(C,3);
        clear A B C
        iii = iii+1;
    end
    clear ii iii;
    % Yearly Grid to Yearly series : Year2
    for ii = 1 : size(GridYear.rs_H,3)
        A = GridYear.rs_H(:,:,ii); Year2.rs_H(ii) = nanmean(A(:)); GridYear.rs_H(:,:,ii) = A; clear A;%Only Global Land
        A = GridYear.rs_L(:,:,ii); Year2.rs_L(ii) = nanmean(A(:)); GridYear.rs_L(:,:,ii) = A; clear A;
        A = GridYear.rs_Yang(:,:,ii); Year2.rs_Yang(ii) = nanmean(A(:)); GridYear.rs_Yang(:,:,ii) = A; clear A;
    end
    GridYear_Future = GridYear;
    clear ii GridYear Middle_Var
    %% Output Middle_Year from 1850-2100
    Middle_Year.rs_H(i_GCM,:) = [Year1.rs_H , Year2.rs_H];
    Middle_Year.rs_L(i_GCM,:) = [Year1.rs_L , Year2.rs_L];
    Middle_Year.rs_Yang(i_GCM,:) = [Year1.rs_Yang , Year2.rs_Yang];
    clear Year1 Year2
    %% Output GridYear from 1850-2100
    GridYear.rs_H = cat(3 , GridYear_Historical.rs_H , GridYear_Future.rs_H);
    GridYear.rs_L = cat(3 , GridYear_Historical.rs_L , GridYear_Future.rs_L);
    GridYear.rs_Yang = cat(3 , GridYear_Historical.rs_Yang , GridYear_Future.rs_Yang);
    clear GridYear_Historical GridYear_Future
    save(strcat(OutputPath_Yearly , '\rs_GridYear_',GCM),'GridYear');
    clear GridYear GCM
end
clear GCM_Ensemble GCM i_GCM
save(strcat(OutputPath_Yearly , '\Middle_Year') , 'Middle_Year');
%% (2) Drawing
clc;clear all;
OutputPath_Yearly = 'D:\CMIP6\Output\Output_Yearly';
load([OutputPath_Yearly , '\Middle_Year' , '.mat'])
% Name of Global Climate Model
GCM_Ensemble = {'ACCESS-CM2','ACCESS-ESM1-5','BCC-CSM2-MR','CanESM5','CanESM5-CanOE',...
    'CESM2','CESM2-WACCM','CNRM-CM6-1','CNRM-ESM2-1','EC-Earth3','EC-Earth3-Veg',...
    'FGOALS-f3-L','FGOALS-g3','GFDL-ESM4','GISS-E2-1-G','HadGEM3-GC31-LL','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC6','MIROC-ES2L','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'MRI-ESM2-0','UKESM1-0-LL'};
% Ensemble Analysis
for i_GCM = 1 : length(GCM_Ensemble)
    load([OutputPath_Yearly , '\rs_GridYear_' , GCM_Ensemble{i_GCM} , '.mat'])
    close all
    rs_H_1990_2019(:,:,i_GCM) = mean(GridYear.rs_H(:,:,141:170),3);
    rs_Yang_1990_2019(:,:,i_GCM) = mean(GridYear.rs_Yang(:,:,141:170),3);
    
    rs_H_1948_2014(:,:,i_GCM) = mean(GridYear.rs_H(:,:,99:165),3);
    rs_Yang_1948_2014(:,:,i_GCM) = mean(GridYear.rs_Yang(:,:,99:165),3);
    
    rs_H_2070_2099(:,:,i_GCM) = mean(GridYear.rs_H(:,:,221:250),3);
    rs_Yang_2070_2099(:,:,i_GCM) = mean(GridYear.rs_Yang(:,:,221:250),3);
    
    mesh((rs_H_2070_2099(:,:,i_GCM)-rs_H_1990_2019(:,:,i_GCM))./rs_H_1990_2019(:,:,i_GCM).*100);
    view(90,-90)
    colorbar
    clear GridYear
    % pause(5)
end

% Relative Change of rs_Yang which is only related to CO2 therefore only
% one value
nanmean(nanmean((nanmean(rs_Yang_2070_2099,3) - nanmean(rs_Yang_1948_2014,3))./nanmean(rs_Yang_1948_2014,3).*100))

Fig1b_Plotting( Middle_Year , rs_H_1948_2014 , rs_H_2070_2099)
