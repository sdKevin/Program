function Fig5e_Plotting(scPDSI_Year)
% Drawing Drought Extent calculated by scPDSI PM_RC_CO2_Yang
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

YlimRange_scPDSI = [0.5,3]; YTickRange_scPDSI = [0.5 : 0.5 : 3];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical scPDSI calculated by PM-RC-Jarvis-H
scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_scpdsi_PM_RC_CO2_Yang;
Ensemble_Mean_scPDSI_Historical = nanmean(scPDSI_Historical)';
c95_scPDSI_Historical = (std(scPDSI_Historical)./sqrt(size(scPDSI_Historical,1))).*1.28;% 80% confidence interval
c95_scPDSI_Historical = c95_scPDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_scPDSI_Historical - c95_scPDSI_Historical; flipud(Ensemble_Mean_scPDSI_Historical + c95_scPDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP scPDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_scpdsi_PM_RC_CO2_Yang;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.SevereDrought_scpdsi_PM_RC_CO2_Yang;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtFrequency_GMYear.SevereDrought_scpdsi_PM_RC_CO2_Yang;
    scPDSI_ssp = [scPDSI_Historical(:,end) , scPDSI_ssp];
    Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) = nanmean(scPDSI_ssp)';
    c95_scPDSI_ssp = (std(scPDSI_ssp)./sqrt(size(scPDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_scPDSI_ssp = c95_scPDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) - c95_scPDSI_ssp; flipud(Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) + c95_scPDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_scPDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_scPDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Month under drought');
title('SevereDrought (scPDSI<-3)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_scPDSI,'yTick',YTickRange_scPDSI,...
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
clearvars -except scPDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (2) ModerateDrought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,2)

YlimRange_scPDSI = [1.5,3.5]; YTickRange_scPDSI = [1.5 : 0.5 : 3.5];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical scPDSI calculated by PM-RC-Jarvis-H
scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.ModerateDrought_scpdsi_PM_RC_CO2_Yang;
Ensemble_Mean_scPDSI_Historical = nanmean(scPDSI_Historical)';
c95_scPDSI_Historical = (std(scPDSI_Historical)./sqrt(size(scPDSI_Historical,1))).*1.28;% 80% confidence interval
c95_scPDSI_Historical = c95_scPDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_scPDSI_Historical - c95_scPDSI_Historical; flipud(Ensemble_Mean_scPDSI_Historical + c95_scPDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP scPDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.ModerateDrought_scpdsi_PM_RC_CO2_Yang;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.ModerateDrought_scpdsi_PM_RC_CO2_Yang;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtFrequency_GMYear.ModerateDrought_scpdsi_PM_RC_CO2_Yang;
    scPDSI_ssp = [scPDSI_Historical(:,end) , scPDSI_ssp];
    Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) = nanmean(scPDSI_ssp)';
    c95_scPDSI_ssp = (std(scPDSI_ssp)./sqrt(size(scPDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_scPDSI_ssp = c95_scPDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) - c95_scPDSI_ssp; flipud(Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) + c95_scPDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_scPDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_scPDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Month under drought');
title('ModerateDrought (scPDSI<-2)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_scPDSI,'yTick',YTickRange_scPDSI,...
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
clearvars -except scPDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (3) MildDrought %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,3)

YlimRange_scPDSI = [3,4.5]; YTickRange_scPDSI = [3 : 0.5 : 4.5];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical scPDSI calculated by PM-RC-Jarvis-H
scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.MildDrought_scpdsi_PM_RC_CO2_Yang;
Ensemble_Mean_scPDSI_Historical = nanmean(scPDSI_Historical)';
c95_scPDSI_Historical = (std(scPDSI_Historical)./sqrt(size(scPDSI_Historical,1))).*1.28;% 80% confidence interval
c95_scPDSI_Historical = c95_scPDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_scPDSI_Historical - c95_scPDSI_Historical; flipud(Ensemble_Mean_scPDSI_Historical + c95_scPDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP scPDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.MildDrought_scpdsi_PM_RC_CO2_Yang;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.MildDrought_scpdsi_PM_RC_CO2_Yang;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtFrequency_GMYear.MildDrought_scpdsi_PM_RC_CO2_Yang;
    scPDSI_ssp = [scPDSI_Historical(:,end) , scPDSI_ssp];
    Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) = nanmean(scPDSI_ssp)';
    c95_scPDSI_ssp = (std(scPDSI_ssp)./sqrt(size(scPDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_scPDSI_ssp = c95_scPDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) - c95_scPDSI_ssp; flipud(Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) + c95_scPDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_scPDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_scPDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Month under drought');
title('MildDrought (scPDSI<-1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_scPDSI,'yTick',YTickRange_scPDSI,...
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
clearvars -except scPDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (4) SevereMoist %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,4)

YlimRange_scPDSI = [0.5,4]; YTickRange_scPDSI = [0.5 : 0.5 : 4];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical scPDSI calculated by PM-RC-Jarvis-H
scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.SevereMoist_scpdsi_PM_RC_CO2_Yang;
Ensemble_Mean_scPDSI_Historical = nanmean(scPDSI_Historical)';
c95_scPDSI_Historical = (std(scPDSI_Historical)./sqrt(size(scPDSI_Historical,1))).*1.28;% 80% confidence interval
c95_scPDSI_Historical = c95_scPDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_scPDSI_Historical - c95_scPDSI_Historical; flipud(Ensemble_Mean_scPDSI_Historical + c95_scPDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP scPDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.SevereMoist_scpdsi_PM_RC_CO2_Yang;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.SevereMoist_scpdsi_PM_RC_CO2_Yang;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtFrequency_GMYear.SevereMoist_scpdsi_PM_RC_CO2_Yang;
    scPDSI_ssp = [scPDSI_Historical(:,end) , scPDSI_ssp];
    Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) = nanmean(scPDSI_ssp)';
    c95_scPDSI_ssp = (std(scPDSI_ssp)./sqrt(size(scPDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_scPDSI_ssp = c95_scPDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) - c95_scPDSI_ssp; flipud(Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) + c95_scPDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_scPDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_scPDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Month under drought');
title('SevereMoist (scPDSI>3)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_scPDSI,'yTick',YTickRange_scPDSI,...
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
clearvars -except scPDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (5) ModerateMoist %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5)

YlimRange_scPDSI = [1.5,4.5]; YTickRange_scPDSI = [1.5 : 0.5 : 4.5];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical scPDSI calculated by PM-RC-Jarvis-H
scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.ModerateMoist_scpdsi_PM_RC_CO2_Yang;
Ensemble_Mean_scPDSI_Historical = nanmean(scPDSI_Historical)';
c95_scPDSI_Historical = (std(scPDSI_Historical)./sqrt(size(scPDSI_Historical,1))).*1.28;% 80% confidence interval
c95_scPDSI_Historical = c95_scPDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_scPDSI_Historical - c95_scPDSI_Historical; flipud(Ensemble_Mean_scPDSI_Historical + c95_scPDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP scPDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.ModerateMoist_scpdsi_PM_RC_CO2_Yang;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.ModerateMoist_scpdsi_PM_RC_CO2_Yang;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtFrequency_GMYear.ModerateMoist_scpdsi_PM_RC_CO2_Yang;
    scPDSI_ssp = [scPDSI_Historical(:,end) , scPDSI_ssp];
    Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) = nanmean(scPDSI_ssp)';
    c95_scPDSI_ssp = (std(scPDSI_ssp)./sqrt(size(scPDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_scPDSI_ssp = c95_scPDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) - c95_scPDSI_ssp; flipud(Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) + c95_scPDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_scPDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_scPDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Month under drought');
title('ModerateMoist (scPDSI>2)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_scPDSI,'yTick',YTickRange_scPDSI,...
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
clearvars -except scPDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

%% (6) MildMoist %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,6)

YlimRange_scPDSI = [2.5,5]; YTickRange_scPDSI = [2.5 : 0.5 : 5];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_scPDSI(1); YlimRange_scPDSI(1); YlimRange_scPDSI(2); YlimRange_scPDSI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical scPDSI calculated by PM-RC-Jarvis-H
scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.MildMoist_scpdsi_PM_RC_CO2_Yang;
Ensemble_Mean_scPDSI_Historical = nanmean(scPDSI_Historical)';
c95_scPDSI_Historical = (std(scPDSI_Historical)./sqrt(size(scPDSI_Historical,1))).*1.28;% 80% confidence interval
c95_scPDSI_Historical = c95_scPDSI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_scPDSI_Historical - c95_scPDSI_Historical; flipud(Ensemble_Mean_scPDSI_Historical + c95_scPDSI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP scPDSI calculated by PM-RC-Jarvis-H
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.MildMoist_scpdsi_PM_RC_CO2_Yang;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtFrequency_GMYear.MildMoist_scpdsi_PM_RC_CO2_Yang;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtFrequency_GMYear.MildMoist_scpdsi_PM_RC_CO2_Yang;
    scPDSI_ssp = [scPDSI_Historical(:,end) , scPDSI_ssp];
    Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) = nanmean(scPDSI_ssp)';
    c95_scPDSI_ssp = (std(scPDSI_ssp)./sqrt(size(scPDSI_ssp,1))).*1.28; % 80% confidence interval
    c95_scPDSI_ssp = c95_scPDSI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) - c95_scPDSI_ssp; flipud(Ensemble_Mean_scPDSI_ssp(:,i_ssp-1) + c95_scPDSI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_scPDSI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_scPDSI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_scPDSI(1) YlimRange_scPDSI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Month under drought');
title('MildMoist (scPDSI>1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_scPDSI,'yTick',YTickRange_scPDSI,...
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
clearvars -except scPDSI_Year RGB_Historical_Shade RGB_Historical_Line RGB_ssp_Shade RGB_ssp_Line HatchAngle_ssp

end
