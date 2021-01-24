function Fig2c_Left_Plotting(ETrc_Year , Met_Year)
% Drawing AI calculated by PM_RC
%% Data Bias Correction and Smooth
for ii = [2 : length(ETrc_Year)-1 , 1]
    for iii = 1 : size(ETrc_Year(ii).ETrc_Year.PM_RC,1)
        
        % HadGEM3-GC31-LL does not have ssp370
        if ii == 4 & iii>=16
            % ETrc_Year Bias Correction
            ETrc_Year(ii).ETrc_Year.PM_RC(iii,:) = ...
                ETrc_Year(ii).ETrc_Year.PM_RC(iii,:) - ...
                (mean(ETrc_Year(1).ETrc_Year.PM_RC(iii+1,99:end)) - mean(ETrc_Year(6).ETrc_Year.PM_RC));
            % ETrc_Year Smooth
            ETrc_Year(ii).ETrc_Year.PM_RC(iii,:) = ...
                smooth(ETrc_Year(ii).ETrc_Year.PM_RC(iii,:) , 7);
            % Met_Year Bias Correction
            Met_Year(ii).Met_Year.pr(iii,:) = ...
                Met_Year(ii).Met_Year.pr(iii,:) - ...
                (mean(Met_Year(1).Met_Year.pr(iii+1,99:end)) - mean(Met_Year(6).Met_Year.pr));
            % Met_Year Smooth
            Met_Year(ii).Met_Year.pr(iii,:) = ...
                smooth(Met_Year(ii).Met_Year.pr(iii,:) , 7);
        else
            % ETrc_Year Bias Correction
            ETrc_Year(ii).ETrc_Year.PM_RC(iii,:) = ...
                ETrc_Year(ii).ETrc_Year.PM_RC(iii,:) - ...
                (mean(ETrc_Year(1).ETrc_Year.PM_RC(iii,99:end)) - mean(ETrc_Year(6).ETrc_Year.PM_RC));
            % ETrc_Year Smooth
            ETrc_Year(ii).ETrc_Year.PM_RC(iii,:) = ...
                smooth(ETrc_Year(ii).ETrc_Year.PM_RC(iii,:) , 7);
            % Met_Year Bias Correction
            Met_Year(ii).Met_Year.pr(iii,:) = ...
                Met_Year(ii).Met_Year.pr(iii,:) - ...
                (mean(Met_Year(1).Met_Year.pr(iii,99:end)) - mean(Met_Year(6).Met_Year.pr));
            % Met_Year Smooth
            Met_Year(ii).Met_Year.pr(iii,:) = ...
                smooth(Met_Year(ii).Met_Year.pr(iii,:) , 7);
        end
        
    end
end
clear ii iii
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205];RGB_Historical_Line = [23,23,23];
% RGB_ssp_Shade = [16,163,221;167,206,223;249,219,203;249,191,202];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
% RGB_ssp_Line = [57,83,164;114,177,225;245,130,105;238,33,37];
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
HatchAngle_ssp = [65,115,65,115];

YlimRange_AI = [-0.07,0.01]; YTickRange_AI = [-0.07:0.01:0.01]; YTickLabel_AI = {'';'-0.06';'';'-0.04';'';'-0.02';'';'0'};

%% Three time windows
figure
%  Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_AI(1); YlimRange_AI(1); YlimRange_AI(2); YlimRange_AI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_AI(1); YlimRange_AI(1); YlimRange_AI(2); YlimRange_AI(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_AI(1) YlimRange_AI(2)],'k','LineWidth',1.5); hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% Historical AI calculated by PM-RC
% pr kg/(m2s), ETrc mm/day
AI_Historical = (Met_Year(1).Met_Year.pr .* 1000.*31536000./997) ./ ...
    (ETrc_Year(1).ETrc_Year.PM_RC .* 365);
AI_Historical = AI_Historical - repmat(mean(AI_Historical(:,99:165),2),1,165); % Change to Anomaly
Ensemble_Mean_AI_Historical = nanmean(AI_Historical)';
c95_AI_Historical = (std(AI_Historical)./sqrt(size(AI_Historical,1))).*1.28;% 80% confidence interval
c95_AI_Historical = c95_AI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_AI_Historical - c95_AI_Historical; flipud(Ensemble_Mean_AI_Historical + c95_AI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',2,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',250,...
    'HatchLineWidth',2.5, 'HatchColor',RGB_Historical_Shade./255)
% ScenarioMIP AI calculated by PM-RC
% pr kg/(m2s), ETrc mm/day
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        AI_Historical = (Met_Year(1).Met_Year.pr .* 1000.*31536000./997) ./ ...
            (ETrc_Year(1).ETrc_Year.PM_RC .* 365);
        AI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        AI_Historical = (Met_Year(1).Met_Year.pr .* 1000.*31536000./997) ./ ...
            (ETrc_Year(1).ETrc_Year.PM_RC .* 365);
    end
    AI_ssp = (Met_Year(i_ssp).Met_Year.pr .* 1000.*31536000./997) ./ ...
        (ETrc_Year(i_ssp).ETrc_Year.PM_RC .* 365);
    AI_ssp = [AI_Historical(:,end) , AI_ssp];
    AI_ssp = AI_ssp - repmat(mean(AI_Historical(:,99:165),2), 1 ,87); % Change to Anomaly
    Ensemble_Mean_AI_ssp(:,i_ssp-1) = nanmean(AI_ssp)';
    c95_AI_ssp = (std(AI_ssp)./sqrt(size(AI_ssp,1))).*1.28; % 80% confidence interval
    c95_AI_ssp = c95_AI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_AI_ssp(:,i_ssp-1) - c95_AI_ssp; flipud(Ensemble_Mean_AI_ssp(:,i_ssp-1) + c95_AI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',2.5,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',300,...
        'HatchLineWidth',2.5,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_AI_Historical,'-.',...
    'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_AI_ssp(:,i_ssp),'-.',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
% Plot y=0 and x=2014
plot([2014 2014],[YlimRange_AI(1) YlimRange_AI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
% setting axis
ylabel('AI Anomaly (mm mm^-^1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_AI,'yTick',YTickRange_AI,'yTickLabel',YTickLabel_AI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);

axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
end
