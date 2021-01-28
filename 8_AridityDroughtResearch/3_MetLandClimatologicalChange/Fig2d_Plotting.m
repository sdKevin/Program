function Fig2d_Plotting(GridPr_ET_CMIP , Path_Fig2_Output)
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridPr_ET_CMIP(1).Ensemble_Land_Var_Pr_Evspsbl , 3)
    % ssp126 SM
    A = GridPr_ET_CMIP(1).Ensemble_Land_Var_Pr_Evspsbl(1:360 , : , ii);
    B = GridPr_ET_CMIP(1).Ensemble_Land_Var_Pr_Evspsbl(361:end , : , ii);
    GridPr_ET_CMIP(1).Ensemble_Land_Var_Pr_Evspsbl(: , : , ii) = [B;A];
    % ssp245 SM
    A = GridPr_ET_CMIP(2).Ensemble_Land_Var_Pr_Evspsbl(1:360 , : , ii);
    B = GridPr_ET_CMIP(2).Ensemble_Land_Var_Pr_Evspsbl(361:end , : , ii);
    GridPr_ET_CMIP(2).Ensemble_Land_Var_Pr_Evspsbl(: , : , ii) = [B;A];
    % ssp370 SM
    A = GridPr_ET_CMIP(3).Ensemble_Land_Var_Pr_Evspsbl(1:360 , : , ii);
    B = GridPr_ET_CMIP(3).Ensemble_Land_Var_Pr_Evspsbl(361:end , : , ii);
    GridPr_ET_CMIP(3).Ensemble_Land_Var_Pr_Evspsbl(: , : , ii) = [B;A];
    % ssp585 SM
    A = GridPr_ET_CMIP(4).Ensemble_Land_Var_Pr_Evspsbl(1:360 , : , ii);
    B = GridPr_ET_CMIP(4).Ensemble_Land_Var_Pr_Evspsbl(361:end , : , ii);
    GridPr_ET_CMIP(4).Ensemble_Land_Var_Pr_Evspsbl(: , : , ii) = [B;A];
end
for ii = 1 : size(GridPr_ET_CMIP(5).Ensemble_Land_Var_Pr_Evspsbl , 3)
    % SM
    A = GridPr_ET_CMIP(5).Ensemble_Land_Var_Pr_Evspsbl(1:360 , : , ii);
    B = GridPr_ET_CMIP(5).Ensemble_Land_Var_Pr_Evspsbl(361:end , : , ii);
    GridPr_ET_CMIP(5).Ensemble_Land_Var_Pr_Evspsbl(: , : , ii) = [B;A];
end

%% (2) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % Pr_ET mm/year
    Pr_ET_CMIP =  GridPr_ET_CMIP(i_ssp).Ensemble_Land_Var_Pr_Evspsbl;
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
    SaveData2GeoTIFF([Path_Fig2_Output 'k_Pr_ET_' ssp{i_ssp}],extent,k_Pr_ET_CMIP_Year');
    p_Pr_ET_CMIP_Year(isnan(p_Pr_ET_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig2_Output 'p_Pr_ET_' ssp{i_ssp}],extent,p_Pr_ET_CMIP_Year');
    clear k_Pr_ET_CMIP_Year p_Pr_ET_CMIP_Year Pr_ET_CMIP
end

%% (3) linear regression of AI calculated by CMIP historical experiments
% Pr_ET mm/year
Pr_ET_CMIP =  GridPr_ET_CMIP(5).Ensemble_Land_Var_Pr_Evspsbl;
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
SaveData2GeoTIFF([Path_Fig2_Output 'k_Pr_ET_Historical'],extent,k_Pr_ET_CMIP_Year');
p_Pr_ET_CMIP_Year(isnan(p_Pr_ET_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig2_Output 'p_Pr_ET_Historical'],extent,p_Pr_ET_CMIP_Year');
clear k_Pr_ET_CMIP_Year p_Pr_ET_CMIP_Year Pr_ET_CMIP
end
