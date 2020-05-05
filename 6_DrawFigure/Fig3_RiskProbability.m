function Output = Fig3_RiskProbability(lat_HR , lon_HR , RiskIndex ,...
    Times , AssumeMaxProp , GridIndex_TibetPlateau , Path_Shapefile)
% Convert RiskIndex from [0,1] to [0,AssumeMaxProp]
RiskIndex = RiskIndex .* AssumeMaxProp;
for i_Times = 1 : Times
    i_Times
    % Generate uniform distributed random number from 0 to 1
    RandomNum = rand(size(GridIndex_TibetPlateau));
    RandomNum(~GridIndex_TibetPlateau) = nan; % Extract Tibet Plateau
    % RiskJudge
    RiskJudge = double(RandomNum<RiskIndex); % if RiskJudge==1, then the river will release Dangerous Soil microorganisms
    RiskJudge(~GridIndex_TibetPlateau) = nan; % Extract Tibet Plateau
    % Judge Every Watershed whether the river will release Dangerous Soil microorganisms
    try
        Map = shaperead(Path_Shapefile);
        % RiverName and RowNum
        % Amu Darya(1), Balkhash(2), Ganges-Brahmaputra(12), Helmand(3), Indus(8),
        % Irrawaddy(4), Mekong(10), Murghab-Harirud(5), Salween(11), Syr Darya(6),
        % Tarim(13), Yangtze(9), Yellow River(7)
        
        %% Amu Darya(1)
        RiverIndex = 1;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 1) = 1;
        else
            Output(i_Times , 1) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Balkhash(2)
        RiverIndex = 2;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 2) = 1;
        else
            Output(i_Times , 2) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Ganges-Brahmaputra(12)
        RiverIndex = 12;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 3) = 1;
        else
            Output(i_Times , 3) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Helmand(3)
        RiverIndex = 3;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 4) = 1;
        else
            Output(i_Times , 4) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Indus(8)
        RiverIndex = 8;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 5) = 1;
        else
            Output(i_Times , 5) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Irrawaddy(4)
        RiverIndex = 4;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 6) = 1;
        else
            Output(i_Times , 6) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Mekong(10)
        RiverIndex = 10;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 7) = 1;
        else
            Output(i_Times , 7) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Murghab-Harirud(5)
        RiverIndex = 5;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 8) = 1;
        else
            Output(i_Times , 8) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Salween(11)
        RiverIndex = 11;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 9) = 1;
        else
            Output(i_Times , 9) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Syr Darya(6)
        RiverIndex = 6;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 10) = 1;
        else
            Output(i_Times , 10) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Tarim(13)
        RiverIndex = 13;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 11) = 1;
        else
            Output(i_Times , 11) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Yangtze(9)
        RiverIndex = 9;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 12) = 1;
        else
            Output(i_Times , 12) = 0;
        end
        clear RiverIndex GridIndex ii
        
        %% Yellow River(7)
        RiverIndex = 7;
        GridIndex = logical(zeros(size(RiskJudge)));
        for ii = 1 : length(RiverIndex)
            GridIndex = GridIndex | inpolygon(lon_HR , lat_HR ,...
                Map(RiverIndex(ii)).X , Map(RiverIndex(ii)).Y);
        end
        if nansum(RiskJudge(GridIndex))>10
            Output(i_Times , 13) = 1;
        else
            Output(i_Times , 13) = 0;
        end
        clear RiverIndex GridIndex ii
        Output
    catch
        disp('Error!');
    end
    clear RandomNum RiskJudge Map
end

end