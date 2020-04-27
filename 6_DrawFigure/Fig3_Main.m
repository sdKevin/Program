%% Figure 3
clc; clear all; close all;
Path_Shapefile = 'D:\CMIP6\ProcessData\ImplicationResearch\Basin_Topo_MergeOriginalData_outTibet_Country.shp';
%% £¨1£© Livestock
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





