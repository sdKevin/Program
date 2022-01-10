function Fig1_Left_Plotting(Met_Land_Year)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Pr
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
XlimRange = [1850,2100];
YlimRange_Pr = [7.5,14]; YTickRange_Pr = [7:2:14];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_Pr(1); YlimRange_Pr(1); YlimRange_Pr(2); YlimRange_Pr(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_Pr(1); YlimRange_Pr(1); YlimRange_Pr(2); YlimRange_Pr(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Pr(1) YlimRange_Pr(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical Pr
Pr_Historical = Met_Land_Year(1).DroughtExtent_Year.Pr;
Ensemble_Mean_Pr_Historical = nanmean(Pr_Historical)';
c95_Pr_Historical = (std(Pr_Historical)./sqrt(size(Pr_Historical,1))).*1.96; % 80% confidence interval
c95_Pr_Historical = c95_Pr_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Pr_Historical - c95_Pr_Historical; flipud(Ensemble_Mean_Pr_Historical + c95_Pr_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario Pr
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Pr_Historical = Met_Land_Year(1).DroughtExtent_Year.Pr;
        Pr_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        Pr_Historical = Met_Land_Year(1).DroughtExtent_Year.Pr;
    end
    Pr_ssp = Met_Land_Year(i_ssp).DroughtExtent_Year.Pr;
    Pr_ssp = [Pr_Historical(:,end) , Pr_ssp];
    Ensemble_Mean_Pr_ssp(:,i_ssp-1) = nanmean(Pr_ssp)';
    c95_Pr_ssp = (std(Pr_ssp)./sqrt(size(Pr_ssp,1))).*1.96; % 80% confidence interval
    c95_Pr_ssp = c95_Pr_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_Pr_ssp(:,i_ssp-1) - c95_Pr_ssp; flipud(Ensemble_Mean_Pr_ssp(:,i_ssp-1) + c95_Pr_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_Pr_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_Pr_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot([2014:2100],Ensemble_Mean_Pr_ssp(:,i_ssp),':',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Pr(1) YlimRange_Pr(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in Drought (%)');
title('Pr<10th Percentile')
set(gca,'xlim',XlimRange,'ylim',YlimRange_Pr,'yTick',YTickRange_Pr,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,':','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr-ET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Pr-ET
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
XlimRange = [1850,2100];
YlimRange_Pr_ET = [8,16]; YTickRange_Pr_ET = [8:2:16];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_Pr_ET(1); YlimRange_Pr_ET(1); YlimRange_Pr_ET(2); YlimRange_Pr_ET(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_Pr_ET(1); YlimRange_Pr_ET(1); YlimRange_Pr_ET(2); YlimRange_Pr_ET(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Pr_ET(1) YlimRange_Pr_ET(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical Pr_ET
Pr_ET_Historical = Met_Land_Year(1).DroughtExtent_Year.Pr_ET;
Ensemble_Mean_Pr_ET_Historical = nanmean(Pr_ET_Historical)';
c95_Pr_ET_Historical = (std(Pr_ET_Historical)./sqrt(size(Pr_ET_Historical,1))).*1.96; % 80% confidence interval
c95_Pr_ET_Historical = c95_Pr_ET_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Pr_ET_Historical - c95_Pr_ET_Historical; flipud(Ensemble_Mean_Pr_ET_Historical + c95_Pr_ET_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario Pr_ET
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Pr_ET_Historical = Met_Land_Year(1).DroughtExtent_Year.Pr_ET;
        Pr_ET_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        Pr_ET_Historical = Met_Land_Year(1).DroughtExtent_Year.Pr_ET;
    end
    Pr_ET_ssp = Met_Land_Year(i_ssp).DroughtExtent_Year.Pr_ET;
    Pr_ET_ssp = [Pr_ET_Historical(:,end) , Pr_ET_ssp];
    Ensemble_Mean_Pr_ET_ssp(:,i_ssp-1) = nanmean(Pr_ET_ssp)';
    c95_Pr_ET_ssp = (std(Pr_ET_ssp)./sqrt(size(Pr_ET_ssp,1))).*1.96; % 80% confidence interval
    c95_Pr_ET_ssp = c95_Pr_ET_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_Pr_ET_ssp(:,i_ssp-1) - c95_Pr_ET_ssp; flipud(Ensemble_Mean_Pr_ET_ssp(:,i_ssp-1) + c95_Pr_ET_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_Pr_ET_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_Pr_ET_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot([2014:2100],Ensemble_Mean_Pr_ET_ssp(:,i_ssp),':',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Pr_ET(1) YlimRange_Pr_ET(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in Drought (%)');
title('Pr-ET<10th Percentile')
set(gca,'xlim',XlimRange,'ylim',YlimRange_Pr_ET,'yTick',YTickRange_Pr_ET,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,':','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Q
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
XlimRange = [1850,2100];
YlimRange_Q = [6,17.5]; YTickRange_Q = [6:2:17];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_Q(1); YlimRange_Q(1); YlimRange_Q(2); YlimRange_Q(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_Q(1); YlimRange_Q(1); YlimRange_Q(2); YlimRange_Q(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Q(1) YlimRange_Q(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical Q
Q_Historical = Met_Land_Year(1).DroughtExtent_Year.Q;
Ensemble_Mean_Q_Historical = nanmean(Q_Historical)';
c95_Q_Historical = (std(Q_Historical)./sqrt(size(Q_Historical,1))).*1.96; % 80% confidence interval
c95_Q_Historical = c95_Q_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Q_Historical - c95_Q_Historical; flipud(Ensemble_Mean_Q_Historical + c95_Q_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario Q
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Q_Historical = Met_Land_Year(1).DroughtExtent_Year.Q;
        Q_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        Q_Historical = Met_Land_Year(1).DroughtExtent_Year.Q;
    end
    Q_ssp = Met_Land_Year(i_ssp).DroughtExtent_Year.Q;
    Q_ssp = [Q_Historical(:,end) , Q_ssp];
    Ensemble_Mean_Q_ssp(:,i_ssp-1) = nanmean(Q_ssp)';
    c95_Q_ssp = (std(Q_ssp)./sqrt(size(Q_ssp,1))).*1.96; % 80% confidence interval
    c95_Q_ssp = c95_Q_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_Q_ssp(:,i_ssp-1) - c95_Q_ssp; flipud(Ensemble_Mean_Q_ssp(:,i_ssp-1) + c95_Q_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_Q_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_Q_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot([2014:2100],Ensemble_Mean_Q_ssp(:,i_ssp),':',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Q(1) YlimRange_Q(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in Drought (%)');
title('Q<10th Percentile');
set(gca,'xlim',XlimRange,'ylim',YlimRange_Q,'yTick',YTickRange_Q,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,':','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% SM
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
XlimRange = [1850,2100];
YlimRange_SM = [7,32]; YTickRange_SM = [5:5:30];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_SM(1); YlimRange_SM(1); YlimRange_SM(2); YlimRange_SM(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_SM(1); YlimRange_SM(1); YlimRange_SM(2); YlimRange_SM(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_SM(1) YlimRange_SM(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical SM
SM_Historical = Met_Land_Year(1).DroughtExtent_Year.SM;
Ensemble_Mean_SM_Historical = nanmean(SM_Historical)';
c95_SM_Historical = (std(SM_Historical)./sqrt(size(SM_Historical,1))).*1.96; % 80% confidence interval
c95_SM_Historical = c95_SM_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_SM_Historical - c95_SM_Historical; flipud(Ensemble_Mean_SM_Historical + c95_SM_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario SM
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        SM_Historical = Met_Land_Year(1).DroughtExtent_Year.SM;
        SM_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        SM_Historical = Met_Land_Year(1).DroughtExtent_Year.SM;
    end
    SM_ssp = Met_Land_Year(i_ssp).DroughtExtent_Year.SM;
    SM_ssp = [SM_Historical(:,end) , SM_ssp];
    Ensemble_Mean_SM_ssp(:,i_ssp-1) = nanmean(SM_ssp)';
    c95_SM_ssp = (std(SM_ssp)./sqrt(size(SM_ssp,1))).*1.96; % 80% confidence interval
    c95_SM_ssp = c95_SM_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_SM_ssp(:,i_ssp-1) - c95_SM_ssp; flipud(Ensemble_Mean_SM_ssp(:,i_ssp-1) + c95_SM_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_SM_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_SM_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot([2014:2100],Ensemble_Mean_SM_ssp(:,i_ssp),':',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_SM(1) YlimRange_SM(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in Drought (%)');
title('SoilMoisture<10th Percentile')
set(gca,'xlim',XlimRange,'ylim',YlimRange_SM,'yTick',YTickRange_SM,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,':','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CompoundDrought1 (Met&Hyd Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% CompoundDrought1
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
XlimRange = [1850,2100];
YlimRange_CD1 = [2,8]; YTickRange_CD1 = [2:1:8];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_CD1(1); YlimRange_CD1(1); YlimRange_CD1(2); YlimRange_CD1(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_CD1(1); YlimRange_CD1(1); YlimRange_CD1(2); YlimRange_CD1(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_CD1(1) YlimRange_CD1(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical CompoundDrought1
CD1_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought1;
Ensemble_Mean_CD1_Historical = nanmean(CD1_Historical)';
c95_CD1_Historical = (std(CD1_Historical)./sqrt(size(CD1_Historical,1))).*1.96; % 80% confidence interval
c95_CD1_Historical = c95_CD1_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD1_Historical - c95_CD1_Historical; flipud(Ensemble_Mean_CD1_Historical + c95_CD1_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario CD1
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        CD1_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought1;
        CD1_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        CD1_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought1;
    end
    CD1_ssp = Met_Land_Year(i_ssp).DroughtExtent_Year.CompoundDrought1;
    CD1_ssp = [CD1_Historical(:,end) , CD1_ssp];
    Ensemble_Mean_CD1_ssp(:,i_ssp-1) = nanmean(CD1_ssp)';
    c95_CD1_ssp = (std(CD1_ssp)./sqrt(size(CD1_ssp,1))).*1.96; % 80% confidence interval
    c95_CD1_ssp = c95_CD1_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_CD1_ssp(:,i_ssp-1) - c95_CD1_ssp; flipud(Ensemble_Mean_CD1_ssp(:,i_ssp-1) + c95_CD1_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_CD1_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_CD1_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot([2014:2100],Ensemble_Mean_CD1_ssp(:,i_ssp),':',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_CD1(1) YlimRange_CD1(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in Drought (%)');
title('Pr and Q <10th Percentile')
set(gca,'xlim',XlimRange,'ylim',YlimRange_CD1,'yTick',YTickRange_CD1,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,':','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CompoundDrought2 (Met&Agr Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% CompoundDrought1
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
XlimRange = [1850,2100];
YlimRange_CD2 = [1,8]; YTickRange_CD2 = [1:1:8];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_CD2(1); YlimRange_CD2(1); YlimRange_CD2(2); YlimRange_CD2(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_CD2(1); YlimRange_CD2(1); YlimRange_CD2(2); YlimRange_CD2(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_CD2(1) YlimRange_CD2(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical CompoundDrought1
CD2_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought2;
Ensemble_Mean_CD2_Historical = nanmean(CD2_Historical)';
c95_CD2_Historical = (std(CD2_Historical)./sqrt(size(CD2_Historical,1))).*1.96; % 80% confidence interval
c95_CD2_Historical = c95_CD2_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD2_Historical - c95_CD2_Historical; flipud(Ensemble_Mean_CD2_Historical + c95_CD2_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario CD2
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        CD2_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought2;
        CD2_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        CD2_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought2;
    end
    CD2_ssp = Met_Land_Year(i_ssp).DroughtExtent_Year.CompoundDrought2;
    CD2_ssp = [CD2_Historical(:,end) , CD2_ssp];
    Ensemble_Mean_CD2_ssp(:,i_ssp-1) = nanmean(CD2_ssp)';
    c95_CD2_ssp = (std(CD2_ssp)./sqrt(size(CD2_ssp,1))).*1.96; % 80% confidence interval
    c95_CD2_ssp = c95_CD2_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_CD2_ssp(:,i_ssp-1) - c95_CD2_ssp; flipud(Ensemble_Mean_CD2_ssp(:,i_ssp-1) + c95_CD2_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_CD2_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_CD2_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot([2014:2100],Ensemble_Mean_CD2_ssp(:,i_ssp),':',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_CD2(1) YlimRange_CD2(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in Drought (%)');
title('Pr and SM <10th Percentile')
set(gca,'xlim',XlimRange,'ylim',YlimRange_CD2,'yTick',YTickRange_CD2,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,':','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CompoundDrought3 (Hyd&Agr Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% CompoundDrought1
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
XlimRange = [1850,2100];
YlimRange_CD3 = [2,12]; YTickRange_CD3 = [2:1:12];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_CD3(1); YlimRange_CD3(1); YlimRange_CD3(2); YlimRange_CD3(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_CD3(1); YlimRange_CD3(1); YlimRange_CD3(2); YlimRange_CD3(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_CD3(1) YlimRange_CD3(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical CompoundDrought1
CD3_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought3;
Ensemble_Mean_CD3_Historical = nanmean(CD3_Historical)';
c95_CD3_Historical = (std(CD3_Historical)./sqrt(size(CD3_Historical,1))).*1.96; % 80% confidence interval
c95_CD3_Historical = c95_CD3_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD3_Historical - c95_CD3_Historical; flipud(Ensemble_Mean_CD3_Historical + c95_CD3_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario CD3
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        CD3_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought3;
        CD3_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        CD3_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought3;
    end
    CD3_ssp = Met_Land_Year(i_ssp).DroughtExtent_Year.CompoundDrought3;
    CD3_ssp = [CD3_Historical(:,end) , CD3_ssp];
    Ensemble_Mean_CD3_ssp(:,i_ssp-1) = nanmean(CD3_ssp)';
    c95_CD3_ssp = (std(CD3_ssp)./sqrt(size(CD3_ssp,1))).*1.96; % 80% confidence interval
    c95_CD3_ssp = c95_CD3_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_CD3_ssp(:,i_ssp-1) - c95_CD3_ssp; flipud(Ensemble_Mean_CD3_ssp(:,i_ssp-1) + c95_CD3_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_CD3_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_CD3_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot([2014:2100],Ensemble_Mean_CD3_ssp(:,i_ssp),':',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_CD3(1) YlimRange_CD3(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in Drought (%)');
title('Q and SM <10th Percentile')
set(gca,'xlim',XlimRange,'ylim',YlimRange_CD3,'yTick',YTickRange_CD3,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,':','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CompoundDrought (Met&Hyd&Agr Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% CompoundDrought1
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
XlimRange = [1850,2100];
YlimRange_CD = [0.5,5.5]; YTickRange_CD = [0.5:1:5.5];
%% Three time windows
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_CD(1); YlimRange_CD(1); YlimRange_CD(2); YlimRange_CD(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_CD(1); YlimRange_CD(1); YlimRange_CD(2); YlimRange_CD(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_CD(1) YlimRange_CD(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical CompoundDrought1
CD_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))).*1.96; % 80% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario CD
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        CD_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought;
        CD_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        CD_Historical = Met_Land_Year(1).DroughtExtent_Year.CompoundDrought;
    end
    CD_ssp = Met_Land_Year(i_ssp).DroughtExtent_Year.CompoundDrought;
    CD_ssp = [CD_Historical(:,end) , CD_ssp];
    Ensemble_Mean_CD_ssp(:,i_ssp-1) = nanmean(CD_ssp)';
    c95_CD_ssp = (std(CD_ssp)./sqrt(size(CD_ssp,1))).*1.96; % 80% confidence interval
    c95_CD_ssp = c95_CD_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_CD_ssp(:,i_ssp-1) - c95_CD_ssp; flipud(Ensemble_Mean_CD_ssp(:,i_ssp-1) + c95_CD_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_CD_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_CD_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot([2014:2100],Ensemble_Mean_CD_ssp(:,i_ssp),':',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_CD(1) YlimRange_CD(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Area in Drought (%)');
title('Pr, Q and SM <10th Percentile')
set(gca,'xlim',XlimRange,'ylim',YlimRange_CD,'yTick',YTickRange_CD,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,':','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year
end
