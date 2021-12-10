function Fig1b_Plotting(Input_scPDSI_Year)
%% Merge Historical (1850-2014) and SSP585 (2015-2100) series
scPDSI_Year.scpdsi_PM_RC = [Input_scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC , Input_scPDSI_Year(5).scPDSI_Year.scpdsi_PM_RC];
scPDSI_Year.scpdsi_PM_RC_CO2_Yang = [Input_scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC_CO2_Yang , Input_scPDSI_Year(5).scPDSI_Year.scpdsi_PM_RC_CO2_Yang];
scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H = [Input_scPDSI_Year(1).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H , Input_scPDSI_Year(5).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Left%%%%%%%%%%%%%%%%%%%%%%%%
%% Yearly Series: Global average scPDSI
figure
%%%%%%%%%%%%%%%%%%%%%Shade Area
RGB_Yang_Shade = [35,97,127]; RGB_Yang_Line = [10,57,90];
RGB_PM_Shade = [201,132,70]; RGB_PM_Line = [155,84,34];
RGB_Jarvis_Shade = [68,190,160]; RGB_Jarvis_Line = [1,102,94];
YlimRange_scPDSI = [-1,2]; YTickRange_scPDSI = [-3 : 1 : 3];
%% Three Windows
fill([1850.3;1879;1879;1850.3],[YlimRange_scPDSI(1)*0.99;YlimRange_scPDSI(1)*0.99;YlimRange_scPDSI(2)*0.99;YlimRange_scPDSI(2)*0.99],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);hold on;
fill([1948.3;2014;2014;1948.3],[YlimRange_scPDSI(1)*0.99;YlimRange_scPDSI(1)*0.99;YlimRange_scPDSI(2)*0.99;YlimRange_scPDSI(2)*0.99],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);
fill([2070.3;2099;2099;2070.3],[YlimRange_scPDSI(1)*0.99;YlimRange_scPDSI(1)*0.99;YlimRange_scPDSI(2)*0.99;YlimRange_scPDSI(2)*0.99],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);

% scPDSI in PM_RC_CO2_Yang
scPDSI_PM_RC_CO2_Yang = scPDSI_Year.scpdsi_PM_RC_CO2_Yang;
Ensemble_Mean_scPDSI_PM_RC_CO2_Yang = nanmean(scPDSI_PM_RC_CO2_Yang)';
c95_scPDSI_PM_RC_CO2_Yang = (std(scPDSI_PM_RC_CO2_Yang)./sqrt(size(scPDSI_PM_RC_CO2_Yang,1))).*1.96; c95_scPDSI_PM_RC_CO2_Yang=c95_scPDSI_PM_RC_CO2_Yang';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_scPDSI_PM_RC_CO2_Yang - c95_scPDSI_PM_RC_CO2_Yang; flipud(Ensemble_Mean_scPDSI_PM_RC_CO2_Yang + c95_scPDSI_PM_RC_CO2_Yang)],...
    RGB_Yang_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.55);hold on;
% scPDSI in PM_RC
scPDSI_PM_RC = scPDSI_Year.scpdsi_PM_RC;
Ensemble_Mean_scPDSI_PM_RC = nanmean(scPDSI_PM_RC)';
c95_scPDSI_PM_RC = (std(scPDSI_PM_RC)./sqrt(size(scPDSI_PM_RC,1))).*1.96; c95_scPDSI_PM_RC=c95_scPDSI_PM_RC';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_scPDSI_PM_RC - c95_scPDSI_PM_RC; flipud(Ensemble_Mean_scPDSI_PM_RC + c95_scPDSI_PM_RC)],...
    RGB_PM_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45);hold on;
% scPDSI in PM_RC_CO2_Jarvis_H
scPDSI_PM_RC_CO2_Jarvis_H = scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H;
Ensemble_Mean_scPDSI_PM_RC_CO2_Jarvis_H = nanmean(scPDSI_PM_RC_CO2_Jarvis_H)';
c95_scPDSI_PM_RC_CO2_Jarvis_H = (std(scPDSI_PM_RC_CO2_Jarvis_H)./sqrt(size(scPDSI_PM_RC_CO2_Jarvis_H,1))).*1.96; c95_scPDSI_PM_RC_CO2_Jarvis_H=c95_scPDSI_PM_RC_CO2_Jarvis_H';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_scPDSI_PM_RC_CO2_Jarvis_H - c95_scPDSI_PM_RC_CO2_Jarvis_H; flipud(Ensemble_Mean_scPDSI_PM_RC_CO2_Jarvis_H + c95_scPDSI_PM_RC_CO2_Jarvis_H)],...
    RGB_Jarvis_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.45);hold on;

%%%%%%%%%%%%%%%%%%%%% Ensemble Mean
plot([1850:2100],Ensemble_Mean_scPDSI_PM_RC,...
    'Color',1.0-1*(1.0-RGB_PM_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度

plot([1850:2100],Ensemble_Mean_scPDSI_PM_RC_CO2_Yang,...
    'Color',1.0-1*(1.0-RGB_Yang_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度

plot([1850:2100],Ensemble_Mean_scPDSI_PM_RC_CO2_Jarvis_H,...
    'Color',1.0-1*(1.0-RGB_Jarvis_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度

ylabel('scPDSI');
set(gca,'xlim',[1948,2100],'ylim',YlimRange_scPDSI,'YTick',YTickRange_scPDSI,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%%%%%%%%%%%%%%%%%%%%% Smooth Ensemble Mean
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_scPDSI_PM_RC,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_scPDSI_PM_RC,7),...
    'Color',1.0-1*(1.0-RGB_PM_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
h = legend('PM-RC');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_PM_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_scPDSI,'xlim',[1948,2100]);

axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_scPDSI_PM_RC_CO2_Yang,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_scPDSI_PM_RC_CO2_Yang,7),...
    'Color',1.0-1*(1.0-RGB_Yang_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
h = legend('PM-RC-Yang');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Yang_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_scPDSI,'xlim',[1948,2100]);

axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1850:2100],smooth(Ensemble_Mean_scPDSI_PM_RC_CO2_Jarvis_H,7),'Color',[1 1 1],'Linewidth',2.5);% 1为透明度
plot([1850:2100],smooth(Ensemble_Mean_scPDSI_PM_RC_CO2_Jarvis_H,7),...
    'Color',1.0-1*(1.0-RGB_Jarvis_Line./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
hold on;
plot([1850 2100],[0 0],'k','LineWidth',1.5) % x axis

h = legend('PM-RC-Jarvis');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Jarvis_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_scPDSI,'xlim',[1948,2100]);
%% Princeton
scPDSI_Princeton_PM_RC_CO2_Jarvis_H = Input_scPDSI_Year(6).scPDSI_Year.scpdsi_PM_RC_CO2_Jarvis_H;
scPDSI_Princeton_PM_RC_CO2_Yang = Input_scPDSI_Year(6).scPDSI_Year.scpdsi_PM_RC_CO2_Yang;
scPDSI_Princeton_PM_RC = Input_scPDSI_Year(6).scPDSI_Year.scpdsi_PM_RC;

axes('position', [0.1300    0.1100    0.7750    0.8150]);
plot([1948:2014],smooth(scPDSI_Princeton_PM_RC_CO2_Jarvis_H,7),...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5); hold on;
plot([1948:2014],smooth(scPDSI_Princeton_PM_RC_CO2_Yang,7),...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
plot([1948:2014],smooth(scPDSI_Princeton_PM_RC,7),...
    'Color',[1 1 1],'EraseMode','xor','Linewidth',2.5);
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_scPDSI,'xlim',[1948,2100]);

axes('position', [0.1300    0.1100    0.7750    0.8150]);
plot([1948:2014],smooth(scPDSI_Princeton_PM_RC,7),'--',...
    'Color',1.0-1*(1.0-[140,81,10]./255),'EraseMode','xor','Linewidth',2.5); hold on;% 1为透明度
plot([1948:2014],smooth(scPDSI_Princeton_PM_RC_CO2_Jarvis_H,7),'--',...
    'Color',1.0-1*(1.0-[53,151,143]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
plot([1948:2014],smooth(scPDSI_Princeton_PM_RC_CO2_Yang,7),'--',...
    'Color',1.0-1*(1.0-[50,136,189]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
h = legend('PM-RC','PM-RC-Jarvis','PM-RC-Yang');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor','k')
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_scPDSI,'xlim',[1948,2100]);
end