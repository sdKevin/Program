function Fig1a_Plotting( Input_ETrc_Year , Input_Met_Year)
%% Merge Historical (1850-2014) and SSP585 (2015-2100) series
% pr kg/(m2s) (to mm/year), ETrc mm/day (to mm/year)
ETrc_Year.PM_RC = [Input_ETrc_Year(1).ETrc_Year.PM_RC , Input_ETrc_Year(5).ETrc_Year.PM_RC] .* 365;
ETrc_Year.PM_RC_CO2_Yang = [Input_ETrc_Year(1).ETrc_Year.PM_RC_CO2_Yang , Input_ETrc_Year(5).ETrc_Year.PM_RC_CO2_Yang] .* 365;
ETrc_Year.PM_RC_CO2_Jarvis_H = [Input_ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H , Input_ETrc_Year(5).ETrc_Year.PM_RC_CO2_Jarvis_H] .* 365;
pr = [Input_Met_Year(1).Met_Year.pr , Input_Met_Year(5).Met_Year.pr].*1000.*31536000./997;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Left%%%%%%%%%%%%%%%%%%%%%%%%
%% Yearly Series: Global average Aridity Index
figure
%%%%%%%%%%%%%%%%%%%%%Shade Area
RGB_Yang_Shade = [35,97,127]; RGB_Yang_Line = [10,57,90];
RGB_PM_Shade = [201,132,70]; RGB_PM_Line = [155,84,34];
RGB_Jarvis_Shade = [68,190,160]; RGB_Jarvis_Line = [1,102,94];
YlimRange_AI = [-0.1,0.1]; YTickRange_AI = [-0.15:0.05:0.1];
%% Three Windows
fill([1850.3;1879;1879;1850.3],[YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);hold on;
fill([1948.3;2014;2014;1948.3],[YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);
fill([2070.3;2099;2099;2070.3],[YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);


% AI in PM_RC_CO2_Yang
AI_PM_RC_CO2_Yang = pr./ETrc_Year.PM_RC_CO2_Yang;
AI_PM_RC_CO2_Yang = AI_PM_RC_CO2_Yang - repmat(mean(AI_PM_RC_CO2_Yang(:,99:165),2),1,251);% Change to Anomaly
Ensemble_Mean_AI_PM_RC_CO2_Yang = nanmean(AI_PM_RC_CO2_Yang)';
c95_AI_PM_RC_CO2_Yang = (std(AI_PM_RC_CO2_Yang)./sqrt(size(AI_PM_RC_CO2_Yang,1))).*1.96;c95_AI_PM_RC_CO2_Yang=c95_AI_PM_RC_CO2_Yang';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC_CO2_Yang - c95_AI_PM_RC_CO2_Yang; flipud(Ensemble_Mean_AI_PM_RC_CO2_Yang + c95_AI_PM_RC_CO2_Yang)],...
    RGB_Yang_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.55);hold on;
% AI in PM_RC
AI_PM_RC = pr./ETrc_Year.PM_RC;
AI_PM_RC = AI_PM_RC - repmat(mean(AI_PM_RC(:,99:165),2),1,251);% Change to Anomaly
Ensemble_Mean_AI_PM_RC = nanmean(AI_PM_RC)';
c95_AI_PM_RC = (std(AI_PM_RC)./sqrt(size(AI_PM_RC,1))).*1.96;c95_AI_PM_RC=c95_AI_PM_RC';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC - c95_AI_PM_RC; flipud(Ensemble_Mean_AI_PM_RC + c95_AI_PM_RC)],...
    RGB_PM_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45);hold on;
% AI in PM_RC_CO2_Jarvis_H
AI_PM_RC_CO2_Jarvis_H = pr./ETrc_Year.PM_RC_CO2_Jarvis_H;
AI_PM_RC_CO2_Jarvis_H = AI_PM_RC_CO2_Jarvis_H - repmat(mean(AI_PM_RC_CO2_Jarvis_H(:,99:165),2),1,251);% Change to Anomaly
Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H = nanmean(AI_PM_RC_CO2_Jarvis_H)';
c95_AI_PM_RC_CO2_Jarvis_H = (std(AI_PM_RC_CO2_Jarvis_H)./sqrt(size(AI_PM_RC_CO2_Jarvis_H,1))).*1.96;c95_AI_PM_RC_CO2_Jarvis_H=c95_AI_PM_RC_CO2_Jarvis_H';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H - c95_AI_PM_RC_CO2_Jarvis_H; flipud(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H + c95_AI_PM_RC_CO2_Jarvis_H)],...
    RGB_Jarvis_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45);hold on;
%%%%%%%%%%%%%%%%%%%%% Ensemble Mean
plot([1850:2100],Ensemble_Mean_AI_PM_RC,...
    'Color',1.0-1*(1.0-RGB_PM_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度

plot([1850:2100],Ensemble_Mean_AI_PM_RC_CO2_Yang,...
    'Color',1.0-1*(1.0-RGB_Yang_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度

plot([1850:2100],Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,...
    'Color',1.0-1*(1.0-RGB_Jarvis_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度

ylabel('AI Anomaly (mm mm^-^1)');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_AI,'YTick',YTickRange_AI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
%%%%%%%%%%%%%%%%%%%%% Smooth Ensemble Mean
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC,7),...
    'Color',1.0-1*(1.0-RGB_PM_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
h = legend('ETrc');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_PM_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_AI,'xlim',[1948,2100]);

axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Yang,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Yang,7),...
    'Color',1.0-1*(1.0-RGB_Yang_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
h = legend('ETrc-Yang');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Yang_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_AI,'xlim',[1948,2100]);

axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,7),...
    'Color',1.0-1*(1.0-RGB_Jarvis_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
hold on;
plot([1850 2100],[0 0],'k','LineWidth',1.5) % x axis

h = legend('ETrc-Jarvis');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Jarvis_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_AI,'xlim',[1948,2100]);
%% Princeton
% load('D:\CMIP6\Program\Fig1_ProcessData\ETrc_Year_Princeton.mat')
% load('D:\CMIP6\Program\Fig1_ProcessData\Met_Year_Princeton.mat')
% pr = Met_Year_Princeton.pr.*1000.*31536000./997; %to mm/year
% AI_PM_RC_CO2_Jarvis_H = pr./ETrc_Year.PM_RC_CO2_Jarvis_H;
% AI_PM_RC_CO2_Jarvis_H = AI_PM_RC_CO2_Jarvis_H - mean(AI_PM_RC_CO2_Jarvis_H);% Change to Anomaly
%
% AI_PM_RC_CO2_Yang = pr./ETrc_Year.PM_RC_CO2_Yang;
% AI_PM_RC_CO2_Yang = AI_PM_RC_CO2_Yang - mean(AI_PM_RC_CO2_Yang);% Change to Anomaly
%
% AI_PM_RC = pr./ETrc_Year.PM_RC;
% AI_PM_RC = AI_PM_RC - mean(AI_PM_RC);% Change to Anomaly
%
% plot([1948:2014],smooth(AI_PM_RC_CO2_Jarvis_H,7),...
%     'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
% plot([1948:2014],smooth(AI_PM_RC_CO2_Jarvis_H,7),'--',...
%     'Color',1.0-1*(1.0-[183,154,200]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
%
% plot([1948:2014],smooth(AI_PM_RC_CO2_Yang,7),...
%     'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
% plot([1948:2014],smooth(AI_PM_RC_CO2_Yang,7),'--',...
%     'Color',1.0-1*(1.0-[117,178,225]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
%
% plot([1948:2014],smooth(AI_PM_RC,7),...
%     'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
% plot([1948:2014],smooth(AI_PM_RC,7),'--',...
%     'Color',1.0-1*(1.0-[211,156,95]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Right%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on;
plot([-10 10],[0 0],'k','LineWidth',1.5)
% AI_PM_RC, AI_PM_RC_CO2_Yang, AI_PM_RC_CO2_Jarvis_H
H = notBoxPlot([mean(AI_PM_RC(:,1:30)')', mean(AI_PM_RC(:,221:250)')',...
    mean(AI_PM_RC_CO2_Yang(:,1:30)')',mean(AI_PM_RC_CO2_Yang(:,221:250)')',...
    mean(AI_PM_RC_CO2_Jarvis_H(:,1:30)')',mean(AI_PM_RC_CO2_Jarvis_H(:,221:250)')'],[]);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor',[77,77,77]./255,...
    'markerEdgeColor', 'none')
% AI_PM_RC
set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(1).mu],'Color',RGB_PM_Line./255)
set([H(1).semPtch],'FaceColor',RGB_PM_Shade./255,'FaceAlpha',0.45,'EdgeColor','none')

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(2).mu],'Color',RGB_PM_Line./255)
set([H(2).semPtch],'FaceColor',RGB_PM_Shade./255,'FaceAlpha',0.45,'EdgeColor','none')

% AI_PM_RC_CO2_Yang
set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(3).mu],'Color',RGB_Yang_Line./255)
set([H(3).semPtch],'FaceColor',RGB_Yang_Shade./255,'FaceAlpha',0.55,'EdgeColor','none')

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(4).mu],'Color',RGB_Yang_Line./255)
set([H(4).semPtch],'FaceColor',RGB_Yang_Shade./255,'FaceAlpha',0.55,'EdgeColor','none')

% AI_PM_RC_CO2_Jarvis_H
set([H(5).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(5).mu],'Color',RGB_Jarvis_Line./255)
set([H(5).semPtch],'FaceColor',RGB_Jarvis_Shade./255,'FaceAlpha',0.45,'EdgeColor','none')

set([H(6).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(6).mu],'Color',RGB_Jarvis_Line./255)
set([H(6).semPtch],'FaceColor',RGB_Jarvis_Shade./255,'FaceAlpha',0.45,'EdgeColor','none')

set(gca,'ylim',YlimRange_AI,'FontSize',24,'FontName','Arial','LineWidth',2.5)
end