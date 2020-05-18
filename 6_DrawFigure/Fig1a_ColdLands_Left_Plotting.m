function Fig1a_ColdLands_Left_Plotting(CMIP_DryWetRegion , Path_DryWetRegion_Princeton)
%% Cold Lands Data
% Cold_ssp126 is cold lands area ratio from 1850 to 2100
Cold_historical = CMIP_DryWetRegion(1).Cold_PM_RC_CO2_Jarvis_H;
% Cold_ssp126 is cold lands area ratio from 1850 to 2100
Cold_ssp126 = [Cold_historical(:,end) , CMIP_DryWetRegion(2).Cold_PM_RC_CO2_Jarvis_H];
% Cold_ssp245 is cold lands area ratio from 1850 to 2100
% Cold_ssp245 = [Cold_historical(:,end) , CMIP_DryWetRegion(3).Cold_PM_RC_CO2_Jarvis_H];
% Cold_ssp370 is cold lands area ratio from 1850 to 2100
% Cold_ssp370 = [Cold_historical([1:15,17:end],end) , CMIP_DryWetRegion(4).Cold_PM_RC_CO2_Jarvis_H];
% Cold_ssp585 is cold lands area ratio from 1850 to 2100
Cold_ssp585 = [Cold_historical(:,end) , CMIP_DryWetRegion(5).Cold_PM_RC_CO2_Jarvis_H];

%% Setting Color
% Color for Historical Period
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% Color for Princeton cold lands
RGB_Princeton_Cold = [112,131,164];
% Color for ssp126 cold lands
RGB_ssp126_Shade = [234 , 208 , 220]; RGB_ssp126_Line = [159 , 73 , 116];
% Color for ssp585 cold lands
RGB_ssp585_Shade = [191 , 220 , 237]; RGB_ssp585_Line = [57 , 83 , 164];

%% Setting axis range
YlimRange_Cold = [11 , 19.5]; YTickRange_Cold = 12 : 2 : 19.5;

%% Time windows
figure
% Contemporary: 1948-2014
fill([1948;2014;2014;1948],...
    [YlimRange_Cold(1); YlimRange_Cold(1); YlimRange_Cold(2); YlimRange_Cold(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);hold on;
% Far Future: 2070-2099
fill([2070;2099;2099;2070],...
    [YlimRange_Cold(1); YlimRange_Cold(1); YlimRange_Cold(2); YlimRange_Cold(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);

%% Plotting axis and Cold region Shade Area
% Plotting axis
plot(0,0); hold on;
ylabel('Cold Lands Area  (%)')
set(gca,'ylim',YlimRange_Cold,'xlim',[1948,2100],...
    'YMinorTick','on', 'YTick',YTickRange_Cold,'XTick',[1850:50:2100],...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
xlabel('Year');

% Cold region Shade Area
% Calculate the 95% Confidence interval (c95)
c95 = (std(Cold_historical)./sqrt(size(Cold_historical,1))) .* 1.96;
fill([[1850:2014]';flipud([1850:2014]')],...
    [mean(Cold_historical)' - c95';...
    flipud(mean(Cold_historical)' + c95')],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
clear A ax B h1 h2 ii mycolormap;

%% Plotting Cold lands for ssp126 and ssp585
axes('position', [0.1300    0.1100    0.7750    0.8150]);
%%% Plotting Shade Area and Ensemble Mean for ssp126 and ssp585
% ssp126 Shade Area
% Calculate the 95% Confidence interval (c95)
c95 = (std(Cold_ssp126)./sqrt(size(Cold_ssp126,1))).*1.96;
fill([[2014:2100]';flipud([2014:2100]')],...
    [mean(Cold_ssp126)' - c95';...
    flipud(mean(Cold_ssp126)' + c95')],...
    RGB_ssp126_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
% ssp585 Shade Area
% Calculate the 95% Confidence interval (c95)
c95 = (std(Cold_ssp585)./sqrt(size(Cold_ssp585,1))).*1.96;
fill([[2014:2100]';flipud([2014:2100]')],...
    [mean(Cold_ssp585)' - c95';...
    flipud(mean(Cold_ssp585)' + c95')],...
    RGB_ssp585_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5);
% ssp126 Ensemble Mean
plot([2014:2100],mean(Cold_ssp126),...
    'Color',1.0-1*(1.0-RGB_ssp126_Line./255),'EraseMode','xor','Linewidth',1);
% ssp585 Ensemble Mean
plot([2014:2100],mean(Cold_ssp585),...
    'Color',1.0-1*(1.0-RGB_ssp585_Line./255),'EraseMode','xor','Linewidth',1);
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);

%%% Plotting Moving Average for ssp126 and ssp585
% ssp126 Moving Average
axes('position', [0.1300    0.1100    0.7750    0.8150]);
plot([2014:2100],smooth(mean(Cold_ssp126),7),...
    'Color',1.0-1*(1.0-RGB_ssp126_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('CMIP6 SSP126');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_ssp126_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);
% ssp585 Moving Average
axes('position', [0.1300    0.1100    0.7750    0.8150]);
plot([2014:2100],smooth(mean(Cold_ssp585),7),...
    'Color',1.0-1*(1.0-RGB_ssp585_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('CMIP6 SSP585');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_ssp585_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);

%% Plotting Cold Region
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% Plotting Ensemble Mean
plot([1850:2014],mean(Cold_historical),...
    'Color',1.0-1*(1.0-RGB_Historical_Line./255),'EraseMode','xor','Linewidth',1); hold on;
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% Plotting moving average
plot([1850:2014],smooth(mean(Cold_historical),7),...
    'Color',1.0-1*(1.0-RGB_Historical_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('CMIP6 Historical');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Historical_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);

%% DryWetRegion_Princeton
load(Path_DryWetRegion_Princeton)
% Cold Region Moving average
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% Cold Region Yearly Series
% plot([1948:2014],Cold_ssp126,...
%     'Color',1.0-1*(1.0-RGB_Princeton_Cold./255),'EraseMode','xor','Linewidth',1);
% Cold Region Moving average
plot([1948:2014],smooth(Cold_PM_RC_CO2_Jarvis_H,7),'--',...
    'Color',1.0-1*(1.0-RGB_Princeton_Cold./255),'EraseMode','xor','Linewidth',2.5);
h = legend('Princeton Reanalysis');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Princeton_Cold./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1948,2100]);
end