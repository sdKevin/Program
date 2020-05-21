function Output = Fig3_InfoExtractCountryMean(Path_Shapefile , lat , lon , Data)
Map = shaperead(Path_Shapefile);
% CountryName and CountryID
% Afghanistan(0), Bangladesh(14), Bhutan(20), Cambodia(30), China(37),
% India(205), Iran(83), Kazakhstan(95), Kyrgyzstan(102), Laos(103),
% Myanmar(128), Nepal(130), Pakistan(140), Tajikistan£¨178£©, Thailand(180)
% Turkmenistan(186), Uzbekistan(194), Vietnam(197)

CountryID = cell2mat({Map.FID_Countr}');
%% Afghanistan(0)
CountryIndex = find(CountryID==0);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(1) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Bangladesh(14)
CountryIndex = find(CountryID==14);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(2) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Bhutan(20)
CountryIndex = find(CountryID==20);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(3) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Cambodia(30)
CountryIndex = find(CountryID==30);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(4) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% China(37)
CountryIndex = find(CountryID==37);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(5) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% India(205)
CountryIndex = find(CountryID==205);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(6) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Iran(83)
CountryIndex = find(CountryID==83);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(7) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Kazakhstan(95)
CountryIndex = find(CountryID==95);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(8) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Kyrgyzstan(102)
CountryIndex = find(CountryID==102);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(9) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Laos(103)
CountryIndex = find(CountryID==103);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(10) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Myanmar(128)
CountryIndex = find(CountryID==128);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(11) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Nepal(130)
CountryIndex = find(CountryID==130);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(12) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Pakistan(140)
CountryIndex = find(CountryID==140);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(13) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Tajikistan£¨178£©
CountryIndex = find(CountryID==178);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(14) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Thailand(180)
CountryIndex = find(CountryID==180);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(15) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Turkmenistan(186)
CountryIndex = find(CountryID==186);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(16) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Uzbekistan(194)
CountryIndex = find(CountryID==194);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(17) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii

%% Vietnam(197)
CountryIndex = find(CountryID==197);
GridIndex = logical(zeros(size(Data)));
for ii = 1 : length(CountryIndex)
    GridIndex = GridIndex | inpolygon(lon , lat ,...
        Map(CountryIndex(ii)).X,Map(CountryIndex(ii)).Y);
end
Output(18) = nanmean(Data(GridIndex));
clear CountryIndex GridIndex ii
end