function Fig3_Plotting(GridMet_Land_CMIP , Path_Fig3_Output)
%% Pr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Pr , 3)
    % ssp126 Pr
    A = GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Pr(1:360 , : , ii);
    B = GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Pr(361:end , : , ii);
    GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Pr(: , : , ii) = [B;A];
    % ssp245 Pr
    A = GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Pr(1:360 , : , ii);
    B = GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Pr(361:end , : , ii);
    GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Pr(: , : , ii) = [B;A];
    % ssp370 Pr
    A = GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Pr(1:360 , : , ii);
    B = GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Pr(361:end , : , ii);
    GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Pr(: , : , ii) = [B;A];
    % ssp585 Pr
    A = GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Pr(1:360 , : , ii);
    B = GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Pr(361:end , : , ii);
    GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Pr(: , : , ii) = [B;A];
end
for ii = 1 : size(GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr , 3)
    % Pr
    A = GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr(1:360 , : , ii);
    B = GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr(361:end , : , ii);
    GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr(: , : , ii) = [B;A];
end

%% (2) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % Pr
    Pr_CMIP =  GridMet_Land_CMIP(i_ssp).Ensemble_Mean_DroughtFrequency_Year.Pr;
    for i_lon = 1 : size(Pr_CMIP,1)
        for i_lat = 1 : size(Pr_CMIP,2)
            if ~isnan(Pr_CMIP(i_lon , i_lat , 1))
                Y = Pr_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_Pr_CMIP_Year(i_lon,i_lat) = b(2);
                p_Pr_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_Pr_CMIP_Year(i_lon,i_lat) = nan;
                p_Pr_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    k_Pr_CMIP_Year(isnan(k_Pr_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'k_Pr_' ssp{i_ssp}],extent,k_Pr_CMIP_Year');
    p_Pr_CMIP_Year(isnan(p_Pr_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'p_Pr_' ssp{i_ssp}],extent,p_Pr_CMIP_Year');
    clear k_Pr_CMIP_Year p_Pr_CMIP_Year Pr_CMIP
end

%% (3) linear regression of AI calculated by CMIP historical experiments
% Pr
Pr_CMIP =  GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr;
for i_lon = 1 : size(Pr_CMIP,1)
    for i_lat = 1 : size(Pr_CMIP,2)
        if ~isnan(Pr_CMIP(i_lon , i_lat , 1))
            Y = Pr_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_Pr_CMIP_Year(i_lon,i_lat) = b(2);
            p_Pr_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_Pr_CMIP_Year(i_lon,i_lat) = nan;
            p_Pr_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_Pr_CMIP_Year(isnan(k_Pr_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_Pr_Historical'],extent,k_Pr_CMIP_Year');
p_Pr_CMIP_Year(isnan(p_Pr_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_Pr_Historical'],extent,p_Pr_CMIP_Year');
clear k_Pr_CMIP_Year p_Pr_CMIP_Year Pr_CMIP
clearvars -except GridMet_Land_CMIP Path_Fig3_Output

%% Q %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Q , 3)
    % ssp126 Q
    A = GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Q(1:360 , : , ii);
    B = GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Q(361:end , : , ii);
    GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Q(: , : , ii) = [B;A];
    % ssp245 Q
    A = GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Q(1:360 , : , ii);
    B = GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Q(361:end , : , ii);
    GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Q(: , : , ii) = [B;A];
    % ssp370 Q
    A = GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Q(1:360 , : , ii);
    B = GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Q(361:end , : , ii);
    GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Q(: , : , ii) = [B;A];
    % ssp585 Q
    A = GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Q(1:360 , : , ii);
    B = GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Q(361:end , : , ii);
    GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Q(: , : , ii) = [B;A];
end
for ii = 1 : size(GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Q , 3)
    % Q
    A = GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Q(1:360 , : , ii);
    B = GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Q(361:end , : , ii);
    GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Q(: , : , ii) = [B;A];
end

%% (2) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % Q
    Q_CMIP =  GridMet_Land_CMIP(i_ssp).Ensemble_Mean_DroughtFrequency_Year.Q;
    for i_lon = 1 : size(Q_CMIP,1)
        for i_lat = 1 : size(Q_CMIP,2)
            if ~isnan(Q_CMIP(i_lon , i_lat , 1))
                Y = Q_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_Q_CMIP_Year(i_lon,i_lat) = b(2);
                p_Q_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_Q_CMIP_Year(i_lon,i_lat) = nan;
                p_Q_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    k_Q_CMIP_Year(isnan(k_Q_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'k_Q_' ssp{i_ssp}],extent,k_Q_CMIP_Year');
    p_Q_CMIP_Year(isnan(p_Q_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'p_Q_' ssp{i_ssp}],extent,p_Q_CMIP_Year');
    clear k_Q_CMIP_Year p_Q_CMIP_Year Q_CMIP
end

%% (3) linear regression of AI calculated by CMIP historical experiments
% Q
Q_CMIP =  GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Q;
for i_lon = 1 : size(Q_CMIP,1)
    for i_lat = 1 : size(Q_CMIP,2)
        if ~isnan(Q_CMIP(i_lon , i_lat , 1))
            Y = Q_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_Q_CMIP_Year(i_lon,i_lat) = b(2);
            p_Q_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_Q_CMIP_Year(i_lon,i_lat) = nan;
            p_Q_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_Q_CMIP_Year(isnan(k_Q_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_Q_Historical'],extent,k_Q_CMIP_Year');
p_Q_CMIP_Year(isnan(p_Q_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_Q_Historical'],extent,p_Q_CMIP_Year');
clear k_Q_CMIP_Year p_Q_CMIP_Year Q_CMIP
clearvars -except GridMet_Land_CMIP Path_Fig3_Output

%% SM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SM , 3)
    % ssp126 SM
    A = GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SM(1:360 , : , ii);
    B = GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SM(361:end , : , ii);
    GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.SM(: , : , ii) = [B;A];
    % ssp245 SM
    A = GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SM(1:360 , : , ii);
    B = GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SM(361:end , : , ii);
    GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.SM(: , : , ii) = [B;A];
    % ssp370 SM
    A = GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SM(1:360 , : , ii);
    B = GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SM(361:end , : , ii);
    GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.SM(: , : , ii) = [B;A];
    % ssp585 SM
    A = GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SM(1:360 , : , ii);
    B = GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SM(361:end , : , ii);
    GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.SM(: , : , ii) = [B;A];
end
for ii = 1 : size(GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SM , 3)
    % SM
    A = GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SM(1:360 , : , ii);
    B = GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SM(361:end , : , ii);
    GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SM(: , : , ii) = [B;A];
end

%% (2) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % SM
    SM_CMIP =  GridMet_Land_CMIP(i_ssp).Ensemble_Mean_DroughtFrequency_Year.SM;
    for i_lon = 1 : size(SM_CMIP,1)
        for i_lat = 1 : size(SM_CMIP,2)
            if ~isnan(SM_CMIP(i_lon , i_lat , 1))
                Y = SM_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_SM_CMIP_Year(i_lon,i_lat) = b(2);
                p_SM_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_SM_CMIP_Year(i_lon,i_lat) = nan;
                p_SM_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    k_SM_CMIP_Year(isnan(k_SM_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'k_SM_' ssp{i_ssp}],extent,k_SM_CMIP_Year');
    p_SM_CMIP_Year(isnan(p_SM_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'p_SM_' ssp{i_ssp}],extent,p_SM_CMIP_Year');
    clear k_SM_CMIP_Year p_SM_CMIP_Year SM_CMIP
end

%% (3) linear regression of AI calculated by CMIP historical experiments
% SM
SM_CMIP =  GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.SM;
for i_lon = 1 : size(SM_CMIP,1)
    for i_lat = 1 : size(SM_CMIP,2)
        if ~isnan(SM_CMIP(i_lon , i_lat , 1))
            Y = SM_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_SM_CMIP_Year(i_lon,i_lat) = b(2);
            p_SM_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_SM_CMIP_Year(i_lon,i_lat) = nan;
            p_SM_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_SM_CMIP_Year(isnan(k_SM_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_SM_Historical'],extent,k_SM_CMIP_Year');
p_SM_CMIP_Year(isnan(p_SM_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_SM_Historical'],extent,p_SM_CMIP_Year');
clear k_SM_CMIP_Year p_SM_CMIP_Year SM_CMIP
clearvars -except GridMet_Land_CMIP Path_Fig3_Output

%% Pr_ET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Pr_ET , 3)
    % ssp126 Pr_ET
    A = GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(1:360 , : , ii);
    B = GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(361:end , : , ii);
    GridMet_Land_CMIP(1).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(: , : , ii) = [B;A];
    % ssp245 Pr_ET
    A = GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(1:360 , : , ii);
    B = GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(361:end , : , ii);
    GridMet_Land_CMIP(2).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(: , : , ii) = [B;A];
    % ssp370 Pr_ET
    A = GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(1:360 , : , ii);
    B = GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(361:end , : , ii);
    GridMet_Land_CMIP(3).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(: , : , ii) = [B;A];
    % ssp585 Pr_ET
    A = GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(1:360 , : , ii);
    B = GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(361:end , : , ii);
    GridMet_Land_CMIP(4).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(: , : , ii) = [B;A];
end
for ii = 1 : size(GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr_ET , 3)
    % Pr_ET
    A = GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(1:360 , : , ii);
    B = GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(361:end , : , ii);
    GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr_ET(: , : , ii) = [B;A];
end

%% (2) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % Pr_ET
    Pr_ET_CMIP =  GridMet_Land_CMIP(i_ssp).Ensemble_Mean_DroughtFrequency_Year.Pr_ET;
    for i_lon = 1 : size(Pr_ET_CMIP,1)
        for i_lat = 1 : size(Pr_ET_CMIP,2)
            if ~isnan(Pr_ET_CMIP(i_lon , i_lat , 1))
                Y = Pr_ET_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_Pr_ET_CMIP_Year(i_lon,i_lat) = b(2);
                p_Pr_ET_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_Pr_ET_CMIP_Year(i_lon,i_lat) = nan;
                p_Pr_ET_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    k_Pr_ET_CMIP_Year(isnan(k_Pr_ET_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'k_Pr_ET_' ssp{i_ssp}],extent,k_Pr_ET_CMIP_Year');
    p_Pr_ET_CMIP_Year(isnan(p_Pr_ET_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'p_Pr_ET_' ssp{i_ssp}],extent,p_Pr_ET_CMIP_Year');
    clear k_Pr_ET_CMIP_Year p_Pr_ET_CMIP_Year Pr_ET_CMIP
end

%% (3) linear regression of AI calculated by CMIP historical experiments
% Pr_ET
Pr_ET_CMIP =  GridMet_Land_CMIP(5).Ensemble_Mean_DroughtFrequency_Year.Pr_ET;
for i_lon = 1 : size(Pr_ET_CMIP,1)
    for i_lat = 1 : size(Pr_ET_CMIP,2)
        if ~isnan(Pr_ET_CMIP(i_lon , i_lat , 1))
            Y = Pr_ET_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_Pr_ET_CMIP_Year(i_lon,i_lat) = b(2);
            p_Pr_ET_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_Pr_ET_CMIP_Year(i_lon,i_lat) = nan;
            p_Pr_ET_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_Pr_ET_CMIP_Year(isnan(k_Pr_ET_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_Pr_ET_Historical'],extent,k_Pr_ET_CMIP_Year');
p_Pr_ET_CMIP_Year(isnan(p_Pr_ET_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_Pr_ET_Historical'],extent,p_Pr_ET_CMIP_Year');
clear k_Pr_ET_CMIP_Year p_Pr_ET_CMIP_Year Pr_ET_CMIP
clearvars -except GridMet_Land_CMIP Path_Fig3_Output
end
