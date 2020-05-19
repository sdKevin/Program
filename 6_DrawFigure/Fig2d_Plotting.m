function [outputArg1,outputArg2] = Fig2d_Plotting(PerChange , SoilMicroBiomass , Nematodes , AI_PM_RC_CO2_Jarvis_H_Princeton)
%% Adjust AI map range from -180~180 to 0~360
% AI_PM_RC_CO2_Jarvis_H_Princeton
A = AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton(1:360 , :);
B = AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton(361:end , :);
AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton = [B;A];
clear A B
%% Index of dry, humid and cold lands
ColdLands = AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton == 6;
HumidLands = AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton == 1;
DryLands = AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton == 2|...
    AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton == 3|...
    AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton == 4|...
    AI_PM_RC_CO2_Jarvis_H_Princeton.AI_PM_RC_CO2_Jarvis_H_Princeton == 5;
%% Statistical Analysis of SoilMicroBiomass
subplot(1,3,2)
S_DryLands = SoilMicroBiomass.SoilMicroBiomass(DryLands); S_DryLands(isnan(S_DryLands)) = [];
S_HumidLands = SoilMicroBiomass.SoilMicroBiomass(HumidLands); S_HumidLands(isnan(S_HumidLands)) = [];
S_ColdLands = SoilMicroBiomass.SoilMicroBiomass(ColdLands); S_ColdLands(isnan(S_ColdLands)) = [];
Bar = bar([1 , 2 , 3] ,...
    [nanmean(S_DryLands) , nanmean(S_HumidLands) , nanmean(S_ColdLands)]); hold on;
errorbar([1 , 2 , 3] ,...
    [nanmean(S_DryLands) , nanmean(S_HumidLands) , nanmean(S_ColdLands)] ,...
    [std(S_ColdLands)/sqrt(length(S_DryLands))*3.3 ,std(S_HumidLands)/sqrt(length(S_HumidLands))*3.3 , std(S_ColdLands)/sqrt(length(S_ColdLands))*3.3] ,...
    'o','MarkerSize',3,'MarkerEdgeColor',[80,80,80]./255,...
    'Color',[120,120,120]./255,'LineWidth',2.5);
ylabel('CMIC (gCMIC/m2)');
% Adjust Color
Bar.FaceColor = 'flat';
Bar.CData(1,:) = [251 , 191 , 164] ./ 255; Bar.CData(2,:) = [206 , 230 , 192] ./ 255; Bar.CData(3,:) = [191 , 220 , 237] ./ 255;
Bar.EdgeColor = 'flat';
Bar.CData(1,:) = [251 , 191 , 164] ./ 255; Bar.CData(2,:) = [206 , 230 , 192] ./ 255; Bar.CData(3,:) = [191 , 220 , 237] ./ 255;
set(gca,'YMinorTick','on',...
        'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
clear S_DryLands S_HumidLands S_ColdLands

%% Statistical Analysis of Nematodes
subplot(1,3,3)
S_DryLands = Nematodes.Nematodes_05deg(DryLands); S_DryLands(isnan(S_DryLands)) = [];
S_HumidLands = Nematodes.Nematodes_05deg(HumidLands); S_HumidLands(isnan(S_HumidLands)) = [];
S_ColdLands = Nematodes.Nematodes_05deg(ColdLands); S_ColdLands(isnan(S_ColdLands)) = [];
Bar = bar([1 , 2 , 3] ,...
    [nanmean(S_DryLands) , nanmean(S_HumidLands) , nanmean(S_ColdLands)]); hold on;
errorbar([1 , 2 , 3] ,...
    [nanmean(S_DryLands) , nanmean(S_HumidLands) , nanmean(S_ColdLands)] ,...
    [std(S_ColdLands)/sqrt(length(S_DryLands))*3.3 ,std(S_HumidLands)/sqrt(length(S_HumidLands))*3.3 , std(S_ColdLands)/sqrt(length(S_ColdLands))*3.3] ,...
    'o','MarkerSize',3,'MarkerEdgeColor',[80,80,80]./255,...
    'Color',[120,120,120]./255,'LineWidth',2.5);
ylabel('DNem (Nematodes/m2)');
% Adjust Color
Bar.FaceColor = 'flat';
Bar.CData(1,:) = [251 , 191 , 164] ./ 255; Bar.CData(2,:) = [206 , 230 , 192] ./ 255; Bar.CData(3,:) = [191 , 220 , 237] ./ 255;
Bar.EdgeColor = 'flat';
Bar.CData(1,:) = [251 , 191 , 164] ./ 255; Bar.CData(2,:) = [206 , 230 , 192] ./ 255; Bar.CData(3,:) = [191 , 220 , 237] ./ 255;
set(gca,'YMinorTick','on',...
        'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
clear S_DryLands S_HumidLands S_ColdLands
%% PerChange.PerChange.PerChange_pr_evspsbl
X_Pos = [-0.24,-0.08,0.08,0.24];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
for i_ssp = 4 : -1 : 1
    load LandInfo_05deg
    % from 0-360 to -180~180
    A = landmask_05deg(1:360 , :); B = landmask_05deg(361:end , :);
    landmask_05deg = [B;A]; clear B A
    A = lat_05deg(1:360 , :); B = lat_05deg(361:end , :);
    lat_05deg = [B;A]; clear B A
    A = lon_05deg(1:360 , :); B = lon_05deg(361:end , :) - 360;
    lon_05deg = [B;A]; clear B A
    Ensemble_Mean_PerChange_pr_evspsbl = nanmean(PerChange(i_ssp).PerChange.PerChange_pr_evspsbl,3);
    Ensemble_Mean_PerChange_pr_evspsbl = interp2(lat_05deg([1:358,362:end],:),...
        lon_05deg([1:358,362:end],:),Ensemble_Mean_PerChange_pr_evspsbl([1:358,362:end],:),...
        lat_05deg,lon_05deg).*landmask_05deg; % interpolate the seam
    % Adjust map range from -180~180 to 0~360
    A = Ensemble_Mean_PerChange_pr_evspsbl(1:360 , :);
    B = Ensemble_Mean_PerChange_pr_evspsbl(361:end , :);
    Ensemble_Mean_PerChange_pr_evspsbl = [B;A];
    clear A B elevation_05deg landmask_05deg lat_05deg lon_05deg
    %% Statistical Analysis of PerChange_pr_evspsbl
    subplot(1,3,1)
    S_DryLands = Ensemble_Mean_PerChange_pr_evspsbl(DryLands); S_DryLands(isnan(S_DryLands)) = [];
    S_HumidLands = Ensemble_Mean_PerChange_pr_evspsbl(HumidLands); S_HumidLands(isnan(S_HumidLands)) = [];
    S_ColdLands = Ensemble_Mean_PerChange_pr_evspsbl(ColdLands); S_ColdLands(isnan(S_ColdLands)) = [];
    Bar = bar([1 , 2 , 3] ,...
        [nanmean(S_DryLands) , nanmean(S_HumidLands) , nanmean(S_ColdLands)],...
        'FaceColor',RGB_ssp_Shade(i_ssp,:)./255,'EdgeColor','none'); hold on;
    errorbar([1 , 2 , 3] + X_Pos(i_ssp) ,...
        [nanmean(S_DryLands) , nanmean(S_HumidLands) , nanmean(S_ColdLands)] ,...
        [std(S_ColdLands)/sqrt(length(S_DryLands))*3.3 ,std(S_HumidLands)/sqrt(length(S_HumidLands))*3.3 , std(S_ColdLands)/sqrt(length(S_ColdLands))*3.3] ,...
        'o','MarkerSize',3,'MarkerEdgeColor',RGB_ssp_Line(i_ssp,:)./255,...
        'Color',[120,120,120]./255,'LineWidth',2.5);
    ylabel('Percentage Change of Pr-ET (%)');
    set(gca,'YMinorTick','on',...
        'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
    clear S_DryLands S_HumidLands S_ColdLands
    clear Ensemble_Mean_PerChange_pr_evspsbl
end
end