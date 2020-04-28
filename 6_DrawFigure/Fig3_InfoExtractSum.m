function Output = Fig3_InfoExtractSum(Path_Shapefile , lat , lon , Data)
Map = shaperead(Path_Shapefile);
% RiverName and RiverID
% Amu Darya(0), Balkhash(1), Ganges-Brahmaputra(11), Helmand(2), Indus(7),
% Irrawaddy(3), Mekong(9), Murghab-Harirud(4), Salween(10), Syr Darya(5),
% Tarim(12), Yangtze(8), Yellow River(6)

% CountryName and CountryID
% Afghanistan(0), Bangladesh(14), Bhutan(20), Cambodia(30), China(37),
% India(205), Iran(83), Kazakhstan(95), Kyrgyzstan(102), Laos(103),
% Myanmar(128), Nepal(130), Pakistan(140), Tajikistan£¨178£©,
% Turkmenistan(186), Uzbekistan(194), Vietnam(197)
RiverID = cell2mat({Map.FID_Basin_}');
CountryID = cell2mat({Map.FID_Countr}');
%% Amu Darya(0)
RiverIndex = find(RiverID==0);
% Afghanistan(0)
MiddleIndex = find(CountryID(RiverIndex)==0);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(1) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Kazakhstan(95)
MiddleIndex = find(CountryID(RiverIndex)==95);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(2) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Tajikistan£¨178£©
MiddleIndex = find(CountryID(RiverIndex)==178);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(3) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Turkmenistan(186)
MiddleIndex = find(CountryID(RiverIndex)==186);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(4) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Uzbekistan(194)
MiddleIndex = find(CountryID(RiverIndex)==194);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(5) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Balkhash(1)
RiverIndex = find(RiverID==1);
% China(37)
MiddleIndex = find(CountryID(RiverIndex)==37);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(6) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Kazakhstan(95)
MiddleIndex = find(CountryID(RiverIndex)==95);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(7) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Kyrgyzstan(102)
MiddleIndex = find(CountryID(RiverIndex)==102);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(8) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Ganges-Brahmaputra(11)
RiverIndex = find(RiverID==11);
% Bangladesh(14)
MiddleIndex = find(CountryID(RiverIndex)==14);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(9) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Bhutan(20)
MiddleIndex = find(CountryID(RiverIndex)==20);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(10) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% China(37)
MiddleIndex = find(CountryID(RiverIndex)==37);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(11) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Myanmar(128)
MiddleIndex = find(CountryID(RiverIndex)==128);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(12) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Nepal(130)
MiddleIndex = find(CountryID(RiverIndex)==130);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(13) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% India(205)
MiddleIndex = find(CountryID(RiverIndex)==205);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(14) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Helmand(2)
RiverIndex = find(RiverID==2);
% Afghanistan(0)
MiddleIndex = find(CountryID(RiverIndex)==0);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(15) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Iran(83)
MiddleIndex = find(CountryID(RiverIndex)==83);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(16) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Pakistan(140)
MiddleIndex = find(CountryID(RiverIndex)==140);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(17) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Indus(7)
RiverIndex = find(RiverID==7);
% Afghanistan(0)
MiddleIndex = find(CountryID(RiverIndex)==0);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(18) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Pakistan(140)
MiddleIndex = find(CountryID(RiverIndex)==140);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(19) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% India(205)
MiddleIndex = find(CountryID(RiverIndex)==205);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(20) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Irrawaddy(3)
RiverIndex = find(RiverID==3);
% China(37)
MiddleIndex = find(CountryID(RiverIndex)==37);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(21) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Myanmar(128)
MiddleIndex = find(CountryID(RiverIndex)==128);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(22) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% India(205)
MiddleIndex = find(CountryID(RiverIndex)==205);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(23) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Mekong(9)
RiverIndex = find(RiverID==9);
% Cambodia(30)
MiddleIndex = find(CountryID(RiverIndex)==30);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(24) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% China(37)
MiddleIndex = find(CountryID(RiverIndex)==37);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(25) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Laos(103)
MiddleIndex = find(CountryID(RiverIndex)==103);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(26) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Myanmar(128)
MiddleIndex = find(CountryID(RiverIndex)==128);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(27) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Thailand(180)
MiddleIndex = find(CountryID(RiverIndex)==180);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(28) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Vietnam(197)
MiddleIndex = find(CountryID(RiverIndex)==197);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(29) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Murghab-Harirud(4)
RiverIndex = find(RiverID==4);
% Afghanistan(0)
MiddleIndex = find(CountryID(RiverIndex)==0);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(30) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Iran(83)
MiddleIndex = find(CountryID(RiverIndex)==83);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(31) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Turkmenistan(186)
MiddleIndex = find(CountryID(RiverIndex)==186);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(32) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Salween(10)
RiverIndex = find(RiverID==10);
% China(37)
MiddleIndex = find(CountryID(RiverIndex)==37);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(33) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Myanmar(128)
MiddleIndex = find(CountryID(RiverIndex)==128);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(34) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Thailand(180)
MiddleIndex = find(CountryID(RiverIndex)==180);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(35) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Syr Darya(5)
RiverIndex = find(RiverID==5);
% Kazakhstan(95)
MiddleIndex = find(CountryID(RiverIndex)==95);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(36) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Kyrgyzstan(102)
MiddleIndex = find(CountryID(RiverIndex)==102);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(37) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Tajikistan£¨178£©
MiddleIndex = find(CountryID(RiverIndex)==178);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(38) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
% Uzbekistan(194)
MiddleIndex = find(CountryID(RiverIndex)==194);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(39) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Tarim(12)
RiverIndex = find(RiverID==12);
% China(37)
MiddleIndex = find(CountryID(RiverIndex)==37);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(40) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Yangtze(8)
RiverIndex = find(RiverID==8);
% China(37)
MiddleIndex = find(CountryID(RiverIndex)==37);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(41) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex

%% Yellow River(6)
RiverIndex = find(RiverID==6);
% China(37)
MiddleIndex = find(CountryID(RiverIndex)==37);
CountryIndex = RiverIndex(MiddleIndex);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(42) = nansum(Data(GridIndex));
clear MiddleIndex CountryIndex GridIndex ii
clear RiverIndex
end