function Fig2_Plotting(PDSI_Year , scPDSI_Year)
%% Drawing PDSI calculated by PM_RC_CO2_Jarvis_H %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
disp('Adjust figure, then press Enter')
pause()
subplot(2,3,1)
%% Data Smooth
% for ii = [2 : length(PDSI_Year)-1 , 1]
%     for iii = 1 : size(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H,1)
%
%         % HadGEM3-GC31-LL does not have ssp370
%         if ii == 4 && iii>=16
%             % PDSI_Year Smooth
%             PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H(iii,:) = ...
%                 smooth(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H(iii,:) , 7);
%         else
%             % PDSI_Year Smooth
%             PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H(iii,:) = ...
%                 smooth(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H(iii,:) , 7);
%         end
%
%     end
% end
% clear ii iii
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
HatchAngle_ssp = [65,115,65,115];

YlimRange_PDSI = [-1,2]; YTickRange_PDSI = [-1 : 1 : 2];

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
PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H;
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
        PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H;
    end
    PDSI_ssp = PDSI_Year(i_ssp).PDSI_Year.pdsi_PM_RC_CO2_Jarvis_H;
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
ylabel('PDSI');
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


%% Drawing PDSI calculated by PM_RC_CO2_Yang %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,2)
%% Data Smooth
% for ii = [2 : length(PDSI_Year)-1 , 1]
%     for iii = 1 : size(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Yang,1)
%
%         % HadGEM3-GC31-LL does not have ssp370
%         if ii == 4 && iii>=16
%             % PDSI_Year Smooth
%             PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Yang(iii,:) = ...
%                 smooth(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Yang(iii,:) , 7);
%         else
%             % PDSI_Year Smooth
%             PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Yang(iii,:) = ...
%                 smooth(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC_CO2_Yang(iii,:) , 7);
%         end
%
%     end
% end
% clear ii iii
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
HatchAngle_ssp = [65,115,65,115];

YlimRange_PDSI = [-1,2]; YTickRange_PDSI = [-1 : 1 : 2];

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
PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC_CO2_Yang;
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
        PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC_CO2_Yang;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC_CO2_Yang;
    end
    PDSI_ssp = PDSI_Year(i_ssp).PDSI_Year.pdsi_PM_RC_CO2_Yang;
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
ylabel('PDSI');
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


%% Drawing PDSI calculated by PM_RC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,3)
%% Data Smooth
% for ii = [2 : length(PDSI_Year)-1 , 1]
%     for iii = 1 : size(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC,1)
%
%         % HadGEM3-GC31-LL does not have ssp370
%         if ii == 4 && iii>=16
%             % PDSI_Year Smooth
%             PDSI_Year(ii).PDSI_Year.pdsi_PM_RC(iii,:) = ...
%                 smooth(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC(iii,:) , 7);
%         else
%             % PDSI_Year Smooth
%             PDSI_Year(ii).PDSI_Year.pdsi_PM_RC(iii,:) = ...
%                 smooth(PDSI_Year(ii).PDSI_Year.pdsi_PM_RC(iii,:) , 7);
%         end
%
%     end
% end
% clear ii iii
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
HatchAngle_ssp = [65,115,65,115];

YlimRange_PDSI = [-1,2]; YTickRange_PDSI = [-1 : 1 : 2];

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
PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC;
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
        PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC;
        PDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        PDSI_Historical = PDSI_Year(1).PDSI_Year.pdsi_PM_RC;
    end
    PDSI_ssp = PDSI_Year(i_ssp).PDSI_Year.pdsi_PM_RC;
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
ylabel('PDSI');
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

%% Drawing scPDSI calculated by PM_RC_CO2_Jarvis_H %%%%%%%%%%%%%%%%%%
subplot(2,3,4)
%% Data Smooth
% for ii = [2 : length(scPDSI_Year)-1 , 1]
%     for iii = 1 : size(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H,1)
%
%         % HadGEM3-GC31-LL does not have ssp370
%         if ii == 4 && iii>=16
%             % scPDSI_Year Smooth
%             scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H(iii,:) = ...
%                 smooth(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H(iii,:) , 7);
%         else
%             % scPDSI_Year Smooth
%             scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H(iii,:) = ...
%                 smooth(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H(iii,:) , 7);
%         end
%
%     end
% end
% clear ii iii
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
HatchAngle_ssp = [65,115,65,115];

YlimRange_scPDSI = [-1,2]; YTickRange_scPDSI = [-1 : 1 : 2];

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
scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H;
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
        scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H;
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
ylabel('scPDSI');
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

%% Drawing scPDSI calculated by PM_RC_CO2_Yang %%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5)
%% Data Smooth
% for ii = [2 : length(scPDSI_Year)-1 , 1]
%     for iii = 1 : size(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Yang,1)
%
%         % HadGEM3-GC31-LL does not have ssp370
%         if ii == 4 && iii>=16
%             % scPDSI_Year Smooth
%             scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Yang(iii,:) = ...
%                 smooth(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Yang(iii,:) , 7);
%         else
%             % scPDSI_Year Smooth
%             scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Yang(iii,:) = ...
%                 smooth(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC_CO2_Yang(iii,:) , 7);
%         end
%
%     end
% end
% clear ii iii
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
HatchAngle_ssp = [65,115,65,115];

YlimRange_scPDSI = [-1,2]; YTickRange_scPDSI = [-1 : 1 : 2];

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
scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC_CO2_Yang;
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
        scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC_CO2_Yang;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC_CO2_Yang;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).scPDSI_Year.scpdsi_PM_RC_CO2_Yang;
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
ylabel('scPDSI');
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

%% Drawing scPDSI calculated by PM_RC
subplot(2,3,6)
%% Data Smooth
% for ii = [2 : length(scPDSI_Year)-1 , 1]
%     for iii = 1 : size(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC,1)
%
%         % HadGEM3-GC31-LL does not have ssp370
%         if ii == 4 && iii>=16
%             % scPDSI_Year Smooth
%             scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC(iii,:) = ...
%                 smooth(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC(iii,:) , 7);
%         else
%             % scPDSI_Year Smooth
%             scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC(iii,:) = ...
%                 smooth(scPDSI_Year(ii).scPDSI_Year.scpdsi_PM_RC(iii,:) , 7);
%         end
%
%     end
% end
% clear ii iii
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
HatchAngle_ssp = [65,115,65,115];

YlimRange_scPDSI = [-1,2]; YTickRange_scPDSI = [-1 : 1 : 2];

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
scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC;
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
        scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC;
        scPDSI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        scPDSI_Historical = scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC;
    end
    scPDSI_ssp = scPDSI_Year(i_ssp).scPDSI_Year.scpdsi_PM_RC;
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
ylabel('scPDSI');
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


end
