function [Extent , Intensity , Frequency] = Fig_Up_Middle_Down_Statistical(Met_Drought_Extent_Year , Met_Drought_Intensity_Year , Met_Drought_Frequency_Year)

%% Drought Extent
% Historical Mean over 1951-2000
CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
Extent(1,1) = mean(Ensemble_Mean_CD_Historical(102:151));
mean(c95_CD_Historical(102:151))
clear c95_CD_Historical Ensemble_Mean_CD_Historical CD_Historical

% ssp 585 Mean over 2051-2100
CD_ssp585 = Met_Drought_Extent_Year(5).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_ssp585 = nanmean(CD_ssp585)';
c95_CD_ssp585 = (std(CD_ssp585)./sqrt(size(CD_ssp585,1))) .* 1.96; % 95% confidence interval
Extent(9,1) = mean(Ensemble_Mean_CD_ssp585(37:86));
mean(c95_CD_ssp585(37:86))
clear c95_CD_ssp585 Ensemble_Mean_CD_ssp585 CD_ssp585
% ssp 370 Mean over 2051-2100
CD_ssp370 = Met_Drought_Extent_Year(4).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_ssp370 = nanmean(CD_ssp370)';
c95_CD_ssp370 = (std(CD_ssp370)./sqrt(size(CD_ssp370,1))) .* 1.96; % 95% confidence interval
Extent(8,1) = mean(Ensemble_Mean_CD_ssp370(37:86));
mean(c95_CD_ssp370(37:86))
clear c95_CD_ssp370 Ensemble_Mean_CD_ssp370 CD_ssp370
% ssp 245 Mean over 2051-2100
CD_ssp245 = Met_Drought_Extent_Year(3).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
Extent(7,1) = mean(Ensemble_Mean_CD_ssp245(37:86));
mean(c95_CD_ssp245(37:86))
clear c95_CD_ssp245 Ensemble_Mean_CD_ssp245 CD_ssp245
% ssp 126 Mean over 2051-2100
CD_ssp126 = Met_Drought_Extent_Year(2).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_ssp126 = nanmean(CD_ssp126)';
c95_CD_ssp126 = (std(CD_ssp126)./sqrt(size(CD_ssp126,1))) .* 1.96; % 95% confidence interval
Extent(6,1) = mean(Ensemble_Mean_CD_ssp126(37:86));
mean(c95_CD_ssp126(37:86))
clear c95_CD_ssp126 Ensemble_Mean_CD_ssp126 CD_ssp126

% ssp 585 Mean over 2001-2050
CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
CD_ssp585 = Met_Drought_Extent_Year(5).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_ssp585 = [nanmean(CD_Historical)';nanmean(CD_ssp585)'];
c95_CD_ssp585 = (std([CD_Historical,CD_ssp585])./sqrt(size([CD_Historical,CD_ssp585],1))) .* 1.96; % 95% confidence interval
Extent(5,1) = mean(Ensemble_Mean_CD_ssp585(152:201));
mean(c95_CD_ssp585(152:201))
clear CD_Historical c95_CD_ssp585 Ensemble_Mean_CD_ssp585 CD_ssp585
% ssp 245 Mean over 2001-2050
CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
CD_ssp245 = Met_Drought_Extent_Year(3).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
Extent(3,1) = mean(Ensemble_Mean_CD_ssp245(152:201));
mean(c95_CD_ssp245(152:201))
clear CD_Historical c95_CD_ssp245 Ensemble_Mean_CD_ssp245 CD_ssp245
% ssp 126 Mean over 2001-2050
CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
CD_ssp126 = Met_Drought_Extent_Year(2).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_ssp126 = [nanmean(CD_Historical)';nanmean(CD_ssp126)'];
c95_CD_ssp126 = (std([CD_Historical,CD_ssp126])./sqrt(size([CD_Historical,CD_ssp126],1))) .* 1.96; % 95% confidence interval
Extent(2,1) = mean(Ensemble_Mean_CD_ssp126(152:201));
mean(c95_CD_ssp126(152:201))
clear CD_Historical c95_CD_ssp126 Ensemble_Mean_CD_ssp126 CD_ssp126
% ssp 370 Mean over 2001-2050
CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
CD_Historical(13,:) = []; % since HadGEM3-GC31-LL model does not have ssp370
CD_ssp370 = Met_Drought_Extent_Year(4).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_ssp370 = [nanmean(CD_Historical)';nanmean(CD_ssp370)'];
c95_CD_ssp370 = (std([CD_Historical,CD_ssp370])./sqrt(size([CD_Historical,CD_ssp370],1))) .* 1.96; % 95% confidence interval
Extent(4,1) = mean(Ensemble_Mean_CD_ssp370(152:201));
mean(c95_CD_ssp370(152:201))
clear CD_Historical c95_CD_ssp370 Ensemble_Mean_CD_ssp370 CD_ssp370

%% Drought Intensity
% Historical Mean over 1951-2000
CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
Intensity(1,1) = mean(Ensemble_Mean_CD_Historical(102:151));
mean(c95_CD_Historical(102:151))
clear c95_CD_Historical Ensemble_Mean_CD_Historical CD_Historical

% ssp 585 Mean over 2051-2100
CD_ssp585 = Met_Drought_Intensity_Year(5).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_ssp585 = nanmean(CD_ssp585)';
c95_CD_ssp585 = (std(CD_ssp585)./sqrt(size(CD_ssp585,1))) .* 1.96; % 95% confidence interval
Intensity(9,1) = mean(Ensemble_Mean_CD_ssp585(37:86));
mean(c95_CD_ssp585(37:86))
clear c95_CD_ssp585 Ensemble_Mean_CD_ssp585 CD_ssp585
% ssp 370 Mean over 2051-2100
CD_ssp370 = Met_Drought_Intensity_Year(4).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_ssp370 = nanmean(CD_ssp370)';
c95_CD_ssp370 = (std(CD_ssp370)./sqrt(size(CD_ssp370,1))) .* 1.96; % 95% confidence interval
Intensity(8,1) = mean(Ensemble_Mean_CD_ssp370(37:86));
mean(c95_CD_ssp370(37:86))
clear c95_CD_ssp370 Ensemble_Mean_CD_ssp370 CD_ssp370
% ssp 245 Mean over 2051-2100
CD_ssp245 = Met_Drought_Intensity_Year(3).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
Intensity(7,1) = mean(Ensemble_Mean_CD_ssp245(37:86));
mean(c95_CD_ssp245(37:86))
clear c95_CD_ssp245 Ensemble_Mean_CD_ssp245 CD_ssp245
% ssp 126 Mean over 2051-2100
CD_ssp126 = Met_Drought_Intensity_Year(2).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_ssp126 = nanmean(CD_ssp126)';
c95_CD_ssp126 = (std(CD_ssp126)./sqrt(size(CD_ssp126,1))) .* 1.96; % 95% confidence interval
Intensity(6,1) = mean(Ensemble_Mean_CD_ssp126(37:86));
mean(c95_CD_ssp126(37:86))
clear c95_CD_ssp126 Ensemble_Mean_CD_ssp126 CD_ssp126

% ssp 585 Mean over 2001-2050
CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
CD_ssp585 = Met_Drought_Intensity_Year(5).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_ssp585 = [nanmean(CD_Historical)';nanmean(CD_ssp585)'];
c95_CD_ssp585 = (std([CD_Historical,CD_ssp585])./sqrt(size([CD_Historical,CD_ssp585],1))) .* 1.96; % 95% confidence interval
Intensity(5,1) = mean(Ensemble_Mean_CD_ssp585(152:201));
mean(c95_CD_ssp585(152:201))
clear CD_Historical c95_CD_ssp585 Ensemble_Mean_CD_ssp585 CD_ssp585
% ssp 245 Mean over 2001-2050
CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
CD_ssp245 = Met_Drought_Intensity_Year(3).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
Intensity(3,1) = mean(Ensemble_Mean_CD_ssp245(152:201));
mean(c95_CD_ssp245(152:201))
clear CD_Historical c95_CD_ssp245 Ensemble_Mean_CD_ssp245 CD_ssp245
% ssp 126 Mean over 2001-2050
CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
CD_ssp126 = Met_Drought_Intensity_Year(2).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_ssp126 = [nanmean(CD_Historical)';nanmean(CD_ssp126)'];
c95_CD_ssp126 = (std([CD_Historical,CD_ssp126])./sqrt(size([CD_Historical,CD_ssp126],1))) .* 1.96; % 95% confidence interval
Intensity(2,1) = mean(Ensemble_Mean_CD_ssp126(152:201));
mean(c95_CD_ssp126(152:201))
clear CD_Historical c95_CD_ssp126 Ensemble_Mean_CD_ssp126 CD_ssp126
% ssp 370 Mean over 2001-2050
CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
CD_Historical(13,:) = []; % since HadGEM3-GC31-LL model does not have ssp370
CD_ssp370 = Met_Drought_Intensity_Year(4).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_ssp370 = [nanmean(CD_Historical)';nanmean(CD_ssp370)'];
c95_CD_ssp370 = (std([CD_Historical,CD_ssp370])./sqrt(size([CD_Historical,CD_ssp370],1))) .* 1.96; % 95% confidence interval
Intensity(4,1) = mean(Ensemble_Mean_CD_ssp370(152:201));
mean(c95_CD_ssp370(152:201))
clear CD_Historical c95_CD_ssp370 Ensemble_Mean_CD_ssp370 CD_ssp370

%% Drought Frequency
% Historical Mean over 1951-2000
CD_Historical = Met_Drought_Frequency_Year(1).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
Frequency(1,1) = mean(Ensemble_Mean_CD_Historical(102:151));
mean(c95_CD_Historical(102:151))
clear c95_CD_Historical Ensemble_Mean_CD_Historical CD_Historical

% ssp 585 Mean over 2051-2100
CD_ssp585 = Met_Drought_Frequency_Year(5).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_ssp585 = nanmean(CD_ssp585)';
c95_CD_ssp585 = (std(CD_ssp585)./sqrt(size(CD_ssp585,1))) .* 1.96; % 95% confidence interval
Frequency(9,1) = mean(Ensemble_Mean_CD_ssp585(37:86));
mean(c95_CD_ssp585(37:86))
clear c95_CD_ssp585 Ensemble_Mean_CD_ssp585 CD_ssp585
% ssp 370 Mean over 2051-2100
CD_ssp370 = Met_Drought_Frequency_Year(4).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_ssp370 = nanmean(CD_ssp370)';
c95_CD_ssp370 = (std(CD_ssp370)./sqrt(size(CD_ssp370,1))) .* 1.96; % 95% confidence interval
Frequency(8,1) = mean(Ensemble_Mean_CD_ssp370(37:86));
mean(c95_CD_ssp370(37:86))
clear c95_CD_ssp370 Ensemble_Mean_CD_ssp370 CD_ssp370
% ssp 245 Mean over 2051-2100
CD_ssp245 = Met_Drought_Frequency_Year(3).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
Frequency(7,1) = mean(Ensemble_Mean_CD_ssp245(37:86));
mean(c95_CD_ssp245(37:86))
clear c95_CD_ssp245 Ensemble_Mean_CD_ssp245 CD_ssp245
% ssp 126 Mean over 2051-2100
CD_ssp126 = Met_Drought_Frequency_Year(2).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_ssp126 = nanmean(CD_ssp126)';
c95_CD_ssp126 = (std(CD_ssp126)./sqrt(size(CD_ssp126,1))) .* 1.96; % 95% confidence interval
Frequency(6,1) = mean(Ensemble_Mean_CD_ssp126(37:86));
mean(c95_CD_ssp126(37:86))
clear c95_CD_ssp126 Ensemble_Mean_CD_ssp126 CD_ssp126

% ssp 585 Mean over 2001-2050
CD_Historical = Met_Drought_Frequency_Year(1).DroughtFrequency_Year.CompoundDrought;
CD_ssp585 = Met_Drought_Frequency_Year(5).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_ssp585 = [nanmean(CD_Historical)';nanmean(CD_ssp585)'];
c95_CD_ssp585 = (std([CD_Historical,CD_ssp585])./sqrt(size([CD_Historical,CD_ssp585],1))) .* 1.96; % 95% confidence interval
Frequency(5,1) = mean(Ensemble_Mean_CD_ssp585(152:201));
mean(c95_CD_ssp585(152:201))
clear CD_Historical c95_CD_ssp585 Ensemble_Mean_CD_ssp585 CD_ssp585
% ssp 245 Mean over 2001-2050
CD_Historical = Met_Drought_Frequency_Year(1).DroughtFrequency_Year.CompoundDrought;
CD_ssp245 = Met_Drought_Frequency_Year(3).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
Frequency(3,1) = mean(Ensemble_Mean_CD_ssp245(152:201));
mean(c95_CD_ssp245(152:201))
clear CD_Historical c95_CD_ssp245 Ensemble_Mean_CD_ssp245 CD_ssp245
% ssp 126 Mean over 2001-2050
CD_Historical = Met_Drought_Frequency_Year(1).DroughtFrequency_Year.CompoundDrought;
CD_ssp126 = Met_Drought_Frequency_Year(2).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_ssp126 = [nanmean(CD_Historical)';nanmean(CD_ssp126)'];
c95_CD_ssp126 = (std([CD_Historical,CD_ssp126])./sqrt(size([CD_Historical,CD_ssp126],1))) .* 1.96; % 95% confidence interval
Frequency(2,1) = mean(Ensemble_Mean_CD_ssp126(152:201));
mean(c95_CD_ssp126(152:201))
clear CD_Historical c95_CD_ssp126 Ensemble_Mean_CD_ssp126 CD_ssp126
% ssp 370 Mean over 2001-2050
CD_Historical = Met_Drought_Frequency_Year(1).DroughtFrequency_Year.CompoundDrought;
CD_Historical(13,:) = []; % since HadGEM3-GC31-LL model does not have ssp370
CD_ssp370 = Met_Drought_Frequency_Year(4).DroughtFrequency_Year.CompoundDrought;
Ensemble_Mean_CD_ssp370 = [nanmean(CD_Historical)';nanmean(CD_ssp370)'];
c95_CD_ssp370 = (std([CD_Historical,CD_ssp370])./sqrt(size([CD_Historical,CD_ssp370],1))) .* 1.96; % 95% confidence interval
Frequency(4,1) = mean(Ensemble_Mean_CD_ssp370(152:201));
mean(c95_CD_ssp370(152:201))
clear CD_Historical c95_CD_ssp370 Ensemble_Mean_CD_ssp370 CD_ssp370
end

