function Fig1a_GlobalLands_Right_Plotting(CMIP_DryWetRegion)
%% Setting Color
% Color for ssp126 cold lands
RGB_ssp126_Shade = [234 , 208 , 220]; RGB_ssp126_Line = [159 , 73 , 116];
% Color for ssp245 cold lands
RGB_ssp245_Shade = [210 , 208 , 232]; RGB_ssp245_Line = [99 , 100 , 173];
% Color for ssp370 cold lands
RGB_ssp370_Shade = [194 , 196 , 226]; RGB_ssp370_Line = [56 , 82 , 164];
% Color for ssp585 cold lands
RGB_ssp585_Shade = [191 , 220 , 237]; RGB_ssp585_Line = [57 , 83 , 164];

%% Setting axis range
YlimRange_Cold = [11 , 19.5];

%% Plotting Cold Region Area Ratio Under ssp126 , 245 & 585
figure
subplot(1,6,[1:3])

H = notBoxPlot([mean(CMIP_DryWetRegion(2).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(3).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(5).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')'],'jitter',0.4);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',RGB_ssp126_Line./255);
set([H(1).semPtch],'FaceColor',RGB_ssp126_Shade./255,'FaceAlpha',0.5,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',RGB_ssp245_Line./255);
set([H(2).semPtch],'FaceColor',RGB_ssp245_Shade./255,'FaceAlpha',0.5,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',RGB_ssp585_Line./255);
set([H(3).semPtch],'FaceColor',RGB_ssp585_Shade./255,'FaceAlpha',0.5,'EdgeColor','none');

set(gca,'ylim',YlimRange_Cold,'FontSize',24,'FontName','Arial','LineWidth',2.5)

%% Plotting Cold Region Area Ratio Under ssp370
subplot(1,6,[4:6])
H = notBoxPlot([mean(CMIP_DryWetRegion(4).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')',...
    mean(CMIP_DryWetRegion(4).Cold_PM_RC_CO2_Jarvis_H(:,end-30:end-1)')'],'jitter',0.4);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',{'ssp370';'';''})
set([H.data],'MarkerSize',6,...
    'markerFaceColor','none',...
    'markerEdgeColor', 'none')

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',RGB_ssp370_Line./255)
set([H(1).semPtch],'FaceColor',RGB_ssp370_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',RGB_ssp370_Line./255)
set([H(2).semPtch],'FaceColor',RGB_ssp370_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',RGB_ssp370_Line./255)
set([H(3).semPtch],'FaceColor',RGB_ssp370_Shade./255,'FaceAlpha',0.5,'EdgeColor','none')

set(gca,'ylim',YlimRange_Cold,'FontSize',24,'FontName','Arial','LineWidth',2.5)
end