function Fig1a_Left_Plotting(Met_Year , Land_Year)
%% Data Smooth
for ii = 1 : length(Met_Year)
    for iii = 1 : size(Met_Year(ii).Met_Year.pr,1)
        Met_Year(ii).Met_Year.pr(iii,:) = ...
            smooth(Met_Year(ii).Met_Year.pr(iii,:) , 10);
    end
end
clear ii iii
for ii = 1 : length(Land_Year)
    for iii = 1 : size(Land_Year(ii).Land_Year.evspsbl,1)
        Land_Year(ii).Land_Year.evspsbl(iii,:) = ...
            smooth(Land_Year(ii).Land_Year.evspsbl(iii,:) , 10);
        Land_Year(ii).Land_Year.mrso(iii,:) = ...
            smooth(Land_Year(ii).Land_Year.mrso(iii,:) , 10);
        Land_Year(ii).Land_Year.mrro(iii,:) = ...
            smooth(Land_Year(ii).Land_Year.mrro(iii,:) , 10);
    end
end
clear ii iii

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Pr
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Pr = [-10,120]; YTickRange_Pr = [-20:20:120]; YTickLabel_Pr = {'';'0';'';'40';'';'80';'';'120'};
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
% pr kg/(m2s) to mm/year
Pr_Historical = Met_Year(1).Met_Year.pr .* 1000.*31536000./997;
Pr_Historical = Pr_Historical - repmat(mean(Pr_Historical(:,99:165),2),1,165); % Change to Anomaly
Ensemble_Mean_Pr_Historical = nanmean(Pr_Historical)';
c95_Pr_Historical = (std(Pr_Historical)./sqrt(size(Pr_Historical,1))).*1.96; % 80% confidence interval
c95_Pr_Historical = c95_Pr_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Pr_Historical - c95_Pr_Historical; flipud(Ensemble_Mean_Pr_Historical + c95_Pr_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;

% Scenario Pr
% pr kg/(m2s) to mm/year
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Pr_Historical = Met_Year(1).Met_Year.pr .* 1000.*31536000./997;
        Pr_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        Pr_Historical = Met_Year(1).Met_Year.pr .* 1000.*31536000./997;
    end
    Pr_ssp = Met_Year(i_ssp).Met_Year.pr .* 1000.*31536000./997;
    Pr_ssp = [Pr_Historical(:,end) , Pr_ssp];
    Pr_ssp = Pr_ssp - repmat(mean(Pr_Historical(:,99:165),2), 1 ,87); % Change to Anomaly
    Ensemble_Mean_Pr_ssp(:,i_ssp-1) = nanmean(Pr_ssp)';
    c95_Pr_ssp = (std(Pr_ssp)./sqrt(size(Pr_ssp,1))).*1.96; % 80% confidence interval
    c95_Pr_ssp = c95_Pr_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_Pr_ssp(:,i_ssp-1) - c95_Pr_ssp; flipud(Ensemble_Mean_Pr_ssp(:,i_ssp-1) + c95_Pr_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
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
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Pr(1) YlimRange_Pr(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Pr Anomaly (mm year^-^1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_Pr,'yTick',YTickRange_Pr,'yTickLabel',YTickLabel_Pr,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
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
clearvars -except Met_Year Land_Year
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr-ET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii = 1 : length(Met_Year)
    Met_Year(ii).Met_Year.pr(12:14,:) = [];
end
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Pr-ET
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Pr_ET = [-5,70]; YTickRange_Pr_ET = [-20:20:80]; YTickLabel_Pr_ET = {'';'0';'';'40';'';'80'};
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
% Pr_ET kg/(m2s) to mm/year
Pr_ET_Historical = (Met_Year(1).Met_Year.pr - Land_Year(1).Land_Year.evspsbl) .* 1000.*31536000./997;
Pr_ET_Historical = Pr_ET_Historical - repmat(mean(Pr_ET_Historical(:,99:165),2),1,165); % Change to Anomaly
Ensemble_Mean_Pr_ET_Historical = nanmean(Pr_ET_Historical)';
c95_Pr_ET_Historical = (std(Pr_ET_Historical)./sqrt(size(Pr_ET_Historical,1))).*1.96; % 80% confidence interval
c95_Pr_ET_Historical = c95_Pr_ET_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Pr_ET_Historical - c95_Pr_ET_Historical; flipud(Ensemble_Mean_Pr_ET_Historical + c95_Pr_ET_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;

% Scenario Pr_ET
% Pr_ET kg/(m2s) to mm/year
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Pr_ET_Historical = (Met_Year(1).Met_Year.pr - Land_Year(1).Land_Year.evspsbl) .* 1000.*31536000./997;
        Pr_ET_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        Pr_ET_Historical = (Met_Year(1).Met_Year.pr - Land_Year(1).Land_Year.evspsbl) .* 1000.*31536000./997;
    end
    Pr_ET_ssp = (Met_Year(i_ssp).Met_Year.pr - Land_Year(i_ssp).Land_Year.evspsbl) .* 1000.*31536000./997;
    Pr_ET_ssp = [Pr_ET_Historical(:,end) , Pr_ET_ssp];
    Pr_ET_ssp = Pr_ET_ssp - repmat(mean(Pr_ET_Historical(:,99:165),2), 1 ,87); % Change to Anomaly
    Ensemble_Mean_Pr_ET_ssp(:,i_ssp-1) = nanmean(Pr_ET_ssp)';
    c95_Pr_ET_ssp = (std(Pr_ET_ssp)./sqrt(size(Pr_ET_ssp,1))).*1.96; % 80% confidence interval
    c95_Pr_ET_ssp = c95_Pr_ET_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_Pr_ET_ssp(:,i_ssp-1) - c95_Pr_ET_ssp; flipud(Ensemble_Mean_Pr_ET_ssp(:,i_ssp-1) + c95_Pr_ET_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
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
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Pr_ET(1) YlimRange_Pr_ET(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Pr-ET Anomaly (mm year^-^1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_Pr_ET,'yTick',YTickRange_Pr_ET,'yTickLabel',YTickLabel_Pr_ET,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
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
clearvars -except Met_Year Land_Year




















%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Q
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Q = [-5,70]; YTickRange_Q = [-20:20:80]; YTickLabel_Q = {'';'0';'';'40';'';'80'};
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
% Q kg/(m2s) to mm/year
Q_Historical = Land_Year(1).Land_Year.mrro .* 1000.*31536000./997;
Q_Historical = Q_Historical - repmat(mean(Q_Historical(:,99:165),2),1,165); % Change to Anomaly
Ensemble_Mean_Q_Historical = nanmean(Q_Historical)';
c95_Q_Historical = (std(Q_Historical)./sqrt(size(Q_Historical,1))).*1.96; % 80% confidence interval
c95_Q_Historical = c95_Q_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_Q_Historical - c95_Q_Historical; flipud(Ensemble_Mean_Q_Historical + c95_Q_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;

% Scenario Q
% Q kg/(m2s) to mm/year
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        Q_Historical = Land_Year(1).Land_Year.mrro .* 1000.*31536000./997;
        Q_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        Q_Historical = Land_Year(1).Land_Year.mrro .* 1000.*31536000./997;
    end
    Q_ssp = Land_Year(i_ssp).Land_Year.mrro .* 1000.*31536000./997;
    Q_ssp = [Q_Historical(:,end) , Q_ssp];
    Q_ssp = Q_ssp - repmat(mean(Q_Historical(:,99:165),2), 1 ,87); % Change to Anomaly
    Ensemble_Mean_Q_ssp(:,i_ssp-1) = nanmean(Q_ssp)';
    c95_Q_ssp = (std(Q_ssp)./sqrt(size(Q_ssp,1))).*1.96; % 80% confidence interval
    c95_Q_ssp = c95_Q_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_Q_ssp(:,i_ssp-1) - c95_Q_ssp; flipud(Ensemble_Mean_Q_ssp(:,i_ssp-1) + c95_Q_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
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
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_Q(1) YlimRange_Q(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('Pr-ET Anomaly (mm year^-^1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_Q,'yTick',YTickRange_Q,'yTickLabel',YTickLabel_Q,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
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
clearvars -except Met_Year Land_Year
end
