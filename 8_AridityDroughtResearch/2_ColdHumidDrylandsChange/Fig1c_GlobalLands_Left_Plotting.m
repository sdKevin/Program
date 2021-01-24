function Fig1c_GlobalLands_Left_Plotting(CMIP_DryWetRegion , Path_DryWetRegion_Princeton)
%% DryWetRegionData
% Cold_PM_RC is cold region area ratio from 1850 to 2100
Cold_PM_RC = cat(2 ,...
    CMIP_DryWetRegion(1).Cold_PM_RC , CMIP_DryWetRegion(2).Cold_PM_RC);
% DryLand_PM_RC is dryland area ratio from 1850 to 2100
DryLand_PM_RC = cat(2 ,...
    CMIP_DryWetRegion(1).DryLand_PM_RC , CMIP_DryWetRegion(2).DryLand_PM_RC);
% HumidLand_PM_RC is humid land area ratio from 1850 to 2100
HumidLand_PM_RC = cat(2 ,...
    CMIP_DryWetRegion(1).HumidLand_PM_RC , CMIP_DryWetRegion(2).HumidLand_PM_RC);

%% Setting Color
% Color for cold region
RGB_Cold_Shade = [191 , 220 , 237]; RGB_Cold_Line = [57 , 83 , 164]; RGB_Princeton_Cold = [112,131,164];
% Color for dryland
RGB_Dry_Shade = [251 , 191 , 164]; RGB_Dry_Line = [238 , 32 , 37]; RGB_Princeton_Dry = [208,106,95];
% Color for humid land
RGB_Humid_Shade = [206 , 230 , 192]; RGB_Humid_Line = [61 , 124 , 98]; RGB_Princeton_Humid = [102,194,165];

%% Setting axis range
YlimRange_Cold = [6 , 16]; YTickRange_Cold = 6 : 5 : 16;
YlimRange_Dry_Humid = [41 , 49]; YTickRange_Dry_Humid = 41 : 4 : 49;

%% Three time windows
figure
% Far History: 1850-1879
fill([1850;1879;1879;1850],...
    [YlimRange_Cold(1); YlimRange_Cold(1); YlimRange_Cold(2); YlimRange_Cold(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_Cold(1); YlimRange_Cold(1); YlimRange_Cold(2); YlimRange_Cold(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_Cold(1); YlimRange_Cold(1); YlimRange_Cold(2); YlimRange_Cold(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);

%% Plotting axis and Cold region Shade Area
% Plotting axis
[ax , ~ , ~] = plotyy(0,0,0,0); hold on;
set(get(ax(1),'ylabel'),'string','Cold Regions Area  (%)');
set(ax(1),'ylim',YlimRange_Cold,'xlim',[1948,2100],...
    'yColor',RGB_Cold_Line./255,'YTick',YTickRange_Cold,'XTick',[1850:50:2100],...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
set(ax(2),'ylim',YlimRange_Dry_Humid,'xlim',[1948,2100],'yColor','k',...
    'YTick',YTickRange_Dry_Humid,'XTick',[1850:50:2100],'FontSize',24,...
    'FontName','Arial','TickDir','out','LineWidth',2.5);
set(get(ax(2),'ylabel'),'string','Humid Lands / Drylands Area  (%)')
set(gca,'YMinorTick','on','XMinorTick','on')
xlabel('Year');

% Cold region Shade Area
% Calculate the 95% Confidence interval (c95)
c95 = (std(Cold_PM_RC)./sqrt(size(Cold_PM_RC,1))).*1.96;
fill([[1850:2100]';flipud([1850:2100]')],...
    [mean(Cold_PM_RC)' - c95';...
    flipud(mean(Cold_PM_RC)' + c95')],...
    RGB_Cold_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
clear A ax B h1 h2 ii mycolormap;

%% Plotting Dryland and Humid land
axes('position', [0.1300    0.1100    0.7750    0.8150]);
%%% Plotting Shade Area and Ensemble Mean for Dryland and Humid land
% Dryland Shade Area
% Calculate the 95% Confidence interval (c95)
c95 = (std(DryLand_PM_RC)./sqrt(size(DryLand_PM_RC,1))).*1.96;
fill([[1850:2100]';flipud([1850:2100]')],...
    [mean(DryLand_PM_RC)' - c95';...
    flipud(mean(DryLand_PM_RC)' + c95')],...
    RGB_Dry_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5);hold on;
% Humid land Shade Area
% Calculate the 95% Confidence interval (c95)
c95 = (std(HumidLand_PM_RC)./sqrt(size(HumidLand_PM_RC,1))).*1.96;
fill([[1850:2100]';flipud([1850:2100]')],...
    [mean(HumidLand_PM_RC)' - c95';...
    flipud(mean(HumidLand_PM_RC)' + c95')],...
    RGB_Humid_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5);
% Dryland Ensemble Mean
plot([1850:2100],mean(DryLand_PM_RC),...
    'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor','Linewidth',1);
% Humid land Ensemble Mean
plot([1850:2100],mean(HumidLand_PM_RC),...
    'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor','Linewidth',1);
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1948,2100]);

%%% Plotting Moving Average for Dryland and Humid land
% Dryland Moving Average
axes('position', [0.1300    0.1100    0.7750    0.8150]);
plot([1850:2100],smooth(mean(DryLand_PM_RC),7),...
    'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('Drylands');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Dry_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1948,2100]);
% Humid land Moving Average
axes('position', [0.1300    0.1100    0.7750    0.8150]);
plot([1850:2100],smooth(mean(HumidLand_PM_RC),7),...
    'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('Humid Lands');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Humid_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1948,2100]);

%% Plotting Cold Region
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% Plotting Ensemble Mean
plot([1850:2100],mean(Cold_PM_RC),...
    'Color',1.0-1*(1.0-RGB_Cold_Line./255),'EraseMode','xor','Linewidth',1); hold on;
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% Plotting moving average
plot([1850:2100],smooth(mean(Cold_PM_RC),7),...
    'Color',1.0-1*(1.0-RGB_Cold_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('CMIP6 : Cold Regions');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Cold_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);

%% DryWetRegion_Princeton
load(Path_DryWetRegion_Princeton)
% Cold Region Moving average
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% Cold Region Yearly Series
% plot([1948:2014],Cold_PM_RC,...
%     'Color',1.0-1*(1.0-RGB_Princeton_Cold./255),'EraseMode','xor','Linewidth',1);
% Cold Region Moving average
plot([1948:2014],smooth(Cold_PM_RC,7),'--',...
    'Color',1.0-1*(1.0-RGB_Princeton_Cold./255),'EraseMode','xor','Linewidth',2.5);
h = legend('Princeton : Cold Regions');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Princeton_Cold./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);

% Dryland Moving average
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% Dryland Yearly Series
% plot([1948:2014],DryLand_PM_RC,...
%     'Color',1.0-1*(1.0-RGB_Princeton_Dry./255),'EraseMode','xor','Linewidth',1); hold on;
% Dryland Moving average
plot([1948:2014],smooth(DryLand_PM_RC,7),'--',...
    'Color',1.0-1*(1.0-RGB_Princeton_Dry./255),'EraseMode','xor','Linewidth',2.5); hold on;
h = legend('Drylands');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Princeton_Dry./255);
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1948,2100]);

% Humid Land Moving average
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% Humid land Yearly Series
% plot([1948:2014],HumidLand_PM_RC,...
%     'Color',1.0-1*(1.0-RGB_Princeton_Humid./255),'EraseMode','xor','Linewidth',1);
% Humid land Moving average
plot([1948:2014],smooth(HumidLand_PM_RC,7),'--',...
    'Color',1.0-1*(1.0-RGB_Princeton_Humid./255),'EraseMode','xor','Linewidth',2.5);hold on;
h = legend('Humid Lands');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Princeton_Humid./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1948,2100]);
end