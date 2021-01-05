function Output = Fig3_InfoExtractTibetMean(Path_Shapefile , lat , lon , Data)
Map = shaperead(Path_Shapefile);
% RiverName and RiverID
% Amu Darya(0), Balkhash(1), Ganges-Brahmaputra(11), Helmand(2), Indus(7),
% Irrawaddy(3), Mekong(9), Murghab-Harirud(4), Salween(10), Syr Darya(5),
% Tarim(12), Yangtze(8), Yellow River(6)

RiverID = cell2mat({Map.FID_Basin_}');
%% Amu Darya(0)
RiverIndex = find(RiverID==0);
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

%% Balkhash(1)
RiverIndex = find(RiverID==1);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(6) = nanmean(Data(GridIndex));
Output(7) = nanmean(Data(GridIndex));
Output(8) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Ganges-Brahmaputra(11)
RiverIndex = find(RiverID==11);
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

%% Helmand(2)
RiverIndex = find(RiverID==2);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(15) = nanmean(Data(GridIndex));
Output(16) = nanmean(Data(GridIndex));
Output(17) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Indus(7)
RiverIndex = find(RiverID==7);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(18) = nanmean(Data(GridIndex));
Output(19) = nanmean(Data(GridIndex));
Output(20) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Irrawaddy(3)
RiverIndex = find(RiverID==3);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(21) = nanmean(Data(GridIndex));
Output(22) = nanmean(Data(GridIndex));
Output(23) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Mekong(9)
RiverIndex = find(RiverID==9);
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

%% Murghab-Harirud(4)
RiverIndex = find(RiverID==4);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(30) = nanmean(Data(GridIndex));
Output(31) = nanmean(Data(GridIndex));
Output(32) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Salween(10)
RiverIndex = find(RiverID==10);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(33) = nanmean(Data(GridIndex));
Output(34) = nanmean(Data(GridIndex));
Output(35) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Syr Darya(5)
RiverIndex = find(RiverID==5);
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

%% Tarim(12)
RiverIndex = find(RiverID==12);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(40) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Yangtze(8)
RiverIndex = find(RiverID==8);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(41) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii

%% Yellow River(6)
RiverIndex = find(RiverID==6);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(RiverIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(RiverIndex(ii)).X,Map(RiverIndex(ii)).Y);
end
Output(42) = nanmean(Data(GridIndex));
clear RiverIndex GridIndex ii
end