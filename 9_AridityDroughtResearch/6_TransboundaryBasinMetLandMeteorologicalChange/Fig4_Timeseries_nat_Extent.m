function Fig4_Timeseries_nat_Extent(Met_Drought_Extent_Year , Met_Drought_nat_Extent_Year)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CompoundDrought (Met&Hyd&Agr Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting Color and axis property
RGB_ALL_Shade = [245,231,238]; RGB_ALL_Line = [159,73,116]; % ALL represents historical and ssp experiments
RGB_NAT_Shade = [232,231,243]; RGB_NAT_Line = [99,100,173]; % NAT represents hist-nat and ssp-nat experiments

XlimRange = [1950,2100];
YlimRange_CD = [5,28]; YTickRange_CD = [6:5:30];
%% Plotting ALL Shade Area
% Historical CompoundDrought
CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical([4,12,15,16,21],:))'; % Selecting 5 ESMs
c95_CD_Historical = (std(CD_Historical([4,12,15,16,21],:))./sqrt(size(CD_Historical([4,12,15,16,21],:),1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_ALL_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;

% ssp245 CompoundDrought
CD_ssp = Met_Drought_Extent_Year(3).DroughtExtent_Year.CompoundDrought;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp([4,12,15,16,21],:))';
c95_CD_ssp = (std(CD_ssp([4,12,15,16,21],:))./sqrt(size(CD_ssp([4,12,15,16,21],:),1))) .* 1.96; % 95% confidence interval
c95_CD_ssp = c95_CD_ssp';
h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
    [Ensemble_Mean_CD_ssp - c95_CD_ssp; flipud(Ensemble_Mean_CD_ssp + c95_CD_ssp)],...
    RGB_ALL_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
clearvars -except Met_Drought_Extent_Year Met_Drought_nat_Extent_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line XlimRange YlimRange_CD YTickRange_CD
%% Plotting NAT Shade Area
% Historical CompoundDrought
CD_Historical = Met_Drought_nat_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)'; % Selecting 5 ESMs
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_NAT_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;

% Scenario CompoundDrought
CD_ssp = Met_Drought_nat_Extent_Year(2).DroughtExtent_Year.CompoundDrought;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';
c95_CD_ssp = (std(CD_ssp)./sqrt(size(CD_ssp,1))) .* 1.96; % 95% confidence interval
c95_CD_ssp = c95_CD_ssp';
h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
    [Ensemble_Mean_CD_ssp - c95_CD_ssp; flipud(Ensemble_Mean_CD_ssp + c95_CD_ssp)],...
    RGB_NAT_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
clearvars -except Met_Drought_Extent_Year Met_Drought_nat_Extent_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line XlimRange YlimRange_CD YTickRange_CD
%% Plotting piControl Shade Area
CD_piControl = Met_Drought_nat_Extent_Year(3).DroughtExtent_Year.CompoundDrought;
CD_piControl = CD_piControl(:);
for iii = 1 : floor(numel(CD_piControl)/151)
    Num = 1:151:numel(CD_piControl);
    RandPick(iii,:) = CD_piControl(Num(iii):Num(iii)+150);
end
CD_piControl = mean(RandPick); clear RandPick;
c95_CD_Historical = (std(CD_piControl)./sqrt(size(CD_piControl,1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
X = [1950; 1950; 1950; 2100; 2100; 2100];
Y = [mean(CD_piControl)-c95_CD_Historical; mean(CD_piControl); mean(CD_piControl)+c95_CD_Historical;...
    mean(CD_piControl)+c95_CD_Historical; mean(CD_piControl); mean(CD_piControl)-c95_CD_Historical;];
C = [0; 10; 0; 0; 10; 0];
colormap(flipud(gray))
patch(X,Y,C,'EdgeColor','none','FaceAlpha',0.5); hold on;
% Plot Statistical values
try
    text(1951,21.5,strcat( '[' , num2str(mean(CD_piControl),3),' ¡À ' ,...
        num2str(mean(c95_CD_Historical) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , [0 0 0]./255);
end
clearvars -except Met_Drought_Extent_Year Met_Drought_nat_Extent_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line XlimRange YlimRange_CD YTickRange_CD
% piControl 50 year
CD_piControl = Met_Drought_nat_Extent_Year(3).DroughtExtent_Year.CompoundDrought;
CD_piControl = CD_piControl(:);
for iii = 1 : floor(numel(CD_piControl)/50)
    Num = 1:50:numel(CD_piControl);
    RandPick(iii,:) = CD_piControl(Num(iii):Num(iii)+49);
end
% Mean Value for every 50 years
CD_piControl = mean(RandPick,2); clear RandPick;
Change = [];
for iii = 1 : length(CD_piControl)-1
    Change = [Change ; CD_piControl(iii) - CD_piControl(iii+1:end)];
end
Change = abs(Change); % Since the change of every 50 year can be both positive and negative
c95_Change = (std(Change)./sqrt(size(Change,1))) .* 1.96; % 95% confidence interval
try
    text(1975,21.5,strcat( '[' , num2str(mean(Change),2),' ¡À ' ,...
        num2str(c95_Change ,2) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , [125 125 125]./255);
end
clearvars -except Met_Drought_Extent_Year Met_Drought_nat_Extent_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting ALL Ensemble Mean
CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical([4,12,15,16,21],:))'; % Selecting 5 ESMs

CD_ssp = Met_Drought_Extent_Year(3).DroughtExtent_Year.CompoundDrought;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp([4,12,15,16,21],:))';

plot([1850:2014],Ensemble_Mean_CD_Historical,'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',1);hold on;
plot([1850:2014],smooth(Ensemble_Mean_CD_Historical,10),'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',2.5);
plot([2014:2100],Ensemble_Mean_CD_ssp,'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',1);
plot([2014:2100],smooth(Ensemble_Mean_CD_ssp,10),'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',2.5);

% Plot Statistical values
try
    % Mean over 1951-2000
    CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
    Ensemble_Mean_CD_Historical = nanmean(CD_Historical([4,12,15,16,21],:))'; % Selecting 5 ESMs
    c95_CD_Historical = (std(CD_Historical([4,12,15,16,21],:))./sqrt(size(CD_Historical([4,12,15,16,21],:),1))) .* 1.96; % 95% confidence interval
    text(1951,26.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_Historical(102:151)),3),'¡À' ,...
        num2str(mean(c95_CD_Historical(102:151)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
try
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_Extent_Year(3).DroughtExtent_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245([4,12,15,16,21],:))';
    c95_CD_ssp245 = (std(CD_ssp245([4,12,15,16,21],:))./sqrt(size(CD_ssp245([4,12,15,16,21],:),1))) .* 1.96; % 95% confidence interval
    text(2051,26.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),3),'¡À' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
try
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
    CD_ssp245 = Met_Drought_Extent_Year(3).DroughtExtent_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical([4,12,15,16,21],:))';nanmean(CD_ssp245([4,12,15,16,21],:))'];
    c95_CD_ssp245 = (std([CD_Historical([4,12,15,16,21],:),CD_ssp245([4,12,15,16,21],:)])./sqrt(size([CD_Historical([4,12,15,16,21],:),CD_ssp245([4,12,15,16,21],:)],1))) .* 1.96; % 95% confidence interval
    text(2001,26.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),3),'¡À' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
clearvars -except Met_Drought_Extent_Year Met_Drought_nat_Extent_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting NAT Ensemble Mean
CD_Historical = Met_Drought_nat_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)'; % Selecting 5 ESMs

CD_ssp = Met_Drought_nat_Extent_Year(2).DroughtExtent_Year.CompoundDrought;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';

plot([1850:2014],Ensemble_Mean_CD_Historical,'-',...
    'Color',RGB_NAT_Line./255,'Linewidth',1);hold on;
plot([1850:2014],smooth(Ensemble_Mean_CD_Historical,10),'-',...
    'Color',RGB_NAT_Line./255,'Linewidth',2.5);
plot([2014:2100],Ensemble_Mean_CD_ssp,'-',...
    'Color',RGB_NAT_Line./255,'Linewidth',1);
plot([2014:2100],smooth(Ensemble_Mean_CD_ssp,10),'-',...
    'Color',RGB_NAT_Line./255,'Linewidth',2.5);

% Plot Statistical values
try
    % Mean over 1951-2000
    CD_Historical = Met_Drought_nat_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
    Ensemble_Mean_CD_Historical = nanmean(CD_Historical)'; % Selecting 5 ESMs
    c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
    text(1951,24,strcat( '[' , num2str(mean(Ensemble_Mean_CD_Historical(102:151)),3),'¡À' ,...
        num2str(mean(c95_CD_Historical(102:151)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
try
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_nat_Extent_Year(2).DroughtExtent_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
    c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
    text(2051,24,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),3),'¡À' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
try
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_nat_Extent_Year(1).DroughtExtent_Year.CompoundDrought;
    CD_ssp245 = Met_Drought_nat_Extent_Year(2).DroughtExtent_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
    c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
    text(2001,24,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),3),'¡À' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
% Plot Time Window Line
plot([2000 2000],YlimRange_CD,'k--','LineWidth',2);
plot([2050 2050],YlimRange_CD,'k--','LineWidth',2);
% setting axis
ylabel('Area (%)');
set(gca,'xlim',XlimRange,'ylim',YlimRange_CD,'yTick',YTickRange_CD,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');

%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_ALL_Line./255,'Linewidth',3.5);hold on;
plot(0,'Color',RGB_NAT_Line./255,'Linewidth',3.5);
plot(0,'k','Linewidth',3.5);
legend('historical + ssp245','hist-nat + ssp245-nat','piControl',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')
end
