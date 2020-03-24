function Fig3a_Plotting( ETrc_Year , Met_Year)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Left%%%%%%%%%%%%%%%%%%%%%%%%
%% Yearly Series: Global average Aridity Index
figure
%%%%%%%%%%%%%%%%%%%%%Shade Area
RGB_Yang_Shade = [115,115,115];RGB_Yang_Line = [133,184,227];
RGB_PM_Shade = [150,150,150];RGB_PM_Line = [172,150,83];
RGB_Jarvis_Shade = [189,189,189];RGB_Jarvis_Line = [100,101,174];
YlimRange_AI = [-0.1,0.07];YTickRange_AI = [-0.1:0.04:0.08];
%% Three Windows
% fill([1850;1879;1879;1850],[YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
%     [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);hold on;
% fill([1948;2014;2014;1948],[YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
%     [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
% fill([2070;2099;2099;2070],[YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
%     [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
fill([1850;2100;2100;1850],[0;0;YlimRange_AI(2)*0.99;YlimRange_AI(2)*0.99],...
    [206,230,192]./255,'EdgeAlpha',0,'FaceAlpha',0.5);hold on;
fill([1850;2100;2100;1850],[0;0;YlimRange_AI(1)*0.99;YlimRange_AI(1)*0.99],...
    [251,191,164]./255,'EdgeAlpha',0,'FaceAlpha',0.5);hold on;

pr = Met_Year.pr.*1000.*31536000./997; %to mm/year
% AI in PM_RC_CO2_Yang
AI_PM_RC_CO2_Yang = pr./ETrc_Year.PM_RC_CO2_Yang;
AI_PM_RC_CO2_Yang = AI_PM_RC_CO2_Yang - repmat(mean(AI_PM_RC_CO2_Yang(:,99:165),2),1,251);% Change to Anomaly

Ensemble_Mean_AI_PM_RC_CO2_Yang = nanmean(AI_PM_RC_CO2_Yang)';
c95_AI_PM_RC_CO2_Yang = (std(AI_PM_RC_CO2_Yang)./sqrt(size(AI_PM_RC_CO2_Yang,1))).*1.96;c95_AI_PM_RC_CO2_Yang=c95_AI_PM_RC_CO2_Yang';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC_CO2_Yang - c95_AI_PM_RC_CO2_Yang; flipud(Ensemble_Mean_AI_PM_RC_CO2_Yang + c95_AI_PM_RC_CO2_Yang)],...
    RGB_Yang_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.6);hold on;
% AI in PM_RC
AI_PM_RC = pr./ETrc_Year.PM_RC;

AI_PM_RC = AI_PM_RC - repmat(mean(AI_PM_RC(:,99:165),2),1,251);% Change to Anomaly

Ensemble_Mean_AI_PM_RC = nanmean(AI_PM_RC)';
c95_AI_PM_RC = (std(AI_PM_RC)./sqrt(size(AI_PM_RC,1))).*1.96;c95_AI_PM_RC=c95_AI_PM_RC';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC - c95_AI_PM_RC; flipud(Ensemble_Mean_AI_PM_RC + c95_AI_PM_RC)],...
    RGB_PM_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.55);hold on;
% AI in PM_RC_CO2_Jarvis_H
AI_PM_RC_CO2_Jarvis_H = pr./ETrc_Year.PM_RC_CO2_Jarvis_H;

AI_PM_RC_CO2_Jarvis_H = AI_PM_RC_CO2_Jarvis_H - repmat(mean(AI_PM_RC_CO2_Jarvis_H(:,99:165),2),1,251);% Change to Anomaly

Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H = nanmean(AI_PM_RC_CO2_Jarvis_H)';
c95_AI_PM_RC_CO2_Jarvis_H = (std(AI_PM_RC_CO2_Jarvis_H)./sqrt(size(AI_PM_RC_CO2_Jarvis_H,1))).*1.96;c95_AI_PM_RC_CO2_Jarvis_H=c95_AI_PM_RC_CO2_Jarvis_H';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H - c95_AI_PM_RC_CO2_Jarvis_H; flipud(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H + c95_AI_PM_RC_CO2_Jarvis_H)],...
    RGB_Jarvis_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.55);hold on;
%%%%%%%%%%%%%%%%%%%%%Ensemble Mean
% plot([1850:2100],Ensemble_Mean_AI_PM_RC,...
%     'Color',1.0-1*(1.0-RGB_PM_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC,7),'--',...
    'Color',1.0-1*(1.0-RGB_PM_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度

% plot([1850:2100],Ensemble_Mean_AI_PM_RC_CO2_Yang,...
%     'Color',1.0-1*(1.0-RGB_Yang_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Yang,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Yang,7),'--',...
    'Color',1.0-1*(1.0-RGB_Yang_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度

% plot([1850:2100],Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,...
%     'Color',1.0-1*(1.0-RGB_Jarvis_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,7),'--',...
    'Color',1.0-1*(1.0-RGB_Jarvis_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度

%% Princeton
load('D:\CMIP6\Program\Fig1_ProcessData\ETrc_Year_Princeton.mat')
load('D:\CMIP6\Program\Fig1_ProcessData\Met_Year_Princeton.mat')
pr = Met_Year_Princeton.pr.*1000.*31536000./997; %to mm/year
AI_PM_RC_CO2_Jarvis_H = pr./ETrc_Year.PM_RC_CO2_Jarvis_H;
AI_PM_RC_CO2_Jarvis_H = AI_PM_RC_CO2_Jarvis_H - mean(AI_PM_RC_CO2_Jarvis_H);% Change to Anomaly

AI_PM_RC_CO2_Yang = pr./ETrc_Year.PM_RC_CO2_Yang;
AI_PM_RC_CO2_Yang = AI_PM_RC_CO2_Yang - mean(AI_PM_RC_CO2_Yang);% Change to Anomaly

AI_PM_RC = pr./ETrc_Year.PM_RC;
AI_PM_RC = AI_PM_RC - mean(AI_PM_RC);% Change to Anomaly

plot([1948:2014],smooth(AI_PM_RC_CO2_Jarvis_H,7),...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
plot([1948:2014],smooth(AI_PM_RC_CO2_Jarvis_H,7),'--',...
    'Color',1.0-1*(1.0-[183,154,200]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度

plot([1948:2014],smooth(AI_PM_RC_CO2_Yang,7),...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
plot([1948:2014],smooth(AI_PM_RC_CO2_Yang,7),'--',...
    'Color',1.0-1*(1.0-[117,178,225]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度

plot([1948:2014],smooth(AI_PM_RC,7),...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
plot([1948:2014],smooth(AI_PM_RC,7),'--',...
    'Color',1.0-1*(1.0-[211,156,95]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度

% plot([1850 2100],[0 0 ],'k','LineWidth',1.5)

ylabel('AI Anomaly(mm mm^-^1)');
set(gca,'xlim',[1850,2100],'ylim',YlimRange_AI,'YTick',YTickRange_AI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Right%%%%%%%%%%%%%%%%%%%%%%%%
% figure
% % AI_PM_RC, AI_PM_RC_CO2_Yang, AI_PM_RC_CO2_Jarvis_H
% H = notBoxPlot([mean(AI_PM_RC(:,221:250)')',mean(AI_PM_RC_CO2_Yang(:,221:250)')',mean(AI_PM_RC_CO2_Jarvis_H(:,221:250)')'],[]);
% set(gca,'color',[ 255 255 255]./255,'Box','On')
% set([H.data],'MarkerSize',6,...
%     'markerFaceColor',[77,77,77]./255,...
%     'markerEdgeColor', 'none')
% % AI_PM_RC
% set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
% set([H(1).mu],'Color',RGB_PM_Line./255)
% set([H(1).semPtch],'FaceColor',RGB_PM_Shade./255,'FaceAlpha',0.55,'EdgeColor','none')
% % AI_PM_RC_CO2_Yang
% set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
% set([H(2).mu],'Color',RGB_Yang_Line./255)
% set([H(2).semPtch],'FaceColor',RGB_Yang_Shade./255,'FaceAlpha',0.6,'EdgeColor','none')
% % AI_PM_RC_CO2_Jarvis_H
% set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
% set([H(3).mu],'Color',RGB_Jarvis_Line./255)
% set([H(3).semPtch],'FaceColor',RGB_Jarvis_Shade./255,'FaceAlpha',0.55,'EdgeColor','none')
% 
% set(gca,'ylim',YlimRange_AI,'FontSize',24,'FontName','Arial','LineWidth',2.5)

end