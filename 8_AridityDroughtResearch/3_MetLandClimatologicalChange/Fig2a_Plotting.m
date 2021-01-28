function Fig2a_Plotting(GridAI_Princeton_CMIP , Path_Fig2_Output)
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridAI_Princeton_CMIP(1).Ensemble_AI.pr , 3)
    % Princeton pr
    A = GridAI_Princeton_CMIP(1).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(1).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(1).Ensemble_AI.pr(: , : , ii) = [B;A];
end
for ii = 1 : size(GridAI_Princeton_CMIP(2).Ensemble_AI.pr , 3)
    % ssp126 pr
    A = GridAI_Princeton_CMIP(2).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(2).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(2).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp245 pr
    A = GridAI_Princeton_CMIP(3).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(3).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(3).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp370 pr
    A = GridAI_Princeton_CMIP(4).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(4).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(4).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp585 pr
    A = GridAI_Princeton_CMIP(5).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(5).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(5).Ensemble_AI.pr(: , : , ii) = [B;A];
end
for ii = 1 : size(GridAI_Princeton_CMIP(6).Ensemble_AI.pr , 3)
    % Historical pr
    A = GridAI_Princeton_CMIP(6).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(6).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(6).Ensemble_AI.pr(: , : , ii) = [B;A];
end
clear ii A B
clear ii A B

%% (2) linear regression of AI calculated by [Princeton 1948-2014]
% pr (mm/year)
Pr_Princeton =  GridAI_Princeton_CMIP(1).Ensemble_AI.pr;
for i_lon = 1 : size(Pr_Princeton,1)
    for i_lat = 1 : size(Pr_Princeton,2)
        if ~isnan(Pr_Princeton(i_lon , i_lat , 1))
            Y = Pr_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_Pr_Princeton_Year(i_lon,i_lat) = b(2);
            p_Pr_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_Pr_Princeton_Year(i_lon,i_lat) = nan;
            p_Pr_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_Pr_Princeton_Year(isnan(k_Pr_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig2_Output 'k_Pr_Princeton'],extent,k_Pr_Princeton_Year');
p_Pr_Princeton_Year(isnan(p_Pr_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig2_Output 'p_Pr_Princeton'],extent,p_Pr_Princeton_Year');
clear k_Pr_Princeton_Year p_Pr_Princeton_Year Pr_Princeton

%% (3) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % pr (mm/year)
    Pr_CMIP =  GridAI_Princeton_CMIP(i_ssp+1).Ensemble_AI.pr;
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
    SaveData2GeoTIFF([Path_Fig2_Output 'k_Pr_' ssp{i_ssp}],extent,k_Pr_CMIP_Year');
    p_Pr_CMIP_Year(isnan(p_Pr_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig2_Output 'p_Pr_' ssp{i_ssp}],extent,p_Pr_CMIP_Year');
    clear k_Pr_CMIP_Year p_Pr_CMIP_Year Pr_CMIP
end

%% (4) linear regression of AI calculated by CMIP historical experiments
% pr (mm/year)
Pr_CMIP =  GridAI_Princeton_CMIP(6).Ensemble_AI.pr;
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
SaveData2GeoTIFF([Path_Fig2_Output 'k_Pr_Historical'],extent,k_Pr_CMIP_Year');
p_Pr_CMIP_Year(isnan(p_Pr_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig2_Output 'p_Pr_Historical'],extent,p_Pr_CMIP_Year');
clear k_Pr_CMIP_Year p_Pr_CMIP_Year Pr_CMIP
end
