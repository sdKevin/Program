function Fig1c_GlobalLands_Right_Plotting(CMIP_DryWetRegion)
%% Setting Color
% Color for cold region
RGB_Cold_Shade = [191 , 220 , 237]; RGB_Cold_Line = [57 , 83 , 164];
% Color for dryland
RGB_Dry_Shade = [251 , 191 , 164]; RGB_Dry_Line = [238 , 32 , 37];
% Color for humid land
RGB_Humid_Shade = [206 , 230 , 192]; RGB_Humid_Line = [61 , 124 , 98];

%% Setting axis range
YlimRange_Cold = [6 , 16]; YTickRange_Cold = 6 : 5 : 16;
YlimRange_Dry_Humid = [41 , 49]; YTickRange_Dry_Humid = 41 : 4 : 49;

%% Plotting DryLand Area Ratio Under ssp126 , 245 & 585
figure
subplot(1,6,[1:3])
H = notBoxPlot([mean(CMIP_DryWetRegion(2).DryLand_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(3).DryLand_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(5).DryLand_PM_RC(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none');

set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5);

%% Plotting Cold Region Area Ratio Under ssp126 , 245 & 585
axes('position', get(gca,'Position'));
H = notBoxPlot([mean(CMIP_DryWetRegion(2).Cold_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(3).Cold_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(5).Cold_PM_RC(:,end-30:end-1)')'],'jitter',0.4);
set(gca,'color',[ 255 255 255]./255,'Box','On');
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',RGB_Cold_Line./255);
set([H(1).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Cold_Line./255,'LineWidth',1.5);

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',RGB_Cold_Line./255);
set([H(2).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Cold_Line./255,'LineWidth',1.5);

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',RGB_Cold_Line./255);
set([H(3).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Cold_Line./255,'LineWidth',1.5);

set(gca,'ylim',YlimRange_Cold,'FontSize',24,'FontName','Arial','LineWidth',2.5,'visible','off')

%% Plotting Humid Land Area Ratio Under ssp126 , 245 & 585
axes('position', get(gca,'Position'));
H = notBoxPlot([mean(CMIP_DryWetRegion(2).HumidLand_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(3).HumidLand_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(5).HumidLand_PM_RC(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1 std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(1).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none','LineWidth',1.5)

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1 std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(2).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none','LineWidth',1.5)

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1 std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(3).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none','LineWidth',1.5)

set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5,'visible','off')

%% Plotting DryLand Area Ratio Under ssp370
subplot(1,6,[4:6])

H = notBoxPlot([mean(CMIP_DryWetRegion(4).DryLand_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).DryLand_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).DryLand_PM_RC(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',{'ssp370';'';''})
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(1).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(2).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')


set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(3).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5)

%% Plotting Cold Region Area Ratio Under ssp370
axes('position', get(gca,'Position'));
H = notBoxPlot([mean(CMIP_DryWetRegion(4).Cold_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).Cold_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).Cold_PM_RC(:,end-30:end-1)')'],'jitter',0.4);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',RGB_Cold_Line./255)
set([H(1).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Cold_Line./255,'LineWidth',1.5)

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',RGB_Cold_Line./255)
set([H(2).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Cold_Line./255,'LineWidth',1.5)

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',RGB_Cold_Line./255)
set([H(3).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Cold_Line./255,'LineWidth',1.5)

set(gca,'ylim',YlimRange_Cold,'FontSize',24,'FontName','Arial','LineWidth',2.5,'visible','off')

%% Plotting Humid Land Area Ratio Under ssp370
axes('position', get(gca,'Position'));

H = notBoxPlot([mean(CMIP_DryWetRegion(4).HumidLand_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).HumidLand_PM_RC(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).HumidLand_PM_RC(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(1).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none','LineWidth',1.5)

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(2).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none','LineWidth',1.5)

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(3).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none','LineWidth',1.5)

set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5,'visible','off')
end