function Fig1a_Right_Plotting(CMIP_DryWetRegion)
RGB_Cold_Shade = [191,220,237]; RGB_Cold_Line = [57,83,164];
RGB_Dry_Shade = [251,191,164]; RGB_Dry_Line = [238,32,37];
RGB_Humid_Shade = [206,230,192]; RGB_Humid_Line = [61,124,98];
YlimRange_Cold = [13,22.2]; YTickRange_Cold = [13:3:22];
YlimRange_Dry_Humid = [36.5,46]; YTickRange_Dry_Humid = [36:3:48];

figure
%% DryLand for ssp126 , 245 , 585
subplot(1,6,[1:3])
H = notBoxPlot([mean(CMIP_DryWetRegion(2).HumidLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(3).HumidLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(5).HumidLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')
% HumidLand_PM_RC_CO2_Jarvis_H
set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(1).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(2).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(3).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5)

%% Cold for ssp126 , 245 , 585
axes('position', get(gca,'Position'));
H = notBoxPlot([mean(CMIP_DryWetRegion(2).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(3).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(5).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')'],'jitter',0.2);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')
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

set(gca,'ylim',YlimRange_Cold,'FontSize',24,'FontName','Arial','LineWidth',2.5,'visible','off')

%% Humid Land for ssp126 , 245 , 585
axes('position', get(gca,'Position'));
H = notBoxPlot([mean(CMIP_DryWetRegion(2).DryLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(3).DryLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(5).DryLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')'],'jitter',0.4);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')
% DryLand_PM_RC_CO2_Jarvis_H
set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(1).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Dry_Line./255)

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(2).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Dry_Line./255)

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(3).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Dry_Line./255)

set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5,'visible','off')



%% HumidLand for ssp370
subplot(1,6,[4:6])
H = notBoxPlot([mean(CMIP_DryWetRegion(4).HumidLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).HumidLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).HumidLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')
% HumidLand_PM_RC_CO2_Jarvis_H
set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(1).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')
set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5)

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(2).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Humid_Line./255),'EraseMode','xor')
set([H(3).semPtch],'FaceColor',RGB_Humid_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')
set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5)


%% Cold for ssp370
axes('position', get(gca,'Position'));
H = notBoxPlot([mean(CMIP_DryWetRegion(4).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')'],'jitter',0.2);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(1).mu],'Color',RGB_Cold_Line./255)
set([H(1).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(2).mu],'Color',RGB_Cold_Line./255)
set([H(2).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 1std
set([H(3).mu],'Color',RGB_Cold_Line./255)
set([H(3).semPtch],'FaceColor',RGB_Cold_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')
set(gca,'ylim',YlimRange_Cold,'FontSize',24,'FontName','Arial','LineWidth',2.5,'visible','off')

%% DryLand for ssp370
axes('position', get(gca,'Position'));

H = notBoxPlot([mean(CMIP_DryWetRegion(4).DryLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).DryLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).DryLand_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')'],'jitter',0.4);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')
% HumidLand_PM_RC_CO2_Jarvis_H
set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(1).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Dry_Line./255)

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(2).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(2).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Dry_Line./255)


set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
set([H(3).mu],'Color',1.0-1*(1.0-RGB_Dry_Line./255),'EraseMode','xor')
set([H(3).semPtch],'FaceColor',RGB_Dry_Shade./255,'FaceAlpha',0,'EdgeColor',RGB_Dry_Line./255)

set(gca,'ylim',YlimRange_Dry_Humid,'FontSize',24,'FontName','Arial','LineWidth',2.5,'visible','off')
end