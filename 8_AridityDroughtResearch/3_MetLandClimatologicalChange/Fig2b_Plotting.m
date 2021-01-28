function Fig2b_Plotting(GridQ_CMIP , Path_Fig2_Output)
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridQ_CMIP(1).Ensemble_Land_Var_Mrro , 3)
    % ssp126 Q
    A = GridQ_CMIP(1).Ensemble_Land_Var_Mrro(1:360 , : , ii);
    B = GridQ_CMIP(1).Ensemble_Land_Var_Mrro(361:end , : , ii);
    GridQ_CMIP(1).Ensemble_Land_Var_Mrro(: , : , ii) = [B;A];
    % ssp245 Q
    A = GridQ_CMIP(2).Ensemble_Land_Var_Mrro(1:360 , : , ii);
    B = GridQ_CMIP(2).Ensemble_Land_Var_Mrro(361:end , : , ii);
    GridQ_CMIP(2).Ensemble_Land_Var_Mrro(: , : , ii) = [B;A];
    % ssp370 Q
    A = GridQ_CMIP(3).Ensemble_Land_Var_Mrro(1:360 , : , ii);
    B = GridQ_CMIP(3).Ensemble_Land_Var_Mrro(361:end , : , ii);
    GridQ_CMIP(3).Ensemble_Land_Var_Mrro(: , : , ii) = [B;A];
    % ssp585 Q
    A = GridQ_CMIP(4).Ensemble_Land_Var_Mrro(1:360 , : , ii);
    B = GridQ_CMIP(4).Ensemble_Land_Var_Mrro(361:end , : , ii);
    GridQ_CMIP(4).Ensemble_Land_Var_Mrro(: , : , ii) = [B;A];
end
for ii = 1 : size(GridQ_CMIP(5).Ensemble_Land_Var_Mrro , 3)
    % Q
    A = GridQ_CMIP(5).Ensemble_Land_Var_Mrro(1:360 , : , ii);
    B = GridQ_CMIP(5).Ensemble_Land_Var_Mrro(361:end , : , ii);
    GridQ_CMIP(5).Ensemble_Land_Var_Mrro(: , : , ii) = [B;A];
end

%% (2) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % Q (kg/(m2s)) to mm/year
    Q_CMIP =  GridQ_CMIP(i_ssp).Ensemble_Land_Var_Mrro .* 1000.*31536000./997;
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
    SaveData2GeoTIFF([Path_Fig2_Output 'k_Q_' ssp{i_ssp}],extent,k_Q_CMIP_Year');
    p_Q_CMIP_Year(isnan(p_Q_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig2_Output 'p_Q_' ssp{i_ssp}],extent,p_Q_CMIP_Year');
    clear k_Q_CMIP_Year p_Q_CMIP_Year Q_CMIP
end

%% (3) linear regression of AI calculated by CMIP historical experiments
% Q (kg/(m2s)) to mm/year
Q_CMIP =  GridQ_CMIP(5).Ensemble_Land_Var_Mrro .* 1000.*31536000./997;
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
SaveData2GeoTIFF([Path_Fig2_Output 'k_Q_Historical'],extent,k_Q_CMIP_Year');
p_Q_CMIP_Year(isnan(p_Q_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig2_Output 'p_Q_Historical'],extent,p_Q_CMIP_Year');
clear k_Q_CMIP_Year p_Q_CMIP_Year Q_CMIP
end
