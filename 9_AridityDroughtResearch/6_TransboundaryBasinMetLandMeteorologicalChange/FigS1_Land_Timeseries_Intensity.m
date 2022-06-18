function FigS1_Land_Timeseries_Intensity(Met_Drought_Intensity_Year)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CompoundDrought (Met&Hyd&Agr Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
% CompoundDrought
RGB_ssp_Shade = [200,202,229; 223,238,246; 252,218,197; 254,223,209];
RGB_ssp_Line = [50,78,161; 133,184,227; 245,132,63; 238,31,36];
XlimRange = [1950,2100];
YlimRange_CD = [0.055,0.071]; YTickRange_CD = [0.055:0.005:0.071];
%% Plotting Shade Area
% Historical CompoundDrought
CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_Historical_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;

% Scenario CompoundDrought
for i_ssp = [5,4,3,2]
    if i_ssp == 4
        CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
        CD_Historical(13,:) = []; % HadGEM3-GC31-LL
    else
        CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
    end
    CD_ssp = Met_Drought_Intensity_Year(i_ssp).DroughtIntensity_Year.CompoundDrought;
    CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
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
% Plot Statistical values
try
    % Mean over 1951-2000
    CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
    Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
    c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
    text(1975,0.069,strcat( '[' , num2str(mean(Ensemble_Mean_CD_Historical(102:151)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_Historical(102:151)) ,'%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_Historical_Line./255);
end
try
    % ssp 585 Mean over 2051-2100
    CD_ssp585 = Met_Drought_Intensity_Year(5).DroughtIntensity_Year.CompoundDrought;
    CD_ssp585 = CD_ssp585 - repmat((CD_ssp585(:,1) - CD_Historical(:,end)),1,size(CD_ssp585,2));
    CD_ssp585 = [CD_Historical(:,end) , CD_ssp585];
    Ensemble_Mean_CD_ssp585 = nanmean(CD_ssp585)';
    c95_CD_ssp585 = (std(CD_ssp585)./sqrt(size(CD_ssp585,1))) .* 1.96; % 95% confidence interval
    text(2051,0.059,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp585(37:86)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_ssp585(37:86)) , '%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ssp_Line(4,:)./255);
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_Intensity_Year(3).DroughtIntensity_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
    c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
    text(2051,0.0565,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,'%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ssp_Line(2,:)./255);
    % ssp 126 Mean over 2051-2100
    CD_ssp126 = Met_Drought_Intensity_Year(2).DroughtIntensity_Year.CompoundDrought;
    CD_ssp126 = CD_ssp126 - repmat((CD_ssp126(:,1) - CD_Historical(:,end)),1,size(CD_ssp126,2));
    CD_ssp126 = [CD_Historical(:,end) , CD_ssp126];
    Ensemble_Mean_CD_ssp126 = nanmean(CD_ssp126)';
    c95_CD_ssp126 = (std(CD_ssp126)./sqrt(size(CD_ssp126,1))) .* 1.96; % 95% confidence interval
    text(2076,0.0565 , strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp126(37:86)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_ssp126(37:86)) ,'%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ssp_Line(1,:)./255);
    % ssp 370 Mean over 2051-2100
    CD_ssp370 = Met_Drought_Intensity_Year(4).DroughtIntensity_Year.CompoundDrought;
    CD_Historical(13,:) = []; % since HadGEM3-GC31-LL model does not have ssp370
    CD_ssp370 = CD_ssp370 - repmat((CD_ssp370(:,1) - CD_Historical(:,end)),1,size(CD_ssp370,2));
    CD_ssp370 = [CD_Historical(:,end) , CD_ssp370];
    Ensemble_Mean_CD_ssp370 = nanmean(CD_ssp370)';
    c95_CD_ssp370 = (std(CD_ssp370)./sqrt(size(CD_ssp370,1))) .* 1.96; % 95% confidence interval
    text(2076,0.059,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp370(37:86)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_ssp370(37:86)) ,'%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ssp_Line(3,:)./255);
end
try
    % ssp 585 Mean over 2001-2052
    CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
    CD_ssp585 = Met_Drought_Intensity_Year(5).DroughtIntensity_Year.CompoundDrought;
    CD_ssp585 = CD_ssp585 - repmat((CD_ssp585(:,1) - CD_Historical(:,end)),1,size(CD_ssp585,2));
    Ensemble_Mean_CD_ssp585 = [nanmean(CD_Historical)';nanmean(CD_ssp585)'];
    c95_CD_ssp585 = (std([CD_Historical,CD_ssp585])./sqrt(size([CD_Historical,CD_ssp585],1))) .* 1.96; % 95% confidence interval
    text(2001,0.069,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp585(152:201)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_ssp585(152:201)) ,'%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ssp_Line(4,:)./255);
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
    CD_ssp245 = Met_Drought_Intensity_Year(3).DroughtIntensity_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
    c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
    text(2001,0.0665,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,'%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ssp_Line(2,:)./255);
    % ssp 126 Mean over 2001-2052
    CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
    CD_ssp126 = Met_Drought_Intensity_Year(2).DroughtIntensity_Year.CompoundDrought;
    CD_ssp126 = CD_ssp126 - repmat((CD_ssp126(:,1) - CD_Historical(:,end)),1,size(CD_ssp126,2));
    Ensemble_Mean_CD_ssp126 = [nanmean(CD_Historical)';nanmean(CD_ssp126)'];
    c95_CD_ssp126 = (std([CD_Historical,CD_ssp126])./sqrt(size([CD_Historical,CD_ssp126],1))) .* 1.96; % 95% confidence interval
    text(2026,0.0665,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp126(152:201)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_ssp126(152:201)) ,'%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ssp_Line(1,:)./255);
    % ssp 370 Mean over 2001-2052
    CD_Historical = Met_Drought_Intensity_Year(1).DroughtIntensity_Year.CompoundDrought;
    CD_Historical(13,:) = []; % since HadGEM3-GC31-LL model does not have ssp370
    CD_ssp370 = Met_Drought_Intensity_Year(4).DroughtIntensity_Year.CompoundDrought;
    CD_ssp370 = CD_ssp370 - repmat((CD_ssp370(:,1) - CD_Historical(:,end)),1,size(CD_ssp370,2));
    Ensemble_Mean_CD_ssp370 = [nanmean(CD_Historical)';nanmean(CD_ssp370)'];
    c95_CD_ssp370 = (std([CD_Historical,CD_ssp370])./sqrt(size([CD_Historical,CD_ssp370],1))) .* 1.96; % 95% confidence interval
    text(2026,0.069,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp370(152:201)),'%.3f'),'¡À' ,...
        num2str(mean(c95_CD_ssp370(152:201)) ,'%.3f') , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ssp_Line(3,:)./255);
end
% Plot Time Window Line
plot([2000 2000],YlimRange_CD,'k--','LineWidth',2);
plot([2050 2050],YlimRange_CD,'k--','LineWidth',2);
% setting axis
ylabel('Intensity Index');
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
legend('HIST','SSP126','SSP245','SSP370','SSP585',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
clearvars -except Met_Drought_Intensity_Year
end
