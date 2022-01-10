function Fig_Timeseries_Extent(Met_Drought_Extent_Year)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CompoundDrought (Met&Hyd&Agr Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% CompoundDrought1
RGB_ssp_Shade = [252,218,197; 198,234,251; 161,196,218; 249,199,190];
RGB_ssp_Line = [245,132,63; 253,141,60; 239,101,72; 238,32,37];
XlimRange = [1950,2100];
YlimRange_CD = [7.5,29.5]; YTickRange_CD = [10:5:30];
% %% Three time windows
% %  Contemporary: 1948-2014
% fill([1948;2014;2014;1948],...
%     [YlimRange_CD(1); YlimRange_CD(1); YlimRange_CD(2); YlimRange_CD(2)],...
%     [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9); hold on;
% % Far Future: 2070-2099
% fill([2070;2099;2099;2070],...
%     [YlimRange_CD(1); YlimRange_CD(1); YlimRange_CD(2); YlimRange_CD(2)],...
%     [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.9);
%% Plotting Shade Area
% Historical CompoundDrought
CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;

% Scenario CompoundDrought
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
        CD_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
    end
    CD_ssp = Met_Drought_Extent_Year(i_ssp).DroughtExtent_Year.CompoundDrought;
    CD_ssp = [CD_Historical(:,end) , CD_ssp];
    Ensemble_Mean_CD_ssp(:,i_ssp-1) = nanmean(CD_ssp)';
    c95_CD_ssp = (std(CD_ssp)./sqrt(size(CD_ssp,1))) .* 1.96; % 95% confidence interval
    c95_CD_ssp = c95_CD_ssp';
    if i_ssp == 5|| i_ssp == 2
        h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
            [Ensemble_Mean_CD_ssp(:,i_ssp-1) - c95_CD_ssp; flipud(Ensemble_Mean_CD_ssp(:,i_ssp-1) + c95_CD_ssp)],...
            RGB_ssp_Shade(i_ssp-1,:)./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
    end
end
%% Plotting Ensemble Mean
plot([1850:2014],Ensemble_Mean_CD_Historical,'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',1);hold on;
plot([1850:2014],smooth(Ensemble_Mean_CD_Historical,10),'-',...
    'Color',RGB_Historical_Line./255,'Linewidth',2.5);
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot([2014:2100],Ensemble_Mean_CD_ssp(:,i_ssp),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',1);
        plot([2014:2100],smooth(Ensemble_Mean_CD_ssp(:,i_ssp),10),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    else
        plot([2014:2100],smooth(Ensemble_Mean_CD_ssp(:,i_ssp),10),'-',...
            'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',2.5);
    end
end
% setting axis
ylabel('Area (%)');
set(gca,'xlim',XlimRange,'ylim',YlimRange_CD,'yTick',YTickRange_CD,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_Historical_Line./255,'Linewidth',3.5);hold on;
for i_ssp = [1,2,3,4]
    if i_ssp == 1|| i_ssp ==4
        plot(0,'Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    else
        plot(0,'-','Color',RGB_ssp_Line(i_ssp,:)./255,'Linewidth',3.5);
    end
end
legend('historical','ssp126','ssp245','ssp370','ssp585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Drought_Extent_Year
end
