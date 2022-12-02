function Fig4b_Article_Plotting(PDSI_Year)
% Drawing Drought Extent calculated by PDSI PM_RC_CO2_Jarvis_H
%% Setting Color and axis property
RGB_Yang_Shade = [35,97,127]; RGB_Yang_Line = [10,57,90];
RGB_PM_Shade = [201,132,70]; RGB_PM_Line = [155,84,34];
RGB_Jarvis_Shade = [68,190,160]; RGB_Jarvis_Line = [1,102,94];

subplot(1,2,2)
YlimRange_PDSI = [0.5,3.5]; YTickRange_PDSI = [0.5 : 0.5 : 3.5];
%% (1) SevereDrought ETrc %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_PDSI(1); YlimRange_PDSI(1); YlimRange_PDSI(2); YlimRange_PDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_PDSI(1); YlimRange_PDSI(1); YlimRange_PDSI(2); YlimRange_PDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Historical PDSI calculated by PM-RC-Jarvis-H
PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_PM_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = 5
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_PM_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-',...
    'Color',RGB_PM_Line./255,'Linewidth',2.5);hold on;
for i_ssp = 4
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-',...
        'Color',RGB_PM_Line./255,'Linewidth',2.5);
end
%% (2) SevereDrought Yang %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plotting Shade Area
% Historical PDSI calculated by PM-RC-Yang
PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Yang;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_Yang_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = 5
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Yang;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Yang;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Yang;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_Yang_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-',...
    'Color',RGB_Yang_Line./255,'Linewidth',2.5);hold on;
for i_ssp = 4
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-',...
        'Color',RGB_Yang_Line./255,'Linewidth',2.5);
end
%% (3) SevereDrought Jarvis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plotting Shade Area
% Historical PDSI calculated by PM-RC-Jarvis-H
PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_Jarvis_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = 5
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_Jarvis_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-',...
    'Color',RGB_Jarvis_Line./255,'Linewidth',2.5);hold on;
for i_ssp = 4
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-',...
        'Color',RGB_Jarvis_Line./255,'Linewidth',2.5);
end
% setting axis
ylabel('Month under drought');
title('SevereDrought (PDSI<-3)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_PDSI,'yTick',YTickRange_PDSI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');

%% (4) SevereDrought Princeton %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PDSI_Princeton_PM_RC_CO2_Jarvis_H = PDSI_Year(6).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Jarvis_H;
PDSI_Princeton_PM_RC_CO2_Yang = PDSI_Year(6).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC_CO2_Yang;
PDSI_Princeton_PM_RC = PDSI_Year(6).DroughtFrequency_GMYear.SevereDrought_pdsi_PM_RC;
plot([1948:2014],PDSI_Princeton_PM_RC_CO2_Jarvis_H,...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5); hold on;
plot([1948:2014],PDSI_Princeton_PM_RC_CO2_Yang,...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
plot([1948:2014],PDSI_Princeton_PM_RC,...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);

plot([1948:2014],PDSI_Princeton_PM_RC,'--',...
    'Color',1.0-1*(1.0-[224,130,20]./255),'EraseMode','xor','Linewidth',2.5); hold on;% 1为透明度
plot([1948:2014],PDSI_Princeton_PM_RC_CO2_Yang,'--',...
    'Color',1.0-1*(1.0-[116,173,209]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
plot([1948:2014],PDSI_Princeton_PM_RC_CO2_Jarvis_H,'--',...
    'Color',1.0-1*(1.0-[102,189,99]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
end
