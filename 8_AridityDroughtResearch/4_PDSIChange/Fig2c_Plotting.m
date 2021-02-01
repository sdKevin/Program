function Fig2c_Plotting(PDSI_Year)
% Drawing PDSI calculated by PM_RC
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
figure
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
end
