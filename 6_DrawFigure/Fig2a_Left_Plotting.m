function Fig2a_Left_Plotting(ETrc_Year , Met_Year)
%% Data Smooth
for ii = 1 : length(ETrc_Year)
    for iii = 1 : size(ETrc_Year(ii).ETrc_Year.PM_RC_CO2_Jarvis_H,1)
        ETrc_Year(ii).ETrc_Year.PM_RC_CO2_Jarvis_H(iii,:) = ...
            smooth(ETrc_Year(ii).ETrc_Year.PM_RC_CO2_Jarvis_H(iii,:) , 7);
        Met_Year(ii).Met_Year.pr(iii,:) = ...
            smooth(Met_Year(ii).Met_Year.pr(iii,:) , 7);
    end
end
clear ii iii
figure
%%%%%%%%%%%%%%%%%%%%%Shade Area
RGB_Historical_Shade = [205,205,205];RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [16,163,221;167,206,223;249,219,203;249,191,202];
RGB_ssp_Line = [57,83,164;114,177,225;232,122,67;238,33,37];
HatchAngle_ssp = [45,135,45,135];

YlimRange_AI = [-0.015,0.09];YTickRange_AI = [-0.01:0.05:0.09];

plot([2014 2014],[YlimRange_AI(1) YlimRange_AI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'k','LineWidth',1.5)
% Historical AI calculated by PM-RC-Jarvis-H
% pr kg/(m2s), ETrc mm/day
AI_Historical = (Met_Year(1).Met_Year.pr .* 1000.*31536000./997) ./ ...
    (ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365);
AI_Historical = AI_Historical - repmat(mean(AI_Historical(:,99:165),2),1,165); % Change to Anomaly
Ensemble_Mean_AI_Historical = nanmean(AI_Historical)';
c95_AI_Historical = (std(AI_Historical)./sqrt(size(AI_Historical,1))).*1.96;
c95_AI_Historical = c95_AI_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_AI_Historical - c95_AI_Historical; flipud(Ensemble_Mean_AI_Historical + c95_AI_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
hatchfill2(h1,'cross','LineWidth',1,'FaceColor','none',...
    'HatchStyle','single','HatchAngle',45,'HatchDensity',150,...
    'HatchLineWidth',2, 'HatchColor',RGB_Historical_Shade./255)

for i_ssp = [2,3,4,5]
    if i_ssp == 4
        AI_Historical = (Met_Year(1).Met_Year.pr .* 1000.*31536000./997) ./ ...
            (ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365);
        AI_Historical(16,:) = []; % HadGEM3-GC31-LL
    else
        AI_Historical = (Met_Year(1).Met_Year.pr .* 1000.*31536000./997) ./ ...
            (ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365);
    end
    AI_ssp = (Met_Year(i_ssp).Met_Year.pr .* 1000.*31536000./997) ./ ...
        (ETrc_Year(i_ssp).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365);
    AI_ssp = [AI_Historical(:,end),AI_ssp];
    AI_ssp = AI_ssp - repmat(mean(AI_Historical(:,99:165),2), 1 ,87); % Change to Anomaly
    Ensemble_Mean_AI_ssp(:,i_ssp-1) = nanmean(AI_ssp)';
    c95_AI_ssp = (std(AI_ssp)./sqrt(size(AI_ssp,1))).*1.96;
    c95_AI_ssp = c95_AI_ssp';
    h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
        [Ensemble_Mean_AI_ssp(:,i_ssp-1) - c95_AI_ssp; flipud(Ensemble_Mean_AI_ssp(:,i_ssp-1) + c95_AI_ssp)],...
        RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.45); hold on;
    hatchfill2(h_ssp,'cross','LineWidth',1,'FaceColor','none',...
        'HatchStyle','single','HatchAngle',HatchAngle_ssp(i_ssp-1),'HatchDensity',120,...
        'HatchLineWidth',2,'HatchColor',RGB_ssp_Shade(i_ssp-1,:)./255)
end

%%%%%%%%%%%%%%%%%%%%% Ensemble Mean
plot([1850:2014],Ensemble_Mean_AI_Historical,'--',...
    'Color',RGB_Historical_Line./255,'Linewidth',3);hold on;
for i_ssp = [1,2,3,4]
    plot([2014:2100],Ensemble_Mean_AI_ssp(:,i_ssp),'--',...
        'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3);
end

plot([2014 2014],[YlimRange_AI(1) YlimRange_AI(2)],'k','LineWidth',1.5);
hold on;
plot([1948 2100],[0 0],'k','LineWidth',1.5)
ylabel('AI Anomaly (mm mm^-^1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_AI,'YTick',YTickRange_AI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);














%%%%%%%%%%%%%%%%%%%%% Smooth Ensemble Mean
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC,7),...
    'Color',1.0-1*(1.0-RGB_PM_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
h = legend('PM-RC');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_PM_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_AI,'xlim',[1948,2100]);

axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Yang,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Yang,7),...
    'Color',1.0-1*(1.0-RGB_Yang_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
h = legend('PM-RC-Yang');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Yang_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_AI,'xlim',[1948,2100]);

axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,7),...
    'Color',1.0-1*(1.0-RGB_Jarvis_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
hold on;
plot([1850 2100],[0 0],'k','LineWidth',1.5) % x axis

h = legend('PM-RC-Jarvis');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Jarvis_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_AI,'xlim',[1948,2100]);

end

