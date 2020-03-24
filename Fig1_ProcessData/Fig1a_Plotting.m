function Fig1a_Plotting( Met_Year , Frank_Ta_range , CO2 , Met_Year_NoBias )
%% 建立坐标轴
% Left
axes('position',[0.1300    0.1100    0.7750.*(1-0.618)    0.8150]);box off;
set(gca,'xlim',[1000,1850],'YTick',[],'XTick',[1000:50:1850],...
    'XTickLabel',{'1000','','','','','','','1350','','','','','','','1700','','',''},'TickDir','out')
%Right
axes('position', [0.1300+0.7750.*(1-0.618)    0.1100    0.7750.*(0.618)    0.8150]);box on;
set(gca,'xlim',[1850,2100],'YTick',[],'XTick',[1850:50:2100],...
    'TickDir','out','yaxislocation','right');
% Upper Noatation
axes('position',[0.1300    0.1100+0.8150    0.7750.*(1-0.618)    0.05]);box on;
set(gca,'xlim',[1000,1850],'YTick',[],'XTick',[])
axes('position',[0.1300+0.7750.*(1-0.618)    0.1100+0.8150    0.7750.*(0.618).*(2014-1850)/(2100-1850)    0.05]);box on;
set(gca,'xlim',[1000,1850],'YTick',[],'XTick',[])
axes('position',[0.1300+0.7750.*(1-0.618)+0.7750.*(0.618).*(2014-1850)/(2100-1850)    0.1100+0.8150    0.7750.*(0.618).*(2100-2015)/(2100-1850)    0.05]);box on;
set(gca,'xlim',[1000,1850],'YTick',[],'XTick',[])
% ALL
axes('position',[0.1300    0.1100    0.7750    0.8150]);
[ax,h1,h2]=plotyy(0,0,0,0); hold on;
set(ax(1),'ylim',[-1.0,9.5],'xlim',[1000,2100],'yColor',[238,32,37]./255,...
    'YTick',[0 3 6 9],'XTick',[],'TickDir','out')
set(get(ax(1),'ylabel'),'string','Temperature Anomaly (^oC)')
set(ax(2),'ylim',[-0.08,0.059],'xlim',[1000,2100],'yColor',[100,101,174]./255,...
    'YTick',[-0.08 -0.04 0 0.04],'XTick',[],'TickDir','out');
set(get(ax(2),'ylabel'),'string','Wind Speed Anomaly (m s^-^1)')
clear A ax B h1 h2 ii mycolormap;
%% CO2
CO2=[CO2;Met_Year.CO2(1,2:end)'];
mycolormap = customcolormap([0 0.05 1], [[0,69,41]./255; [173,221,142]./255; [247,252,185]./255], length(CO2));
[A B] = sort(CO2);
% 将colorbar横过来，设置坐标25 10
colorbar('southoutside','ytick',[0 1],'yTicklabel',['';'']);
colormap(mycolormap(B,:));
%% Three Windows
axes('position', [0.1300+0.7750.*(1-0.618)    0.1100    0.7750.*(0.618)    0.8150]);box on;
fill([1850;1879;1879;1850],[0.001;0.001;0.999;0.999],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.7);hold on;
fill([1990;2019;2019;1990],[0.001;0.001;0.999;0.999],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.7);
fill([2070;2099;2099;2070],[0.001;0.001;0.999;0.999],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.7);
set(gca,'xlim',[1850,2100],'ylim',[0,1],'YTick',[],'XTick',[1850:50:2100],...
    'TickDir','out','yaxislocation','right','visible','off')
%% U2
% Plot 1850-2100 U2 [100,101,174] for Line, [205,203,229] for shade;U2 anomaly to 1948-2014;
axes('position', [0.1300+0.7750.*(1-0.618)    0.1100    0.7750.*(0.618)    0.8150]);
Ensemble_Mean = nanmean(Met_Year.U2)'; %1948-2014 is number 99-165
Ensemble_Mean = Ensemble_Mean - mean(Ensemble_Mean(99:165));
STD = std(Met_Year.U2)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean - STD; flipud(Ensemble_Mean + STD)],...
    [205,203,229]./255,'EdgeAlpha',0,'FaceAlpha',0.9);hold on;
plot([1850:2100],Ensemble_Mean,...
    'Color',1.0-1*(1.0-[100,101,174]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
xlim([1850 2100]);
ylim([-0.08,0.059]);
set(gca,'visible','off','TickDir','out','yaxislocation','right');
%% Sg
% Plot 1850-2100 Sg [57,83,164] for Line, [194,196,226] for shade;Sg anomaly to 1948-2014;
axes('position', [0.1300+0.7750.*(1-0.618)    0.1100    0.7750.*(0.618)    0.8150]);
Ensemble_Mean = nanmean(Met_Year.Sg)'; %1948-2014 is number 99-165
Ensemble_Mean = Ensemble_Mean - mean(Ensemble_Mean(99:165));
STD = std(Met_Year.Sg)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean - STD; flipud(Ensemble_Mean + STD)],...
    [194,196,226]./255,'EdgeAlpha',0,'FaceAlpha',1);hold on;
plot([1850:2100],Ensemble_Mean,...
    'Color',1.0-1*(1.0-[57,83,164]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
xlim([1850 2100]);ylim([-20,6.1]);
set(gca,'visible','off','TickDir','out','yaxislocation','right');
%% VPD
% Plot 1850-2100 VPD [245,129,51] for Line, [251,188,141] for shade;VPD anomaly to 1948-2014;
axes('position', [0.1300+0.7750.*(1-0.618)    0.1100    0.7750.*(0.618)    0.8150]);
Ensemble_Mean = nanmean(Met_Year.VPD)';
Ensemble_Mean = Ensemble_Mean - mean(Ensemble_Mean(99:165));%1948-2014 is number 99-165
STD = std(Met_Year.VPD)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean - STD; flipud(Ensemble_Mean + STD)],...
    [251,188,141]./255,'EdgeAlpha',0,'FaceAlpha',0.65);hold on;
plot([1850:2100],Ensemble_Mean,...
    'Color',1.0-0.9*(1.0-[245,129,51]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
xlim([1850 2100]);ylim([-0.075,0.83]);
set(gca,'visible','off','TickDir','out','yaxislocation','right');
%% Ta
% Plot 1000-1849 Ta [238,32,37] for Line, [252,202,184] for shade;  Ta
% anomaly to 8.34 oC; Its Mean Ta for 1948-2014 is  8.3577
axes('position', [0.1300    0.1100    0.7750.*(1-0.618)    0.8150]);
fill([Frank_Ta_range(:,1);flipud(Frank_Ta_range(:,1))],...
    [Frank_Ta_range(:,2)-Frank_Ta_range(:,3);flipud(Frank_Ta_range(:,2)+Frank_Ta_range(:,3))],...
    [252,202,184]./255,'EdgeAlpha',0,'FaceAlpha',0.65);hold on;
Frank_Ta_absolute = Frank_Ta_range(:,2) + 8.34 - 8.3577;
plot(Frank_Ta_range(:,1),Frank_Ta_range(:,2),...
    'Color',1.0-1*(1.0-[238,32,37]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
xlim([1000 1850]);ylim([-1.0,9.5]);
set(gca,'visible','off','TickDir','out','yaxislocation','right');

% Plot 1850-2100 Ta [238,32,37] for Line, [252,202,184] for shade;Ta anomaly to 1948-2014;
axes('position', [0.1300+0.7750.*(1-0.618)    0.1100    0.7750.*(0.618)    0.8150]);
Ensemble_Mean = nanmean(Met_Year.Ta)'; %1948-2014 is number 99-165
Ensemble_Mean = Ensemble_Mean - mean(Ensemble_Mean(99:165));
STD = std(Met_Year.Ta)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean - STD; flipud(Ensemble_Mean + STD)],...
    [252,202,184]./255,'EdgeAlpha',0,'FaceAlpha',0.65);hold on;
plot([1850:2100],Ensemble_Mean,...
    'Color',1.0-1*(1.0-[238,32,37]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
xlim([1850 2100]);ylim([-1.0,9.5]);
set(gca,'visible','off','TickDir','out','yaxislocation','right');
% % Plot 1000-1849 CO2 [61,124,98] for Line, [206,230,192] for shade
% axes('position', [0.1300    0.1100    0.7750.*(1-0.618)    0.8150]);
% fill([Year_CO2_sdmean(:,1);flipud(Year_CO2_sdmean(:,1))],...
%     [Year_CO2_sdmean(:,2)-3.*Year_CO2_sdmean(:,3);flipud(Year_CO2_sdmean(:,2)+3.*Year_CO2_sdmean(:,3))],...
%     [206,230,192]./255,'EdgeAlpha',0,'FaceAlpha',1);hold on;
% plot(Year_CO2_sdmean(:,1),smooth(Year_CO2_sdmean(:,2),20),...
%     'Color',[61,124,98]./255,'LineWidth',2.5);
% xlim([1000,1850]);ylim([270,1150]);
% set(gca,'visible','off','TickDir','out','yaxislocation','right');
% % Plot 1850-2100 CO2 [61,124,98] for Line, [206,230,192] for shade
% axes('position', [0.1300+0.7750.*(1-0.618)    0.1100    0.7750.*(0.618)    0.8150]);
% plot([1850:2100],mean(Met_Year.CO2),'Color',[61,124,98]./255,'LineWidth',2.5);
% xlim([1850,2100]);ylim([270,1150]);
% set(gca,'visible','off','TickDir','out','yaxislocation','right');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%单独输出%%%%%%%%%%%%%%%%%%%%%%%%%
%% Y-axis for Sg and VPD
% ALL
axes('position',[0.1300    0.1100    0.7750    0.8150]);
[ax,h1,h2]=plotyy(0,0,0,0); hold on;
set(ax(1),'ylim',[-1.0,9.5],'xlim',[1000,2100],'yColor',[238,32,37]./255,...
    'YTick',[0 3 6 9],'XTick',[],'TickDir','out')
set(get(ax(1),'ylabel'),'string','Temperature Anomaly (^oC)')
set(ax(2),'ylim',[-0.08,0.059],'xlim',[1000,2100],'yColor',[100,101,174]./255,...
    'YTick',[-0.08 -0.04 0 0.04],'XTick',[],'TickDir','out');
set(get(ax(2),'ylabel'),'string','Wind Speed Anomaly (m s^-^1)')
clear A ax B h1 h2 ii mycolormap;
axes('position', [0.4    0.1100    0.005    0.8150]);
xlim([1850 2100]);ylim([-20,6.1]); % Sg curve ylim
set(gca,'YTick',[-5:2.5:5],'XTick',[],'yColor',[57,83,164]./255,'TickDir','out')
ylabel('Downwelling Shortwave Radiation Anomaly (W m^-^2)')
axes('position', [0.8    0.1100    0.005    0.8150]);
xlim([1850 2100]);ylim([-0.075,0.83]);% VPD curve ylim
set(gca,'YTick',[0:0.2:0.6],'XTick',[],'yColor',[245,129,51]./255,'TickDir','out')
ylabel('Vapor Pressure Deficit Anomaly (kPa)')
%% Absolute Value Mean 1948-2014
%1948-2014 is number 99-165
%Ta
subplot(1,4,1)
H = notBoxPlot([mean(Met_Year_NoBias.Ta(:,99:165)')'],[]);
set(gca,'color',[ 255 255 255]./255,'Box','On')
%Dots
set([H.data],'MarkerSize',6,...
    'markerFaceColor',[77,77,77]./255,...
    'markerEdgeColor', 'none')
set([H.sdPtch],...
    'FaceColor',[252,202,184]./255,...
    'EdgeColor','none')
set([H.semPtch],...
    'FaceColor',[238,32,37]./255,...
    'EdgeColor','none','FaceAlpha',0.7)
set([H.mu],...
    'Color','k')
set(gca,'YTick',[7:11],'XTick',1,'XTickLabel',['Ta'],'TickDir','in','TickLength',[0.005 0])
%VPD
subplot(1,4,2)
H = notBoxPlot([mean(Met_Year_NoBias.VPD(:,99:165)')'],[]);
set(gca,'color',[ 255 255 255]./255,'Box','On')
%Dots
set([H.data],'MarkerSize',6,...
    'markerFaceColor',[77,77,77]./255,...
    'markerEdgeColor', 'none')
set([H.sdPtch],...
    'FaceColor',[251,188,141]./255,...
    'EdgeColor','none','FaceAlpha',0.7)
set([H.semPtch],...
    'FaceColor',[245 129 51]./255,...
    'EdgeColor','none')
set([H.mu],...
    'Color','k')
set(gca,'YTick',[0.55:0.1:0.95],'XTick',1,'XTickLabel',['VPD'],'TickDir','in','TickLength',[0.005 0])
%Sg
subplot(1,4,3)
H = notBoxPlot([mean(Met_Year_NoBias.Sg(:,99:165)')'],[]);
set(gca,'color',[ 255 255 255]./255,'Box','On')
%Dots
set([H.data],'MarkerSize',6,...
    'markerFaceColor',[77,77,77]./255,...
    'markerEdgeColor', 'none')
set([H.sdPtch],...
    'FaceColor',[194,196,226]./255,...
    'EdgeColor','none')
set([H.semPtch],...
    'FaceColor',[57 83 164]./255,...
    'EdgeColor','none','FaceAlpha',0.7)
set([H.mu],...
    'Color','k')
set(gca,'YTick',[165:5:190],'XTick',1,'XTickLabel',['Sg'],'TickDir','in','ylim',[165 188],'TickLength',[0.005 0])
%U2
subplot(1,4,4)
H = notBoxPlot([mean(Met_Year_NoBias.U2(:,99:165)')'],[]);
set(gca,'color',[ 255 255 255]./255,'Box','On')
%Dots
set([H.data],'MarkerSize',6,...
    'markerFaceColor',[77,77,77]./255,...
    'markerEdgeColor', 'none')
set([H.sdPtch],...
    'FaceColor',[205,203,229]./255,...
    'EdgeColor','none')
set([H.semPtch],...
    'FaceColor',[100 101 174]./255,...
    'EdgeColor','none','FaceAlpha',0.7)
set([H.mu],...
    'Color','k')
set(gca,'YTick',[2:0.4:3.4],'XTick',1,'XTickLabel',['U_2'],'TickDir','in','TickLength',[0.005 0])

end