function Fig3_Plotting(GridAI_Princeton_CMIP , Path_Fig3_Output)
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC , 3)
    % ETrc_PM_RC
    A = GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % ETrc_PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % ETrc_PM_RC_CO2_Yang
    A = GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_CMIP(1).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(1).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(1).Ensemble_AI.pr(: , : , ii) = [B;A];
end
for ii = 1 : size(GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC , 3)
    % ssp126
    % PM_RC
    A = GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_CMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_CMIP(2).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(2).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(2).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp245
    % PM_RC
    A = GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_CMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_CMIP(3).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(3).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(3).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp370
    % PM_RC
    A = GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_CMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_CMIP(4).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(4).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(4).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp585
    % PM_RC
    A = GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_CMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_CMIP(5).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_CMIP(5).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_CMIP(5).Ensemble_AI.pr(: , : , ii) = [B;A];
end
clear ii A B

%% (2) linear regression of AI calculated by [Princeton 1948-2014]
% (2.1) PM_RC
AI_PM_RC_Princeton =  GridAI_Princeton_CMIP(1).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC;
for i_lon = 1 : size(AI_PM_RC_Princeton,1)
    for i_lat = 1 : size(AI_PM_RC_Princeton,2)
        if ~isnan(AI_PM_RC_Princeton(i_lon , i_lat , 1))
            Y = AI_PM_RC_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_AI_PM_RC_Princeton_Year(i_lon,i_lat) = b(2);
            p_AI_PM_RC_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_AI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
            p_AI_PM_RC_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_AI_PM_RC_Princeton_Year(isnan(k_AI_PM_RC_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_Princeton'],extent,k_AI_PM_RC_Princeton_Year');
p_AI_PM_RC_Princeton_Year(isnan(p_AI_PM_RC_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_Princeton'],extent,p_AI_PM_RC_Princeton_Year');
clear k_AI_PM_RC_Princeton_Year p_AI_PM_RC_Princeton_Year AI_PM_RC_Princeton
% (2.2) PM_RC_CO2_Yang
AI_PM_RC_CO2_Yang_Princeton =  GridAI_Princeton_CMIP(1).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang;
for i_lon = 1 : size(AI_PM_RC_CO2_Yang_Princeton,1)
    for i_lat = 1 : size(AI_PM_RC_CO2_Yang_Princeton,2)
        if ~isnan(AI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , 1))
            Y = AI_PM_RC_CO2_Yang_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_AI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = b(2);
            p_AI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_AI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
            p_AI_PM_RC_CO2_Yang_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_AI_PM_RC_CO2_Yang_Princeton_Year(isnan(k_AI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_CO2_Yang_Princeton'],extent,k_AI_PM_RC_CO2_Yang_Princeton_Year');
p_AI_PM_RC_CO2_Yang_Princeton_Year(isnan(p_AI_PM_RC_CO2_Yang_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_CO2_Yang_Princeton'],extent,p_AI_PM_RC_CO2_Yang_Princeton_Year');
clear k_AI_PM_RC_CO2_Yang_Princeton_Year p_AI_PM_RC_CO2_Yang_Princeton_Year AI_PM_RC_CO2_Yang_Princeton
% (2.3) PM_RC_CO2_Jarvis_H
AI_PM_RC_CO2_Jarvis_H_Princeton =  GridAI_Princeton_CMIP(1).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(AI_PM_RC_CO2_Jarvis_H_Princeton,1)
    for i_lat = 1 : size(AI_PM_RC_CO2_Jarvis_H_Princeton,2)
        if ~isnan(AI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , 1))
            Y = AI_PM_RC_CO2_Jarvis_H_Princeton(i_lon , i_lat , :);
            Y = Y(:);
            x = [1948:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_AI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = b(2);
            p_AI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_AI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
            p_AI_PM_RC_CO2_Jarvis_H_Princeton_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_AI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(k_AI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_CO2_Jarvis_H_Princeton'],extent,k_AI_PM_RC_CO2_Jarvis_H_Princeton_Year');
p_AI_PM_RC_CO2_Jarvis_H_Princeton_Year(isnan(p_AI_PM_RC_CO2_Jarvis_H_Princeton_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_CO2_Jarvis_H_Princeton'],extent,p_AI_PM_RC_CO2_Jarvis_H_Princeton_Year');
clear k_AI_PM_RC_CO2_Jarvis_H_Princeton_Year p_AI_PM_RC_CO2_Jarvis_H_Princeton_Year AI_PM_RC_CO2_Jarvis_H_Princeton

%% (3) linear regression of AI calculated by CMIP scenarios
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % (3.1) PM_RC
    AI_PM_RC_CMIP =  GridAI_Princeton_CMIP(i_ssp+1).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(i_ssp+1).Ensemble_AI.ETrc_PM_RC;
    for i_lon = 1 : size(AI_PM_RC_CMIP,1)
        for i_lat = 1 : size(AI_PM_RC_CMIP,2)
            if ~isnan(AI_PM_RC_CMIP(i_lon , i_lat , 1))
                Y = AI_PM_RC_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_AI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
                p_AI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_AI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
                p_AI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    k_AI_PM_RC_CMIP_Year(isnan(k_AI_PM_RC_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_' ssp{i_ssp}],extent,k_AI_PM_RC_CMIP_Year');
    p_AI_PM_RC_CMIP_Year(isnan(p_AI_PM_RC_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_' ssp{i_ssp}],extent,p_AI_PM_RC_CMIP_Year');
    clear k_AI_PM_RC_CMIP_Year p_AI_PM_RC_CMIP_Year AI_PM_RC_CMIP
    % (3.2) PM_RC_CO2_Yang
    AI_PM_RC_CO2_Yang_CMIP =  GridAI_Princeton_CMIP(i_ssp+1).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(i_ssp+1).Ensemble_AI.ETrc_PM_RC_CO2_Yang;
    for i_lon = 1 : size(AI_PM_RC_CO2_Yang_CMIP,1)
        for i_lat = 1 : size(AI_PM_RC_CO2_Yang_CMIP,2)
            if ~isnan(AI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
                Y = AI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_AI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
                p_AI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_AI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
                p_AI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    k_AI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_AI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,k_AI_PM_RC_CO2_Yang_CMIP_Year');
    p_AI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_AI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_CO2_Yang_' ssp{i_ssp}],extent,p_AI_PM_RC_CO2_Yang_CMIP_Year');
    clear k_AI_PM_RC_CO2_Yang_CMIP_Year p_AI_PM_RC_CO2_Yang_CMIP_Year AI_PM_RC_CO2_Yang_CMIP
    % (3.3) PM_RC_CO2_Jarvis_H
    AI_PM_RC_CO2_Jarvis_H_CMIP =  GridAI_Princeton_CMIP(i_ssp+1).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(i_ssp+1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H;
    for i_lon = 1 : size(AI_PM_RC_CO2_Jarvis_H_CMIP,1)
        for i_lat = 1 : size(AI_PM_RC_CO2_Jarvis_H_CMIP,2)
            if ~isnan(AI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
                Y = AI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
                Y = Y(:);
                x = [2015:2100];
                X = [ones(length(Y),1) , x'];
                [b,bint,r,rint,stats] = regress(Y,X);
                k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
                p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
                clear x Y X b bint r rint stats
            else
                k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
                p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            end
        end
    end
    clear i_lat i_lon
    k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year');
    p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
    SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_CO2_Jarvis_H_' ssp{i_ssp}],extent,p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year');
    clear k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year AI_PM_RC_CO2_Jarvis_H_CMIP
end

%% (4) linear regression of AI calculated by CMIP historical experiments
% (4.1) PM_RC
AI_PM_RC_CMIP =  GridAI_Princeton_CMIP(6).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(6).Ensemble_AI.ETrc_PM_RC;
for i_lon = 1 : size(AI_PM_RC_CMIP,1)
    for i_lat = 1 : size(AI_PM_RC_CMIP,2)
        if ~isnan(AI_PM_RC_CMIP(i_lon , i_lat , 1))
            Y = AI_PM_RC_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_AI_PM_RC_CMIP_Year(i_lon,i_lat) = b(2);
            p_AI_PM_RC_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_AI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
            p_AI_PM_RC_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_AI_PM_RC_CMIP_Year(isnan(k_AI_PM_RC_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_Historical'],extent,k_AI_PM_RC_CMIP_Year');
p_AI_PM_RC_CMIP_Year(isnan(p_AI_PM_RC_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_Historical'],extent,p_AI_PM_RC_CMIP_Year');
clear k_AI_PM_RC_CMIP_Year p_AI_PM_RC_CMIP_Year AI_PM_RC_CMIP
% (4.2) PM_RC_CO2_Yang
AI_PM_RC_CO2_Yang_CMIP =  GridAI_Princeton_CMIP(6).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(6).Ensemble_AI.ETrc_PM_RC_CO2_Yang;
for i_lon = 1 : size(AI_PM_RC_CO2_Yang_CMIP,1)
    for i_lat = 1 : size(AI_PM_RC_CO2_Yang_CMIP,2)
        if ~isnan(AI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , 1))
            Y = AI_PM_RC_CO2_Yang_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_AI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = b(2);
            p_AI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_AI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
            p_AI_PM_RC_CO2_Yang_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_AI_PM_RC_CO2_Yang_CMIP_Year(isnan(k_AI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_CO2_Yang_Historical'],extent,k_AI_PM_RC_CO2_Yang_CMIP_Year');
p_AI_PM_RC_CO2_Yang_CMIP_Year(isnan(p_AI_PM_RC_CO2_Yang_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_CO2_Yang_Historical'],extent,p_AI_PM_RC_CO2_Yang_CMIP_Year');
clear k_AI_PM_RC_CO2_Yang_CMIP_Year p_AI_PM_RC_CO2_Yang_CMIP_Year AI_PM_RC_CO2_Yang_CMIP
% (4.3) PM_RC_CO2_Jarvis_H
AI_PM_RC_CO2_Jarvis_H_CMIP =  GridAI_Princeton_CMIP(6).Ensemble_AI.pr ./ GridAI_Princeton_CMIP(6).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H;
for i_lon = 1 : size(AI_PM_RC_CO2_Jarvis_H_CMIP,1)
    for i_lat = 1 : size(AI_PM_RC_CO2_Jarvis_H_CMIP,2)
        if ~isnan(AI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , 1))
            Y = AI_PM_RC_CO2_Jarvis_H_CMIP(i_lon , i_lat , :);
            Y = Y(:);
            x = [1850:2014];
            X = [ones(length(Y),1) , x'];
            [b,bint,r,rint,stats] = regress(Y,X);
            k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = b(2);
            p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = stats(3);
            clear x Y X b bint r rint stats
        else
            k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
            p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(i_lon,i_lat) = nan;
        end
    end
end
clear i_lat i_lon
k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'k_AI_PM_RC_CO2_Jarvis_H_Historical'],extent,k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year');
p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year(isnan(p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year)) = -9999;
SaveData2GeoTIFF([Path_Fig3_Output 'p_AI_PM_RC_CO2_Jarvis_H_Historical'],extent,p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year');
clear k_AI_PM_RC_CO2_Jarvis_H_CMIP_Year p_AI_PM_RC_CO2_Jarvis_H_CMIP_Year AI_PM_RC_CO2_Jarvis_H_CMIP
end
