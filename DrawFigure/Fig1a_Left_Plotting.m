function Fig1a_Left_Plotting(CMIP_DryWetRegion , Path_DryWetRegion_Princeton)
RGB_Cold_Shade = [191,220,237];RGB_Cold_Line = [57,83,164];
RGB_Dry_Shade = [251,191,164];RGB_Dry_Line = [238,32,37];
RGB_Humid_Shade = [206,230,192];RGB_Humid_Line = [61,124,98];
YlimRange_Cold = [12,22.2];YTickRange_Cold = [12:3:22];
YlimRange_Dry_Humid = [36.5,46];YTickRange_Dry_Humid = [36:3:48];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Left%%%%%%%%%%%%%%%%%%%%%%%%
%% DryWetRegion_CLM
Cold_PM_RC_CO2_Jarvis_H = cat(2 , CMIP_DryWetRegion(1).Cold_PM_RC_CO2_Jarvis_H , CMIP_DryWetRegion(2).Cold_PM_RC_CO2_Jarvis_H);
DryLand_PM_RC_CO2_Jarvis_H = cat(2 , CMIP_DryWetRegion(1).DryLand_PM_RC_CO2_Jarvis_H , CMIP_DryWetRegion(2).DryLand_PM_RC_CO2_Jarvis_H);
HumidLand_PM_RC_CO2_Jarvis_H = cat(2 , CMIP_DryWetRegion(1).HumidLand_PM_RC_CO2_Jarvis_H , CMIP_DryWetRegion(2).HumidLand_PM_RC_CO2_Jarvis_H);

figure
% 画坐标轴底图，并添加Cold的Shade Area
[ax,h1,h2]=plotyy(0,0,0,0); hold on;
set(get(ax(1),'ylabel'),'string','Cold Regions Area  (%)')
set(ax(1),'ylim',YlimRange_Cold,'xlim',[1850,2100],'yColor',RGB_Cold_Line./255,...
    'YTick',YTickRange_Cold,'XTick',[1850:50:2100],'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
%% Three Windows
fill([1850;1879;1879;1850],[YlimRange_Cold(1);YlimRange_Cold(1);YlimRange_Cold(2);YlimRange_Cold(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);hold on;
fill([1948;2014;2014;1948],[YlimRange_Cold(1);YlimRange_Cold(1);YlimRange_Cold(2);YlimRange_Cold(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
fill([2070;2099;2099;2070],[YlimRange_Cold(1);YlimRange_Cold(1);YlimRange_Cold(2);YlimRange_Cold(2)],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%Cold Shade Area
c95 = (std(Cold_PM_RC_CO2_Jarvis_H)./sqrt(size(Cold_PM_RC_CO2_Jarvis_H,1))).*1.96;
fill([[1850:2100]';flipud([1850:2100]')],...
    [mean(Cold_PM_RC_CO2_Jarvis_H)' - c95';...
    flipud(mean(Cold_PM_RC_CO2_Jarvis_H)' + c95')],...
    RGB_Cold_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5);hold on;
set(ax(2),'ylim',YlimRange_Dry_Humid,'xlim',[1850,2100],'yColor','k',...
    'YTick',YTickRange_Dry_Humid,'XTick',[1850:50:2100],'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
set(get(ax(2),'ylabel'),'string','Humid Lands / Drylands Area  (%)')
xlabel('Year');
clear A ax B h1 h2 ii mycolormap;
%% Dry and Humid
axes('position', [0.1300    0.1100    0.7750    0.8150]);
%%% 画Dry和Humid的Sahde Area和Ensemble Mean
% Dry
c95 = (std(DryLand_PM_RC_CO2_Jarvis_H)./sqrt(size(DryLand_PM_RC_CO2_Jarvis_H,1))).*1.96;
fill([[1850:2100]';flipud([1850:2100]')],...
    [mean(DryLand_PM_RC_CO2_Jarvis_H)' - c95';...
    flipud(mean(DryLand_PM_RC_CO2_Jarvis_H)' + c95')],...
    RGB_Dry_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5);hold on;
% Humid
c95 = (std(HumidLand_PM_RC_CO2_Jarvis_H)./sqrt(size(HumidLand_PM_RC_CO2_Jarvis_H,1))).*1.96;
fill([[1850:2100]';flipud([1850:2100]')],...
    [mean(HumidLand_PM_RC_CO2_Jarvis_H)' - c95';...
    flipud(mean(HumidLand_PM_RC_CO2_Jarvis_H)' + c95')],...
    RGB_Humid_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5);
%%% Ensemble Mean
% Dry
plot([1850:2100],mean(DryLand_PM_RC_CO2_Jarvis_H),...
    'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度
% Humid
plot([1850:2100],mean(HumidLand_PM_RC_CO2_Jarvis_H),...
    'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor','Linewidth',1);% 1为透明度
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1850,2100]);
%%% 画Dry和Humid的滑动平均
% Dry
axes('position', [0.1300    0.1100    0.7750    0.8150]);
plot([1850:2100],smooth(mean(DryLand_PM_RC_CO2_Jarvis_H),7),...
    'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('CMIP6 Drylands');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Dry_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1850,2100]);
% Humid
axes('position', [0.1300    0.1100    0.7750    0.8150]);
plot([1850:2100],smooth(mean(HumidLand_PM_RC_CO2_Jarvis_H),7),...
    'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('CMIP6 Humid Lands');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Humid_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1850,2100]);
%% Cold
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% 画Cold的Ensemble Mean
plot([1850:2100],mean(Cold_PM_RC_CO2_Jarvis_H),...
    'Color',1.0-1*(1.0-RGB_Cold_Line./255),'EraseMode','xor','Linewidth',1);hold on;% 1为透明度
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1850,2100]);
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% 画Cold的滑动平均
plot([1850:2100],smooth(mean(Cold_PM_RC_CO2_Jarvis_H),7),...
    'Color',1.0-1*(1.0-RGB_Cold_Line./255),'EraseMode','xor','Linewidth',2.5);
h = legend('CMIP6 Cold Regions');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',RGB_Cold_Line./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1850,2100]);
%% DryWetRegion_Princeton 普林斯顿
load(Path_DryWetRegion_Princeton)
% Cold 滑动平均
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1948:2014],Cold_PM_RC_CO2_Jarvis_H,...
%     'Color',1.0-1*(1.0-[183,154,200]./255),'EraseMode','xor','Linewidth',1);% 1为透明度
plot([1948:2014],smooth(Cold_PM_RC_CO2_Jarvis_H,7),'--',...
    'Color',1.0-1*(1.0-[112,131,164]./255),'EraseMode','xor','Linewidth',2.5);
h = legend('Princeton Cold Regions');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',[112,131,164]./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Cold,'xlim',[1850,2100]);
% Dry 滑动平均
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1948:2014],DryLand_PM_RC_CO2_Jarvis_H,...
%     'Color',1.0-1*(1.0-[245,129,51]./255),'EraseMode','xor','Linewidth',1);hold on;% 1为透明度
plot([1948:2014],smooth(DryLand_PM_RC_CO2_Jarvis_H,7),'--',...
    'Color',1.0-1*(1.0-[208,106,95]./255),'EraseMode','xor','Linewidth',2.5);hold on;
h = legend('Princeton Drylands');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',[208,106,95]./255);
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1850,2100]);
% Humid 滑动平均
axes('position', [0.1300    0.1100    0.7750    0.8150]);
% plot([1948:2014],HumidLand_PM_RC_CO2_Jarvis_H,...
%     'Color',1.0-1*(1.0-[102,194,165]./255),'EraseMode','xor','Linewidth',1);% 1为透明度
plot([1948:2014],smooth(HumidLand_PM_RC_CO2_Jarvis_H,7),'--',...
    'Color',1.0-1*(1.0-[102,194,165]./255),'EraseMode','xor','Linewidth',2.5);hold on;
h = legend('Princeton Humid Lands');
set(h,'Box','off','FontSize',24,'FontName','Arial','TextColor',[102,194,165]./255)
set(gca,'visible','off','TickDir','out','yaxislocation','right','ylim',YlimRange_Dry_Humid,'xlim',[1850,2100]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Right%%%%%%%%%%%%%%%%%%%%%%%%
clear -regexp [^CMIP_DryWetRegion,^Path_DryWetRegion_Princeton]
RGB_Cold_Shade = [191,220,237]; RGB_Cold_Line = [57,83,164];
RGB_Dry_Shade = [251,191,164]; RGB_Dry_Line = [238,32,37];
RGB_Humid_Shade = [206,230,192]; RGB_Humid_Line = [61,124,98];
YlimRange_Cold = [12,22.2]; YTickRange_Cold = [12:3:22];
YlimRange_Dry_Humid = [36.5,46]; YTickRange_Dry_Humid = [36:3:48];

Cold_PM_RC_CO2_Jarvis_H = cat(2 , CMIP_DryWetRegion(1).Cold_PM_RC_CO2_Jarvis_H , CMIP_DryWetRegion(2).Cold_PM_RC_CO2_Jarvis_H);
DryLand_PM_RC_CO2_Jarvis_H = cat(2 , CMIP_DryWetRegion(1).DryLand_PM_RC_CO2_Jarvis_H , CMIP_DryWetRegion(2).DryLand_PM_RC_CO2_Jarvis_H);
HumidLand_PM_RC_CO2_Jarvis_H = cat(2 , CMIP_DryWetRegion(1).HumidLand_PM_RC_CO2_Jarvis_H , CMIP_DryWetRegion(2).HumidLand_PM_RC_CO2_Jarvis_H);

figure
% Dry and Humid
subplot(1,9,[1:6])
H = notBoxPlot([mean(DryLand_PM_RC_CO2_Jarvis_H(:,1:30)')',mean(DryLand_PM_RC_CO2_Jarvis_H(:,99:165)')',...
    mean(DryLand_PM_RC_CO2_Jarvis_H(:,221:250)')',...
    mean(HumidLand_PM_RC_CO2_Jarvis_H(:,1:30)')',mean(HumidLand_PM_RC_CO2_Jarvis_H(:,99:165)')',...
    mean(HumidLand_PM_RC_CO2_Jarvis_H(:,221:250)')'],[]);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')
% DryLand_PM_RC_CO2_Jarvis_H
set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(1).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(2).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(3).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')
% HumidLand_PM_RC_CO2_Jarvis_H
set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(4).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(4).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(5).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(5).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(5).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(6).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(6).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(6).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5)
% Cold
subplot(1,9,[7:9])
H = notBoxPlot([mean(Cold_PM_RC_CO2_Jarvis_H(:,1:30)')',mean(Cold_PM_RC_CO2_Jarvis_H(:,99:195)')',...
    mean(Cold_PM_RC_CO2_Jarvis_H(:,221:250)')'],[]);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',5,...
    'markerFaceColor','none',...
    'markerEdgeColor','none' )
% Cold_PM_RC_CO2_Jarvis_H
set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(1).mu],'Color',RGB_Cold_Line./255)
set([H(1).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')
set(gca,'ylim',YlimRange_Cold,'FontSize',24,'FontName','Arial','LineWidth',2.5)

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(2).mu],'Color',RGB_Cold_Line./255)
set([H(2).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(3).mu],'Color',RGB_Cold_Line./255)
set([H(3).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')
set(gca,'ylim',YlimRange_Cold,'FontSize',24,'FontName','Arial','LineWidth',2.5)
end