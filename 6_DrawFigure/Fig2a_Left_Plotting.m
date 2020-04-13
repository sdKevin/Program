function Fig2a_Left_Plotting(ETrc_Year , Met_Year)
figure
%%%%%%%%%%%%%%%%%%%%%Shade Area
RGB_Yang_Shade = [35,97,127];RGB_Yang_Line = [10,57,90];
RGB_PM_Shade = [201,132,70];RGB_PM_Line = [155,84,34];
RGB_Jarvis_Shade = [68,190,160];RGB_Jarvis_Line = [1,102,94];
YlimRange_AI = [-0.03,0.1];YTickRange_AI = [-0.01:0.05:0.1];
%% Three Windows
fill([1948.3;2014;2014;1948.3],[YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);hold on;
fill([2070.3;2099;2099;2070.3],[YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);

% Historical AI calculated by PM-RC-Jarvis-H
% pr kg/(m2s), ETrc mm/day
AI_Historical = (Met_Year(1).Met_Year.pr .* 1000.*31536000./997) ./ ...
    (ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H .* 365);
AI_Historical = AI_Historical - repmat(mean(AI_Historical(:,99:165),2),1,165); % Change to Anomaly
Ensemble_Mean_AI_Historical = nanmean(AI_Historical)';
c95_AI_Historical = (std(AI_Historical)./sqrt(size(AI_Historical,1))).*1.96;
c95_AI_Historical = c95_AI_Historical';
fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_AI_Historical - c95_AI_Historical; flipud(Ensemble_Mean_AI_Historical + c95_AI_Historical)],...
    RGB_Jarvis_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45);hold on;

for i_ssp = 2 : 5
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
    AI_ssp = AI_ssp - repmat(mean(AI_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
    Ensemble_Mean_AI_ssp = nanmean(AI_ssp)';
    c95_AI_ssp = (std(AI_ssp)./sqrt(size(AI_ssp,1))).*1.96;
    c95_AI_ssp = c95_AI_ssp';
    fill([[2015:2100]';flipud([2015:2100]')],...
        [Ensemble_Mean_AI_ssp - c95_AI_ssp; flipud(Ensemble_Mean_AI_ssp + c95_AI_ssp)],...
        RGB_Jarvis_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45);hold on;
    pause(3)
end

%%%%%%%%%%%%%%%%%%%%% Ensemble Mean
plot([1850:2014],Ensemble_Mean_AI_Historical,...
    'Color',1.0-1*(1.0-RGB_Jarvis_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度

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

