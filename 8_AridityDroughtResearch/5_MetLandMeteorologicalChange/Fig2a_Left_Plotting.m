function Fig2a_Left_Plotting(Met_Land_Year)
figure
disp('Adjust figure, then press Enter.');
pause();
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1)
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Pr
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Pr = [0.9,1.2]; YTickRange_Pr = [0.9:0.1:1.2];
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
Pr_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Pr;
Ensemble_Mean_Pr_Historical = nanmean(Pr_Historical)';
c95_Pr_Historical = (std(Pr_Historical)./sqrt(size(Pr_Historical,1))).*1.96; % 80% confidence interval
c95_Pr_Historical = c95_Pr_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Pr_Historical - c95_Pr_Historical; flipud(Ensemble_Mean_Pr_Historical + c95_Pr_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario Pr
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Pr_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Pr;
        Pr_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        Pr_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Pr;
    end
    Pr_ssp = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Pr;
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
ylabel('Month under drought');
title('Pr<10th Percentile')
set(gca,'xlim',[1948,2100],'ylim',YlimRange_Pr,'yTick',YTickRange_Pr,...
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
    'Location','SouthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr-ET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2)
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Pr-ET
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Pr_ET = [0.9,1.4]; YTickRange_Pr_ET = [0.9:0.1:1.4];
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
Pr_ET_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Pr_ET;
Ensemble_Mean_Pr_ET_Historical = nanmean(Pr_ET_Historical)';
c95_Pr_ET_Historical = (std(Pr_ET_Historical)./sqrt(size(Pr_ET_Historical,1))).*1.96; % 80% confidence interval
c95_Pr_ET_Historical = c95_Pr_ET_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Pr_ET_Historical - c95_Pr_ET_Historical; flipud(Ensemble_Mean_Pr_ET_Historical + c95_Pr_ET_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario Pr_ET
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Pr_ET_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Pr_ET;
        Pr_ET_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        Pr_ET_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Pr_ET;
    end
    Pr_ET_ssp = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Pr_ET;
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
ylabel('Month under drought');
title('Pr-ET<10th Percentile')
set(gca,'xlim',[1948,2100],'ylim',YlimRange_Pr_ET,'yTick',YTickRange_Pr_ET,...
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
subplot(2,2,3)
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Q
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Q = [0.6,1.1]; YTickRange_Q = [0.6:0.1:1.1];
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
Q_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Q;
Ensemble_Mean_Q_Historical = nanmean(Q_Historical)';
c95_Q_Historical = (std(Q_Historical)./sqrt(size(Q_Historical,1))).*1.96; % 80% confidence interval
c95_Q_Historical = c95_Q_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Q_Historical - c95_Q_Historical; flipud(Ensemble_Mean_Q_Historical + c95_Q_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario Q
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Q_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Q;
        Q_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        Q_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Q;
    end
    Q_ssp = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Q;
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
ylabel('Month under drought');
title('Q<10th Percentile');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_Q,'yTick',YTickRange_Q,...
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
subplot(2,2,4)
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% SM
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_SM = [0.7,3.1]; YTickRange_SM = [0.5:0.5:3.5];
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
SM_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.SM;
Ensemble_Mean_SM_Historical = nanmean(SM_Historical)';
c95_SM_Historical = (std(SM_Historical)./sqrt(size(SM_Historical,1))).*1.96; % 80% confidence interval
c95_SM_Historical = c95_SM_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_SM_Historical - c95_SM_Historical; flipud(Ensemble_Mean_SM_Historical + c95_SM_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;

% Scenario SM
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        SM_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.SM;
        SM_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        SM_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.SM;
    end
    SM_ssp = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.SM;
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
ylabel('Month under drought');
title('SoilMoisture<10th Percentile')
set(gca,'xlim',[1948,2100],'ylim',YlimRange_SM,'yTick',YTickRange_SM,...
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
