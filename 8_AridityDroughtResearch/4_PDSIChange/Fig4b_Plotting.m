function Fig4b_Plotting(PDSI_Year)
% Drawing Drought Extent calculated by PDSI PM_RC_CO2_Yang
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
HatchAngle_ssp = [65,115,65,115];
figure
disp('Adjust figure, then press Enter to continue.')
pause()
%% (1) SevereDrought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,1)

YlimRange_PDSI = [5,30]; YTickRange_PDSI = [5 : 5 : 30];
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
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical PDSI calculated by PM-RC-Jarvis-H
PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.SevereDrought_pdsi_PM_RC_CO2_Yang;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.SevereDrought_pdsi_PM_RC_CO2_Yang;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.SevereDrought_pdsi_PM_RC_CO2_Yang;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtExtent_Year.SevereDrought_pdsi_PM_RC_CO2_Yang;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in drought (%)');
title('SevereDrought (PDSI<-3)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_PDSI,'yTick',YTickRange_PDSI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');

%% Add Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')

set(gca,'visible','off')
clearvars -except PDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (2) ModerateDrought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,2)

YlimRange_PDSI = [15,40]; YTickRange_PDSI = [15 : 5 : 40];
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
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical PDSI calculated by PM-RC-Jarvis-H
PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtExtent_Year.ModerateDrought_pdsi_PM_RC_CO2_Yang;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in drought (%)');
title('ModerateDrought (PDSI<-2)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_PDSI,'yTick',YTickRange_PDSI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Add Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except PDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (3) MildDrought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,3)

YlimRange_PDSI = [30,45]; YTickRange_PDSI = [30 : 5 : 45];
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
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical PDSI calculated by PM-RC-Jarvis-H
PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.MildDrought_pdsi_PM_RC_CO2_Yang;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.MildDrought_pdsi_PM_RC_CO2_Yang;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.MildDrought_pdsi_PM_RC_CO2_Yang;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtExtent_Year.MildDrought_pdsi_PM_RC_CO2_Yang;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in drought (%)');
title('MildDrought (PDSI<-1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_PDSI,'yTick',YTickRange_PDSI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Add Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except PDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (4) SevereMoist %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,4)

YlimRange_PDSI = [5,30]; YTickRange_PDSI = [5 : 5 : 30];
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
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical PDSI calculated by PM-RC-Jarvis-H
PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.SevereMoist_pdsi_PM_RC_CO2_Yang;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.SevereMoist_pdsi_PM_RC_CO2_Yang;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.SevereMoist_pdsi_PM_RC_CO2_Yang;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtExtent_Year.SevereMoist_pdsi_PM_RC_CO2_Yang;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in drought (%)');
title('SevereMoist (PDSI>3)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_PDSI,'yTick',YTickRange_PDSI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Add Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except PDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (5) ModerateMoist %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5)

YlimRange_PDSI = [15,40]; YTickRange_PDSI = [15 : 5 : 40];
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
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical PDSI calculated by PM-RC-Jarvis-H
PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtExtent_Year.ModerateMoist_pdsi_PM_RC_CO2_Yang;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in drought (%)');
title('ModerateMoist (PDSI>2)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_PDSI,'yTick',YTickRange_PDSI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Add Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except PDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (6) MildMoist %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,6)

YlimRange_PDSI = [25,45]; YTickRange_PDSI = [25 : 5 : 45];
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
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical PDSI calculated by PM-RC-Jarvis-H
PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.MildMoist_pdsi_PM_RC_CO2_Yang;
Ensemble_Mean_PDSI_Historical = nanmean(PDSI_Historical)';
c95_PDSI_Historical = (std(PDSI_Historical)./sqrt(size(PDSI_Historical,1))).*1.28;% 80% confidence interval
c95_PDSI_Historical = c95_PDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_PDSI_Historical - c95_PDSI_Historical; flipud(Ensemble_Mean_PDSI_Historical + c95_PDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP PDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.MildMoist_pdsi_PM_RC_CO2_Yang;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).DroughtExtent_Year.MildMoist_pdsi_PM_RC_CO2_Yang;
    end
    PDSI_ssp = PDSI_Year(i_ssp).DroughtExtent_Year.MildMoist_pdsi_PM_RC_CO2_Yang;
    PDSI_ssp = [PDSI_Historical(:,end) , PDSI_ssp];
    Ensemble_Mean_PDSI_ssp(:,i_ssp-1) = nanmean(PDSI_ssp)';
    c95_PDSI_ssp = (std(PDSI_ssp)./sqrt(size(PDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_PDSI_ssp = c95_PDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_PDSI_ssp(:,i_ssp-1) - c95_PDSI_ssp; flipud(Ensemble_Mean_PDSI_ssp(:,i_ssp-1) + c95_PDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_PDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_PDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_PDSI(1) YlimRange_PDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in drought (%)');
title('MildMoist (PDSI>1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_PDSI,'yTick',YTickRange_PDSI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Add Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except PDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

end
