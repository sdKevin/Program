%% Figure 3
clc; clear all; close all;
% Path of Watershed-Country Shapefile
Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData_outTibet_Country.shp';
%% £¨1£© Livestock
try
    % Cattle
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Cattle_HR.mat';
    load(Path_Data);
    Cattle = Fig3_InfoExtract(Path_Shapefile , lat , lon , Cattle_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Cattle' , 'Quantity' , 'N3:N44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Cattle'./nansum(nansum(Cattle_HR)).*100 , 'Percentage' , 'N3:N44');
    clear Cattle Path_Data lat lon Cattle_HR
    % Chickens
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Chickens_HR.mat';
    load(Path_Data);
    Chickens = Fig3_InfoExtract(Path_Shapefile , lat , lon , Chickens_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Chickens' , 'Quantity' , 'O3:O44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Chickens'./nansum(nansum(Chickens_HR)).*100 , 'Percentage' , 'O3:O44');
    clear Chickens Path_Data lat lon Chickens_HR
    % Ducks
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Ducks_HR.mat';
    load(Path_Data);
    Ducks = Fig3_InfoExtract(Path_Shapefile , lat , lon , Ducks_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Ducks' , 'Quantity' , 'P3:P44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Ducks'./nansum(nansum(Ducks_HR)).*100 , 'Percentage' , 'P3:P44');
    clear Ducks Path_Data lat lon Ducks_HR
    % Goats
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Goats_HR.mat';
    load(Path_Data);
    Goats = Fig3_InfoExtract(Path_Shapefile , lat , lon , Goats_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Goats' , 'Quantity' , 'Q3:Q44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Goats'./nansum(nansum(Goats_HR)).*100 , 'Percentage' , 'Q3:Q44');
    clear Goats Path_Data lat lon Goats_HR
    % Pigs
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Pigs_HR.mat';
    load(Path_Data);
    Pigs = Fig3_InfoExtract(Path_Shapefile , lat , lon , Pigs_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Pigs' , 'Quantity' , 'R3:R44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Pigs'./nansum(nansum(Pigs_HR)).*100 , 'Percentage' , 'R3:R44');
    clear Pigs Path_Data lat lon Pigs_HR
    % Sheep
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Livestock\Sheep_HR.mat';
    load(Path_Data);
    Sheep = Fig3_InfoExtract(Path_Shapefile , lat , lon , Sheep_HR);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Sheep' , 'Quantity' , 'S3:S44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , Sheep'./nansum(nansum(Sheep_HR)).*100 , 'Percentage' , 'S3:S44');
    clear Sheep Path_Data lat lon Sheep_HR
catch
    disp('Error!');
end
%% (2) Crop
try
    % Cotton
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Cotton.mat';
    load(Path_Data);
    cotton = Fig3_InfoExtract(Path_Shapefile , lat , lon , Cotton);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , cotton' , 'Quantity' , 'T3:T44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , cotton'./nansum(nansum(Cotton)).*100 , 'Percentage' , 'T3:T44');
    clear cotton Path_Data lat lon Cotton
    % Maize
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Maize.mat';
    load(Path_Data);
    maize = Fig3_InfoExtract(Path_Shapefile , lat , lon , Maize);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , maize' , 'Quantity' , 'U3:U44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , maize'./nansum(nansum(Maize)).*100 , 'Percentage' , 'U3:U44');
    clear maize Path_Data lat lon Maize
    % Rice
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Rice.mat';
    load(Path_Data);
    rice = Fig3_InfoExtract(Path_Shapefile , lat , lon , Rice);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , rice' , 'Quantity' , 'V3:V44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , rice'./nansum(nansum(Rice)).*100 , 'Percentage' , 'V3:V44');
    clear rice Path_Data lat lon Rice
    % Rubber
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Rubber.mat';
    load(Path_Data);
    rubber = Fig3_InfoExtract(Path_Shapefile , lat , lon , Rubber);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , rubber' , 'Quantity' , 'W3:W44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , rubber'./nansum(nansum(Rubber)).*100 , 'Percentage' , 'W3:W44');
    clear rubber Path_Data lat lon Rubber
    % Soybean
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Soybean.mat';
    load(Path_Data);
    soybean = Fig3_InfoExtract(Path_Shapefile , lat , lon , Soybean);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , soybean' , 'Quantity' , 'X3:X44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , soybean'./nansum(nansum(Soybean)).*100 , 'Percentage' , 'X3:X44');
    clear soybean Path_Data lat lon Soybean
    % Sugarcane
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Sugarcane.mat';
    load(Path_Data);
    sugarcane = Fig3_InfoExtract(Path_Shapefile , lat , lon , Sugarcane);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , sugarcane' , 'Quantity' , 'Y3:Y44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , sugarcane'./nansum(nansum(Sugarcane)).*100 , 'Percentage' , 'Y3:Y44');
    clear sugarcane Path_Data lat lon Sugarcane
    % Wheat
    Path_Data = 'D:\CMIP6\ProcessData\ImplicationResearch\Crop\Wheat.mat';
    load(Path_Data);
    wheat = Fig3_InfoExtract(Path_Shapefile , lat , lon , Wheat);
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , wheat' , 'Quantity' , 'Z3:Z44');
    xlswrite(['Fig3_OutputTable\ImplicationResearch.xlsx'] , wheat'./nansum(nansum(Wheat)).*100 , 'Percentage' , 'Z3:Z44');
    clear wheat Path_Data lat lon Wheat
catch
    disp('Error!');
end
%% (3) Population







