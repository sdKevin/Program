function Output = Fig3_InfoExtractTibetMean(Path_Shapefile , lat , lon , Data)
Map = shaperead(Path_Shapefile);
% RiverName and RowNum
% Amu Darya(1), Balkhash(2), Ganges-Brahmaputra(12), Helmand(3), Indus(8),
% Irrawaddy(4), Mekong(10), Murghab-Harirud(5), Salween(11), Syr Darya(6),
% Tarim(13), Yangtze(9), Yellow River(7)

%% Amu Darya(1)
RiverIndex = 1;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(1) = nanmean(Data(GridIndex));
Output(2) = nanmean(Data(GridIndex));
Output(3) = nanmean(Data(GridIndex));
Output(4) = nanmean(Data(GridIndex));
Output(5) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Balkhash(2)
RiverIndex = 2;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(6) = nanmean(Data(GridIndex));
Output(7) = nanmean(Data(GridIndex));
Output(8) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Ganges-Brahmaputra(12)
RiverIndex = 12;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(9) = nanmean(Data(GridIndex));
Output(10) = nanmean(Data(GridIndex));
Output(11) = nanmean(Data(GridIndex));
Output(12) = nanmean(Data(GridIndex));
Output(13) = nanmean(Data(GridIndex));
Output(14) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Helmand(3)
RiverIndex = 3;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(15) = nanmean(Data(GridIndex));
Output(16) = nanmean(Data(GridIndex));
Output(17) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Indus(8)
RiverIndex = 8;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(18) = nanmean(Data(GridIndex));
Output(19) = nanmean(Data(GridIndex));
Output(20) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Irrawaddy(4)
RiverIndex = 4;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(21) = nanmean(Data(GridIndex));
Output(22) = nanmean(Data(GridIndex));
Output(23) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Mekong(10)
RiverIndex = 10;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(24) = nanmean(Data(GridIndex));
Output(25) = nanmean(Data(GridIndex));
Output(26) = nanmean(Data(GridIndex));
Output(27) = nanmean(Data(GridIndex));
Output(28) = nanmean(Data(GridIndex));
Output(29) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Murghab-Harirud(5)
RiverIndex = 5;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(30) = nanmean(Data(GridIndex));
Output(31) = nanmean(Data(GridIndex));
Output(32) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Salween(11)
RiverIndex = 11;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(33) = nanmean(Data(GridIndex));
Output(34) = nanmean(Data(GridIndex));
Output(35) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Syr Darya(6)
RiverIndex = 6;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(36) = nanmean(Data(GridIndex));
Output(37) = nanmean(Data(GridIndex));
Output(38) = nanmean(Data(GridIndex));
Output(39) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Tarim(13)
RiverIndex = 13;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(40) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Yangtze(9)
RiverIndex = 9;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(41) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Yellow River(7)
RiverIndex = 7;
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(42) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii
end