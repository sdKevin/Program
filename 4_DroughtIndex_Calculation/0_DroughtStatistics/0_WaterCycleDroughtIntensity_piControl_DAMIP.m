%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Drought analysis using CMIP Met&Land Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
                for i_month = 1 : 12 % Each Grid has 12 Cumulative Distribution Function (CDF) for each month
                    All_Month = size(Pr_ref,3);
                    if nansum(isnan(Q_ref(ii,iii,i_month:12:All_Month)))==0
                        % Pr
                        A = Pr_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        if B(ceil(length(B)*0.1))<=0 | isnan(B(ceil(length(B)*0.1)))
                            CDF.Pr(ii,iii,i_month) = {nan}; % ignore girds where 10th Percentile = 0
                        else
                            B(B<=0) = min(B(B>0)); % For satisfying positive restriction in ksdensity function
                            % Kernal Density Function
                            % warning('')
                            % [Bi , Fb , bw] = ksdensity(B , [0.01:0.01:0.99] , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            % [warnMsg, warnId] = lastwarn; % Warning means bad icdf estimations, thus adjusting bandwidth
                            % if ~isempty(warnMsg)
                            % while ~isempty(warnMsg)
                            %     warning('')
                            %     [Bi , Fb , bw] = ksdensity(B , [0.01:0.01:0.99] , 'BandWidth' , 5*bw , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            %     [warnMsg, warnId] = lastwarn;
                            % end
                            %     figure; ecdf(B); hold on; plot(Bi,Fb); title(strcat('PrGrid:',num2str(ii),'and',num2str(iii)));
                            % end
                            % CDF.Pr(ii,iii,i_month) = {Bi(1:99)}; clear B Bi Fb bw warnMsg warnId; % 10th Percentile
                            
                            % A Quick Approximation of Kernal Density Function
                            CDF.Pr(ii,iii,i_month) = {B(ceil(length(B)*[0.01:0.01:0.99]))'}; clear B; % 10th Percentile
                        end
                        
                        % Q
                        A = Q_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        if B(ceil(length(B)*0.1))<=0 | isnan(B(ceil(length(B)*0.1)))
                            CDF.Q(ii,iii,i_month) = {nan}; % ignore girds where 10th Percentile = 0
                        else
                            B(B<=0) = min(B(B>0)); % For satisfying positive restriction in ksdensity function
                            % Kernal Density Function
                            % warning('')
                            % [Bi , Fb , bw] = ksdensity(B , [0.01:0.01:0.99] , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            % [warnMsg, warnId] = lastwarn; % Warning means bad icdf estimations, thus adjusting bandwidth
                            % if ~isempty(warnMsg)
                            % while ~isempty(warnMsg)
                            %     warning('')
                            %     [Bi , Fb , bw] = ksdensity(B , [0.01:0.01:0.99] , 'BandWidth' , 5*bw , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            %     [warnMsg, warnId] = lastwarn;
                            % end
                            %     figure; ecdf(B); hold on; plot(Bi,Fb); title(strcat('QGrid:',num2str(ii),'and',num2str(iii)));
                            % end
                            % CDF.Q(ii,iii,i_month) = {Bi(1:99)}; clear B Bi Fb bw warnMsg warnId; % 10th Percentile
                            
                            % A Quick Approximation of Kernal Density Function
                            CDF.Q(ii,iii,i_month) = {B(ceil(length(B)*[0.01:0.01:0.99]))'}; clear B; % 10th Percentile
                        end
                        
                        % SM
                        A = SM_ref(ii,iii,i_month:12:All_Month); B = sort(A(:)); clear A;
                        if B(ceil(length(B)*0.1))<=0 | isnan(B(ceil(length(B)*0.1)))
                            CDF.SM(ii,iii,i_month) = {nan}; % ignore girds where 10th Percentile = 0
                        else
                            B(B<=0) = min(B(B>0)); % For satisfying positive restriction in ksdensity function
                            % Kernal Density Function
                            % warning('')
                            % [Bi , Fb , bw] = ksdensity(B , [0.01:0.01:0.99] , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            % [warnMsg, warnId] = lastwarn; % Warning means bad icdf estimations, thus adjusting bandwidth
                            % if ~isempty(warnMsg)
                            % while ~isempty(warnMsg)
                            %     warning('')
                            %     [Bi , Fb , bw] = ksdensity(B , [0.01:0.01:0.99] , 'BandWidth' , 5*bw , 'support' , 'positive' , 'BoundaryCorrection' , 'reflection' , 'function' , 'icdf'); % Kernel Density
                            %     [warnMsg, warnId] = lastwarn;
                            % end
                            %     figure; ecdf(B); hold on; plot(Bi,Fb); title(strcat('SMGrid:',num2str(ii),'and',num2str(iii)));
                            % end
                            % CDF.SM(ii,iii,i_month) = {Bi(1:99)}; clear B Bi Fb bw warnMsg warnId; % 10th Percentile
                            
                            % A Quick Approximation of Kernal Density Function
                            CDF.SM(ii,iii,i_month) = {B(ceil(length(B)*[0.01:0.01:0.99]))'}; clear B; % 10th Percentile
                        end
                        
                    else
                        CDF.Pr(ii,iii,i_month) = {nan};
                        CDF.Q(ii,iii,i_month) = {nan};
                        CDF.SM(ii,iii,i_month) = {nan};
                    end
                end
            end
        end
        clear ii iii Pr_ref Q_ref SM_ref i_month All_Month
        
        %% (1.1.2) Drought Intensity Analysis
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
            for iii = 1 : size( Pr , 1)
                for iiii = 1 : size( Pr , 2)
                    % Pr
                    if isnan(Pr(iii,iiii,ii))
                        Intensity.Pr(iii,iiii,ii) = nan;
                    else
                        [~,I]=min(abs(CDF.Pr{iii,iiii,i_month}-Pr(iii,iiii,ii)));
                        Intensity.Pr(iii,iiii,ii) = 0.01 * I; clear I;
                    end
                    % Q
                    if isnan(Q(iii,iiii,ii))
                        Intensity.Q(iii,iiii,ii) = nan;
                    else
                        [~,I]=min(abs(CDF.Q{iii,iiii,i_month}-Q(iii,iiii,ii)));
                        Intensity.Q(iii,iiii,ii) = 0.01 * I; clear I;
                    end
                    % SM
                    if isnan(SM(iii,iiii,ii))
                        Intensity.SM(iii,iiii,ii) = nan;
                    else
                        [~,I]=min(abs(CDF.SM{iii,iiii,i_month}-SM(iii,iiii,ii)));
                        Intensity.SM(iii,iiii,ii) = 0.01 * I; clear I;
                    end
                    % Compound Drought1: Met&Hyd Co-occurrence
                    if Intensity.Pr(iii,iiii,ii)<=0.1 & Intensity.Q(iii,iiii,ii)<=0.1
                        Intensity.CompoundDrought1(iii,iiii,ii) = 0.1 - mean([Intensity.Pr(iii,iiii,ii),Intensity.Q(iii,iiii,ii)]);
                    else
                        Intensity.CompoundDrought1(iii,iiii,ii) = nan;
                    end
                    % Compound Drought2: Met&Agr Co-occurrence
                    if Intensity.Pr(iii,iiii,ii)<=0.1 & Intensity.SM(iii,iiii,ii)<=0.1
                        Intensity.CompoundDrought2(iii,iiii,ii) = 0.1 - mean([Intensity.Pr(iii,iiii,ii),Intensity.SM(iii,iiii,ii)]);
                    else
                        Intensity.CompoundDrought2(iii,iiii,ii) = nan;
                    end
                    % Compound Drought3: Hyd&Agr Co-occurrence
                    if Intensity.Q(iii,iiii,ii)<=0.1 & Intensity.SM(iii,iiii,ii)<=0.1
                        Intensity.CompoundDrought3(iii,iiii,ii) = 0.1 - mean([Intensity.Q(iii,iiii,ii),Intensity.SM(iii,iiii,ii)]);
                    else
                        Intensity.CompoundDrought3(iii,iiii,ii) = nan;
                    end
                    % Compound Drought: Met&Hyd&Agr Co-occurrence
                    if Intensity.Pr(iii,iiii,ii)<=0.1 & Intensity.Q(iii,iiii,ii)<=0.1 & Intensity.SM(iii,iiii,ii)<=0.1
                        Intensity.CompoundDrought(iii,iiii,ii) = 0.1 - mean([Intensity.Pr(iii,iiii,ii),Intensity.Q(iii,iiii,ii),Intensity.SM(iii,iiii,ii)]);
                    else
                        Intensity.CompoundDrought(iii,iiii,ii) = nan;
                    end
                end
            end
            ii
        end
        clear ii iii iiii i_month CDF
        % Drought Intensity: GridYear (averaging intensity for months under dought for every year)
        iii = 1;
        for ii = 1 : 12 : size(Intensity.Pr,3)
            A = Intensity.Pr(:,:,ii:ii+11); A(A>0.1) = nan;
            GridYear.Pr(:,:,iii) = nanmean(A,3).*landmask_05deg;
            B = Intensity.Q(:,:,ii:ii+11); B(B>0.1) = nan;
            GridYear.Q(:,:,iii) = nanmean(B,3).*landmask_05deg;
            C = Intensity.SM(:,:,ii:ii+11); C(C>0.1) = nan;
            GridYear.SM(:,:,iii) = nanmean(C,3).*landmask_05deg;
            BB = Intensity.CompoundDrought1(:,:,ii:ii+11);
            GridYear.CompoundDrought1(:,:,iii) = nanmean(BB,3).*landmask_05deg;
            CC = Intensity.CompoundDrought2(:,:,ii:ii+11);
            GridYear.CompoundDrought2(:,:,iii) = nanmean(CC,3).*landmask_05deg;
            DD = Intensity.CompoundDrought3(:,:,ii:ii+11);
            GridYear.CompoundDrought3(:,:,iii) = nanmean(DD,3).*landmask_05deg;
            EE = Intensity.CompoundDrought(:,:,ii:ii+11);
            GridYear.CompoundDrought(:,:,iii) = nanmean(EE,3).*landmask_05deg;
            
            clear A B C AA BB CC DD EE
            iii = iii+1;
        end
        clear ii iii
        % Yearly Grid to global mean Yearly series : DroughtIntensity_GMYear
        for ii = 1 : size(GridYear.Pr , 3)
            A = GridYear.Pr(:,:,ii); DroughtIntensity_GMYear.Pr(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.Q(:,:,ii); DroughtIntensity_GMYear.Q(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.SM(:,:,ii); DroughtIntensity_GMYear.SM(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CompoundDrought1(:,:,ii); DroughtIntensity_GMYear.CompoundDrought1(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CompoundDrought2(:,:,ii); DroughtIntensity_GMYear.CompoundDrought2(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CompoundDrought3(:,:,ii); DroughtIntensity_GMYear.CompoundDrought3(i_GCM , ii) = nanmean(A(:)); clear A;
            A = GridYear.CompoundDrought(:,:,ii); DroughtIntensity_GMYear.CompoundDrought(i_GCM , ii) = nanmean(A(:)); clear A;
        end
        clear ii Pr Q SM
        DroughtIntensity_Year = GridYear; clear GridYear;
        DroughtIntensity_Month = Intensity; clear Intensity;
        % Save DroughtIntensity_Year to calculate Ensemble Mean
        All_DroughtIntensity_Year.Pr(:,:,:,i_GCM) = DroughtIntensity_Year.Pr;
        All_DroughtIntensity_Year.Q(:,:,:,i_GCM) = DroughtIntensity_Year.Q;
        All_DroughtIntensity_Year.SM(:,:,:,i_GCM) = DroughtIntensity_Year.SM;
        All_DroughtIntensity_Year.CompoundDrought1(:,:,:,i_GCM) = DroughtIntensity_Year.CompoundDrought1;
        All_DroughtIntensity_Year.CompoundDrought2(:,:,:,i_GCM) = DroughtIntensity_Year.CompoundDrought2;
        All_DroughtIntensity_Year.CompoundDrought3(:,:,:,i_GCM) = DroughtIntensity_Year.CompoundDrought3;
        All_DroughtIntensity_Year.CompoundDrought(:,:,:,i_GCM) = DroughtIntensity_Year.CompoundDrought;
        %% (1.2) Output GridYear from 1850-2100
        save(strcat(OutputDroughtPath{i_Path} , GCM , '_DroughtIntensity_Month') , 'DroughtIntensity_Month');
        save(strcat(OutputDroughtPath{i_Path} , GCM , '_DroughtIntensity_Year') , 'DroughtIntensity_Year');
        clear DroughtIntensity_Month DroughtIntensity_Year GCM
    end
    clear i_GCM
    % save global mean yearly drought intensity
    save(strcat(OutputDroughtPath{i_Path} , 'DroughtIntensity_GMYear') , 'DroughtIntensity_GMYear');
    clear DroughtIntensity_GMYear
    % save ensemble mean DroughtIntensity_Year
    Ensemble_Mean_DroughtIntensity_Year.Pr = nanmean(All_DroughtIntensity_Year.Pr,4);
    Ensemble_Mean_DroughtIntensity_Year.Q = nanmean(All_DroughtIntensity_Year.Q,4);
    Ensemble_Mean_DroughtIntensity_Year.SM = nanmean(All_DroughtIntensity_Year.SM,4);
    Ensemble_Mean_DroughtIntensity_Year.CompoundDrought1 = nanmean(All_DroughtIntensity_Year.CompoundDrought1,4);
    Ensemble_Mean_DroughtIntensity_Year.CompoundDrought2 = nanmean(All_DroughtIntensity_Year.CompoundDrought2,4);
    Ensemble_Mean_DroughtIntensity_Year.CompoundDrought3 = nanmean(All_DroughtIntensity_Year.CompoundDrought3,4);
    Ensemble_Mean_DroughtIntensity_Year.CompoundDrought = nanmean(All_DroughtIntensity_Year.CompoundDrought,4);
    
    save(strcat(OutputDroughtPath{i_Path} , 'Ensemble_Mean_DroughtIntensity_Year') , 'Ensemble_Mean_DroughtIntensity_Year');
    clear Ensemble_Mean_DroughtIntensity_Year All_DroughtIntensity_Year
end