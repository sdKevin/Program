%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Calculating Drought Frequency and Extent using CMIP Met&Land Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% Setting the input/output paths
% CMIP6 hist-nat Met Data
InputMetLandPath{1} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\hist_nat\Met_Land_Var_hist_nat_';
OutputDroughtPath{1} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\hist_nat\Met_Land_hist_nat_';
% CMIP6 ssp245-nat Data
InputMetLandPath{2} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\ssp245_nat\Met_Land_Var_ssp245_nat_';
OutputDroughtPath{2} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\ssp245_nat\Met_Land_ssp245_nat_';
% CMIP6 piControl Data
InputMetLandPath{3} = 'D:\CMIP6\VariableStorage\MonthlyVar\Var_Land\piControl\Met_Land_Var_piControl_';
OutputDroughtPath{3} = 'D:\CMIP6\VariableStorage\YearlyVar\Var_Drought\piControl\Met_Land_piControl_';

% global land surface Area including both land and water (km^2)
load EarthLandArea_05deg % Land and Water Area V4.11, download from https://sedac.ciesin.columbia.edu/data/set/gpw-v4-land-water-area-rev11
load LandInfo_05deg.mat
%% (1) Monthly Met calculated by CMIP6 data
for i_Path = 1 : length(InputMetLandPath)
     % Name of Global Climate Model
    GCM_Ensemble = {'CanESM5','GISS-E2-1-G','IPSL-CM6A-LR','MIROC6','NorESM2-LM'};
    
    for i_GCM = 1 : length(GCM_Ensemble)
        %% (1.1) CMIP6 Historical and Scenarios
        GCM = GCM_Ensemble{i_GCM};
        
        %% (1.1.1) Calculate Threshold During reference period
        load(strcat(InputMetLandPath{1} , GCM , '.mat'));
        Pr_ref = r1.pr(:,:,:); %kg/(m2s)
        % Select reference time
        % Reference Time 1948-2014
        % Pr_ref = Met_Var.pr(:,:,1177:end); %kg/(m2s), from 1850-2014 to 1948-2014
        % Q_ref = r1.mrro(:,:,1177:end); %kg/(m2s), from 1850-2014 to 1948-2014
        % SM_ref = r1.mrso(:,:,1177:end); %kg/(m2), from 1850-2014 to 1948-2014
        % Pr_ET_ref = Pr_ref - r1.evspsbl(:,:,1177:end); %kg/(m2s), from 1850-2014 to 1948-2014 !!! Warning Negative Pr-ET caused by bias correction using different reference data
        % Reference Time 1850-2014
        Q_ref = r1.mrro(:,:,:); %kg/(m2s)
        SM_ref = r1.mrso(:,:,:); %kg/(m2)
        clear r1
        for ii = 1 : size(Pr_ref,1)
            for iii = 1 : size(Pr_ref,2)
                for i_month = 1 : 12 % Each Grid has 12 threshold for each month
                    All_Month = size(Pr_ref,3);
                    if nansum(isnan(Q_ref(ii,iii,i_month:12:All_Month)))==0
                        % Pr
                        A = Pr_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        if B(ceil(length(B)*0.1))<=0 | isnan(B(ceil(length(B)*0.1)))
                            Threshold.Pr(ii,iii,i_month) = nan; % ignore girds where 10th Percentile = 0 or nan
                        else
                            B(B<=0) = min(B(B>0)); % For satisfying positive restriction in ksdensity function
                            % Kernal Density Function
                            % warning('')
                            % [Bi , Fb , bw] = ksdensity(B , 0.1 , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function','icdf'); % Kernel Density
                            % [warnMsg, warnId] = lastwarn; % Warning means bad icdf estimations, thus adjusting bandwidth
                            % if ~isempty(warnMsg)
                            % while ~isempty(warnMsg)
                            %     warning('')
                            %     [Bi , Fb , bw] = ksdensity(B , 0.1 , 'BandWidth' , 5*bw , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            %     [warnMsg, warnId] = lastwarn;
                            % end
                            %     figure; ecdf(B); hold on; plot(Bi,Fb); title(strcat('PrGrid:',num2str(ii),'and',num2str(iii)));
                            % end
                            % Threshold.Pr(ii,iii,i_month) = Bi; clear B Bi Fb bw warnMsg warnId;  % 10th Percentile
                            
                            % A Quick Approximation of Kernal Density Function
                            Threshold.Pr(ii,iii,i_month) = B(ceil(length(B)*0.1)); clear B; % 10th Percentile
                        end
                        
                        % Q
                        A = Q_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        if B(ceil(length(B)*0.1))<=0 | isnan(B(ceil(length(B)*0.1)))
                            Threshold.Q(ii,iii,i_month) = nan; % ignore girds where 10th Percentile = 0 or nan
                        else
                            B(B<=0) = min(B(B>0)); % For satisfying positive restriction in ksdensity function
                            % Kernal Density Function
                            % warning('')
                            % [Bi , Fb , bw] = ksdensity(B , 0.1 , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function','icdf'); % Kernel Density
                            % [warnMsg, warnId] = lastwarn; % Warning means bad icdf estimations, thus adjusting bandwidth
                            % if ~isempty(warnMsg)
                            % while ~isempty(warnMsg)
                            %     warning('')
                            %     [Bi , Fb , bw] = ksdensity(B , 0.1 , 'BandWidth' , 5*bw , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            %     [warnMsg, warnId] = lastwarn;
                            % end
                            %     figure; ecdf(B); hold on; plot(Bi,Fb); title(strcat('QGrid:',num2str(ii),'and',num2str(iii)));
                            % end
                            % Threshold.Q(ii,iii,i_month) = Bi; clear B Bi Fb bw warnMsg warnId;  % 10th Percentile
                            
                            % A Quick Approximation of Kernal Density Function
                            Threshold.Q(ii,iii,i_month) = B(ceil(length(B)*0.1)); clear B; %10th Percentile
                        end
                        
                        % SM
                        A = SM_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        if B(ceil(length(B)*0.1))<=0 | isnan(B(ceil(length(B)*0.1)))
                            Threshold.SM(ii,iii,i_month) = nan; % ignore girds where 10th Percentile = 0 or nan
                        else
                            B(B<=0) = min(B(B>0)); % For satisfying positive restriction in ksdensity function
                            % Kernal Density Function
                            % warning('')
                            % [Bi , Fb , bw] = ksdensity(B , 0.1 , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function','icdf'); % Kernel Density
                            % [warnMsg, warnId] = lastwarn; % Warning means bad icdf estimations, thus adjusting bandwidth
                            % if ~isempty(warnMsg)
                            % while ~isempty(warnMsg)
                            %     warning('')
                            %     [Bi , Fb , bw] = ksdensity(B , 0.1 , 'BandWidth' , 5*bw , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            %     [warnMsg, warnId] = lastwarn;
                            % end
                            %     figure; ecdf(B); hold on; plot(Bi,Fb); title(strcat('SMGrid:',num2str(ii),'and',num2str(iii)));
                            % end
                            % Threshold.SM(ii,iii,i_month) = Bi; clear B Bi Fb bw warnMsg warnId;  % 10th Percentile
                            
                            % A Quick Approximation of Kernal Density Function
                            Threshold.SM(ii,iii,i_month) = B(ceil(length(B)*0.1)); clear B; %10th Percentile
                        end

                    else
                        Threshold.Pr(ii,iii,i_month) = nan;
                        Threshold.Q(ii,iii,i_month) = nan;
                        Threshold.SM(ii,iii,i_month) = nan;
                    end
                end
            end
        end
        clear ii iii Pr_ref Q_ref SM_ref i_month All_Month
        
        %% (1.1.2) Global Drought Extent Analysis
        load(strcat(InputMetLandPath{i_Path} , GCM , '.mat'));
        Pr = r1.pr; %kg/(m2s)
        Q = r1.mrro; %kg/(m2s)
        SM = r1.mrso; %kg/(m2)
        clear r1
        for ii = 1 : size( Pr , 3)
            if mod(ii,12)~=0
                i_month = mod(ii,12);
            else
                i_month = 12;
            end
            % Pr
            DroughtExtent_Month.Pr(i_GCM,ii) = nansum(EarthLandArea_05deg(Pr(:,:,ii)<Threshold.Pr(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % Q
            DroughtExtent_Month.Q(i_GCM,ii) = nansum(EarthLandArea_05deg(Q(:,:,ii)<Threshold.Q(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % SM
            DroughtExtent_Month.SM(i_GCM,ii) = nansum(EarthLandArea_05deg(SM(:,:,ii)<Threshold.SM(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % Compound Drought1: Met&Hyd Co-occurrence
            DroughtExtent_Month.CompoundDrought1(i_GCM,ii) = nansum(EarthLandArea_05deg(...
                Pr(:,:,ii)<Threshold.Pr(:,:,i_month) & Q(:,:,ii)<Threshold.Q(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % Compound Drought2: Met&Agr Co-occurrence
            DroughtExtent_Month.CompoundDrought2(i_GCM,ii) = nansum(EarthLandArea_05deg(...
                Pr(:,:,ii)<Threshold.Pr(:,:,i_month) & SM(:,:,ii)<Threshold.SM(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % Compound Drought3: Hyd&Agr Co-occurrence
            DroughtExtent_Month.CompoundDrought3(i_GCM,ii) = nansum(EarthLandArea_05deg(...
                Q(:,:,ii)<Threshold.Q(:,:,i_month) & SM(:,:,ii)<Threshold.SM(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
            % Compound Drought: Met&Hyd&Agr Co-occurrence
            DroughtExtent_Month.CompoundDrought(i_GCM,ii) = nansum(EarthLandArea_05deg(...
                Pr(:,:,ii)<Threshold.Pr(:,:,i_month) & Q(:,:,ii)<Threshold.Q(:,:,i_month) & SM(:,:,ii)<Threshold.SM(:,:,i_month)))...
                ./nansum(EarthLandArea_05deg(~isnan(landmask_05deg))) .* 100;
        end
        clear ii i_month
        % Monthly Drought Extent to Yearly
        iii = 1;
        for ii = 1 : 12 : size(DroughtExtent_Month.Pr,2)
            A = DroughtExtent_Month.Pr(i_GCM,ii:ii+11);
            DroughtExtent_Year.Pr(i_GCM,iii) = nanmean(A);
            B = DroughtExtent_Month.Q(i_GCM,ii:ii+11);
            DroughtExtent_Year.Q(i_GCM,iii) = nanmean(B);
            C = DroughtExtent_Month.SM(i_GCM,ii:ii+11);
            DroughtExtent_Year.SM(i_GCM,iii) = nanmean(C);
            BB = DroughtExtent_Month.CompoundDrought1(i_GCM,ii:ii+11);
            DroughtExtent_Year.CompoundDrought1(i_GCM,iii) = nanmean(BB);
            CC = DroughtExtent_Month.CompoundDrought2(i_GCM,ii:ii+11);
            DroughtExtent_Year.CompoundDrought2(i_GCM,iii) = nanmean(CC);
            DD = DroughtExtent_Month.CompoundDrought3(i_GCM,ii:ii+11);
            DroughtExtent_Year.CompoundDrought3(i_GCM,iii) = nanmean(DD);
            EE = DroughtExtent_Month.CompoundDrought(i_GCM,ii:ii+11);
            DroughtExtent_Year.CompoundDrought(i_GCM,iii) = nanmean(EE);
            
            clear A B C AA BB CC DD EE
            iii = iii+1;
        end
        clear ii iii;
        
        %% (1.1.3) Drought Frequency Analysis
        % Frequency records whether (1 or 0) Variables < Threshold for every month
        for ii = 1 : size( Pr , 3)
            if mod(ii,12)~=0
                i_month = mod(ii,12);
            else
                i_month = 12;
            end
            Frequency.Pr(:,:,ii) = Pr(:,:,ii) < Threshold.Pr(:,:,i_month);
            Frequency.Q(:,:,ii) = Q(:,:,ii) < Threshold.Q(:,:,i_month);
            Frequency.SM(:,:,ii) = SM(:,:,ii) < Threshold.SM(:,:,i_month);
            % Compound Drought1: Met&Hyd Co-occurrence
            Frequency.CompoundDrought1(:,:,ii) = Pr(:,:,ii) < Threshold.Pr(:,:,i_month) & Q(:,:,ii) < Threshold.Q(:,:,i_month);
            % Compound Drought2: Met&Agr Co-occurrence
            Frequency.CompoundDrought2(:,:,ii) = Pr(:,:,ii) < Threshold.Pr(:,:,i_month) & SM(:,:,ii) < Threshold.SM(:,:,i_month);
            % Compound Drought3: Hyd&Agr Co-occurrence
            Frequency.CompoundDrought3(:,:,ii) = Q(:,:,ii) < Threshold.Q(:,:,i_month) & SM(:,:,ii) < Threshold.SM(:,:,i_month);
            % Compound Drought: Met&Hyd&Agr Co-occurrence
            Frequency.CompoundDrought(:,:,ii) = Pr(:,:,ii) < Threshold.Pr(:,:,i_month) & Q(:,:,ii) < Threshold.Q(:,:,i_month) & SM(:,:,ii) < Threshold.SM(:,:,i_month);
        end
        clear ii i_month
        % Drought Frequency: GridYear (how many months under drought conditions for every year)
        iii = 1;
        for ii = 1 : 12 : size(Frequency.Pr,3)
            A = Frequency.Pr(:,:,ii:ii+11);
            GridYear.Pr(:,:,iii) = nansum(A,3).*landmask_05deg;
            B = Frequency.Q(:,:,ii:ii+11);
            GridYear.Q(:,:,iii) = nansum(B,3).*landmask_05deg;
            C = Frequency.SM(:,:,ii:ii+11);
            GridYear.SM(:,:,iii) = nansum(C,3).*landmask_05deg;
            BB = Frequency.CompoundDrought1(:,:,ii:ii+11);
            GridYear.CompoundDrought1(:,:,iii) = nansum(BB,3).*landmask_05deg;
            CC = Frequency.CompoundDrought2(:,:,ii:ii+11);
            GridYear.CompoundDrought2(:,:,iii) = nansum(CC,3).*landmask_05deg;
            DD = Frequency.CompoundDrought3(:,:,ii:ii+11);
            GridYear.CompoundDrought3(:,:,iii) = nansum(DD,3).*landmask_05deg;
            EE = Frequency.CompoundDrought(:,:,ii:ii+11);
            GridYear.CompoundDrought(:,:,iii) = nansum(EE,3).*landmask_05deg;
            
            clear A B C AA
            iii = iii+1;
        end
        clear ii iii Frequency
        % Yearly Grid to global mean Yearly series : DroughtFrequency_GMYear
        for ii = 1 : size(GridYear.Pr , 3)
            A = GridYear.Pr(:,:,ii); DroughtFrequency_GMYear.Pr(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.Q(:,:,ii); DroughtFrequency_GMYear.Q(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.SM(:,:,ii); DroughtFrequency_GMYear.SM(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CompoundDrought1(:,:,ii); DroughtFrequency_GMYear.CompoundDrought1(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CompoundDrought2(:,:,ii); DroughtFrequency_GMYear.CompoundDrought2(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CompoundDrought3(:,:,ii); DroughtFrequency_GMYear.CompoundDrought3(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CompoundDrought(:,:,ii); DroughtFrequency_GMYear.CompoundDrought(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii Pr Q SM
        DroughtFrequency_Year = GridYear; clear GridYear;
        % Save DroughtFrequency_Year to calculate Ensemble Mean
        All_DroughtFrequency_Year.Pr(:,:,:,i_GCM) = DroughtFrequency_Year.Pr;
        All_DroughtFrequency_Year.Q(:,:,:,i_GCM) = DroughtFrequency_Year.Q;
        All_DroughtFrequency_Year.SM(:,:,:,i_GCM) = DroughtFrequency_Year.SM;
        All_DroughtFrequency_Year.CompoundDrought1(:,:,:,i_GCM) = DroughtFrequency_Year.CompoundDrought1;
        All_DroughtFrequency_Year.CompoundDrought2(:,:,:,i_GCM) = DroughtFrequency_Year.CompoundDrought2;
        All_DroughtFrequency_Year.CompoundDrought3(:,:,:,i_GCM) = DroughtFrequency_Year.CompoundDrought3;
        All_DroughtFrequency_Year.CompoundDrought(:,:,:,i_GCM) = DroughtFrequency_Year.CompoundDrought;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputDroughtPath{i_Path} , GCM , '_DroughtFrequency_Year') , 'DroughtFrequency_Year');
        clear DroughtFrequency_Year GCM
    end
    clear i_GCM
    % save monthly drought extent
    save(strcat(OutputDroughtPath{i_Path} , 'DroughtExtent_Month') , 'DroughtExtent_Month');
    clear DroughtExtent_Month
    % save yearly drought extent
    save(strcat(OutputDroughtPath{i_Path} , 'DroughtExtent_Year') , 'DroughtExtent_Year');
    clear DroughtExtent_Year
    % save global mean yearly drought frequency
    save(strcat(OutputDroughtPath{i_Path} , 'DroughtFrequency_GMYear') , 'DroughtFrequency_GMYear');
    clear DroughtFrequency_GMYear
    % save ensemble mean DroughtFrequency_Year
    Ensemble_Mean_DroughtFrequency_Year.Pr = nanmean(All_DroughtFrequency_Year.Pr,4);
    Ensemble_Mean_DroughtFrequency_Year.Q = nanmean(All_DroughtFrequency_Year.Q,4);
    Ensemble_Mean_DroughtFrequency_Year.SM = nanmean(All_DroughtFrequency_Year.SM,4);
    Ensemble_Mean_DroughtFrequency_Year.CompoundDrought1 = nanmean(All_DroughtFrequency_Year.CompoundDrought1,4);
    Ensemble_Mean_DroughtFrequency_Year.CompoundDrought2 = nanmean(All_DroughtFrequency_Year.CompoundDrought2,4);
    Ensemble_Mean_DroughtFrequency_Year.CompoundDrought3 = nanmean(All_DroughtFrequency_Year.CompoundDrought3,4);
    Ensemble_Mean_DroughtFrequency_Year.CompoundDrought = nanmean(All_DroughtFrequency_Year.CompoundDrought,4);
    
    save(strcat(OutputDroughtPath{i_Path} , 'Ensemble_Mean_DroughtFrequency_Year') , 'Ensemble_Mean_DroughtFrequency_Year');
    clear Ensemble_Mean_DroughtFrequency_Year All_DroughtFrequency_Year
end
