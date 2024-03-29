function Fig4f_Plotting(scPDSI_Year)
% Drawing Drought Extent calculated by scPDSI PM_RC
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

YlimRange_scPDSI = [5,40]; YTickRange_scPDSI = [5 : 10 : 40];
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
scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.SevereDrought_scpdsi_PM_RC;
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
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.SevereDrought_scpdsi_PM_RC;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.SevereDrought_scpdsi_PM_RC;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtExtent_Year.SevereDrought_scpdsi_PM_RC;
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
ylabel('Area in drought (%)');
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

YlimRange_scPDSI = [15,45]; YTickRange_scPDSI = [15 : 10 : 45];
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
scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.ModerateDrought_scpdsi_PM_RC;
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
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.ModerateDrought_scpdsi_PM_RC;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.ModerateDrought_scpdsi_PM_RC;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtExtent_Year.ModerateDrought_scpdsi_PM_RC;
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
ylabel('Area in drought (%)');
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

YlimRange_scPDSI = [30,55]; YTickRange_scPDSI = [20 : 10 : 55];
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
scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.MildDrought_scpdsi_PM_RC;
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
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.MildDrought_scpdsi_PM_RC;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.MildDrought_scpdsi_PM_RC;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtExtent_Year.MildDrought_scpdsi_PM_RC;
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
ylabel('Area in drought (%)');
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

YlimRange_scPDSI = [5,25]; YTickRange_scPDSI = [5 : 5 : 25];
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
scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.SevereMoist_scpdsi_PM_RC;
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
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.SevereMoist_scpdsi_PM_RC;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.SevereMoist_scpdsi_PM_RC;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtExtent_Year.SevereMoist_scpdsi_PM_RC;
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
ylabel('Area in pluvial (%)');
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

YlimRange_scPDSI = [10,30]; YTickRange_scPDSI = [10 : 5 : 30];
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
scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.ModerateMoist_scpdsi_PM_RC;
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
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.ModerateMoist_scpdsi_PM_RC;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.ModerateMoist_scpdsi_PM_RC;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtExtent_Year.ModerateMoist_scpdsi_PM_RC;
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
ylabel('Area in pluvial (%)');
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

YlimRange_scPDSI = [25,40]; YTickRange_scPDSI = [25 : 5 : 40];
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
scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.MildMoist_scpdsi_PM_RC;
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
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.MildMoist_scpdsi_PM_RC;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).DroughtExtent_Year.MildMoist_scpdsi_PM_RC;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).DroughtExtent_Year.MildMoist_scpdsi_PM_RC;
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
ylabel('Area in pluvial (%)');
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
