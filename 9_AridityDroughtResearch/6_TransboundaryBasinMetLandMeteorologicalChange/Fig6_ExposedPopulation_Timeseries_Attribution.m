function Fig6_ExposedPopulation_Timeseries_Attribution(Met_Drought_Population_Attribution_Year , Met_Drought_FractionalPopulation_Attribution_Year)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Population CompoundDrought (Met&Hyd&Agr Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,[1,2])
%% Setting Color and axis property
RGB_ALL_Shade = [245,231,238]; RGB_ALL_Line = [159,73,116]; % ALL represents historical and ssp experiments
RGB_NAT_Shade = [232,231,243]; RGB_NAT_Line = [99,100,173]; % NAT represents hist-nat and ssp-nat experiments
RGB_POP_Shade = [243,250,239]; RGB_POP_Line = [60,124,98]; % POP represents results with fixed population

XlimRange = [1950,2100];
YlimRange_CD = [100,650]; YTickRange_CD = [100:100:600];
%% Plotting ALL Shade Area
% Historical CompoundDrought
CD_Historical = Met_Drought_Population_Attribution_Year(1).Population_Year.CompoundDrought ./ 1000000;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_ALL_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;

% Scenario CompoundDrought
CD_ssp = Met_Drought_Population_Attribution_Year(2).Population_Year.CompoundDrought ./ 1000000;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';
c95_CD_ssp = (std(CD_ssp)./sqrt(size(CD_ssp,1))) .* 1.96; % 95% confidence interval
c95_CD_ssp = c95_CD_ssp';
h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
    [Ensemble_Mean_CD_ssp - c95_CD_ssp; flipud(Ensemble_Mean_CD_ssp + c95_CD_ssp)],...
    RGB_ALL_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD
%% Plotting NAT Shade Area
% Historical CompoundDrought
CD_Historical = Met_Drought_Population_Attribution_Year(3).Population_Year.CompoundDrought ./ 1000000;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_NAT_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;

% Scenario CompoundDrought
CD_ssp = Met_Drought_Population_Attribution_Year(4).Population_Year.CompoundDrought ./ 1000000;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';
c95_CD_ssp = (std(CD_ssp)./sqrt(size(CD_ssp,1))) .* 1.96; % 95% confidence interval
c95_CD_ssp = c95_CD_ssp';
h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
    [Ensemble_Mean_CD_ssp - c95_CD_ssp; flipud(Ensemble_Mean_CD_ssp + c95_CD_ssp)],...
    RGB_NAT_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD
%% Plotting piControl Shade Area
% piControl 150 year 
CD_piControl = Met_Drought_Population_Attribution_Year(5).Population_Year.CompoundDrought ./ 1000000;
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
    text(1951,540,strcat( '[' , num2str(mean(CD_piControl),3),'��' ,...
        num2str(mean(c95_CD_Historical) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , [0 0 0]./255);
end
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD
% piControl 50 year 
CD_piControl = Met_Drought_Population_Attribution_Year(5).Population_Year.CompoundDrought ./ 1000000;
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
    text(1975,540,strcat( '[' , num2str(mean(Change),3),'��' ,...
        num2str(c95_Change ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , [125 125 125]./255);
end

clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting ALL Ensemble Mean
CD_Historical = Met_Drought_Population_Attribution_Year(1).Population_Year.CompoundDrought ./ 1000000;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';

CD_ssp = Met_Drought_Population_Attribution_Year(2).Population_Year.CompoundDrought ./ 1000000;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';

plot([1850:2014],Ensemble_Mean_CD_Historical,'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',1);hold on;
plot([1850:2014],smooth(Ensemble_Mean_CD_Historical,10),'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',2.5);
plot([2014:2100],Ensemble_Mean_CD_ssp,'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',1);
plot([2014:2100],smooth(Ensemble_Mean_CD_ssp,10),'-',...
    'Color',RGB_ALL_Line/255,'Linewidth',2.5);

% Plot Statistical values
try
    % Mean over 1951-2000
    CD_Historical = Met_Drought_Population_Attribution_Year(1).Population_Year.CompoundDrought ./ 1000000;
    Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
    c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
    text(1951,620,strcat( '[' , num2str(mean(Ensemble_Mean_CD_Historical(102:151)),3),'��' ,...
        num2str(mean(c95_CD_Historical(102:151)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
try
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_Population_Attribution_Year(2).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
    c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
    text(2051,620,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
try
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_Population_Attribution_Year(1).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = Met_Drought_Population_Attribution_Year(2).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
    c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
    text(2001,620,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting NAT Ensemble Mean
CD_Historical = Met_Drought_Population_Attribution_Year(3).Population_Year.CompoundDrought ./ 1000000;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';

CD_ssp = Met_Drought_Population_Attribution_Year(4).Population_Year.CompoundDrought ./ 1000000;
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
    CD_Historical = Met_Drought_Population_Attribution_Year(3).Population_Year.CompoundDrought ./ 1000000;
    Ensemble_Mean_CD_Historical = nanmean(CD_Historical)'; % Selecting 5 ESMs
    c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
    text(1951,580,strcat( '[' , num2str(mean(Ensemble_Mean_CD_Historical(102:151)),3),'��' ,...
        num2str(mean(c95_CD_Historical(102:151)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
try
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_Population_Attribution_Year(4).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
    c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
    text(2051,580,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
try
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_Population_Attribution_Year(3).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = Met_Drought_Population_Attribution_Year(4).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
    c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
    text(2001,580,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting Fix Pop Ensemble Mean
CD_Historical = Met_Drought_Population_Attribution_Year(1).Population_Year.CompoundDrought ./ 1000000;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';

CD_ssp = Met_Drought_Population_Attribution_Year(6).Population_Year.CompoundDrought ./ 1000000;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';

plot([2014:2100],Ensemble_Mean_CD_ssp,'-',...
    'Color',RGB_POP_Line./255,'Linewidth',1);
plot([2014:2100],smooth(Ensemble_Mean_CD_ssp,10),'-',...
    'Color',RGB_POP_Line./255,'Linewidth',2.5);

% Plot Statistical values
try
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_Population_Attribution_Year(6).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
    c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
    text(2051,540,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_POP_Line./255);
end
try
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_Population_Attribution_Year(1).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = Met_Drought_Population_Attribution_Year(6).Population_Year.CompoundDrought ./ 1000000;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
    c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
    text(2001,540,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_POP_Line./255);
end

% Plot Time Window Line
plot([2000 2000],YlimRange_CD,'k--','LineWidth',2);
plot([2050 2050],YlimRange_CD,'k--','LineWidth',2);
% setting axis
ylabel('Million Persons');
set(gca,'xlim',XlimRange,'ylim',YlimRange_CD,'yTick',YTickRange_CD,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_ALL_Line./255,'Linewidth',3.5);hold on;
plot(0,'Color',RGB_NAT_Line./255,'Linewidth',3.5);
plot(0,'Color',RGB_POP_Line./255,'Linewidth',3.5);
plot(0,'k','Linewidth',3.5);
legend('HIST + SSP245','HIST-nat + SSP245-nat','SSP245 with fixed population','piControl',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')

clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fractional Population CompoundDrought (Met&Hyd&Agr Co-occurrence) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,[4,5])
%% Setting Color and axis property
RGB_ALL_Shade = [245,231,238]; RGB_ALL_Line = [159,73,116]; % ALL represents historical and ssp experiments
RGB_NAT_Shade = [232,231,243]; RGB_NAT_Line = [99,100,173]; % NAT represents hist-nat and ssp-nat experiments
RGB_POP_Shade = [243,250,239]; RGB_POP_Line = [60,124,98]; % POP represents results with fixed population

XlimRange = [1950,2100];
YlimRange_CD = [4,17]; YTickRange_CD = [4:4:17];
%% Plotting ALL Shade Area
% Historical CompoundDrought
CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(1).FractionalPopulation_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_ALL_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;

% Scenario CompoundDrought
CD_ssp = Met_Drought_FractionalPopulation_Attribution_Year(2).FractionalPopulation_Year.CompoundDrought;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';
c95_CD_ssp = (std(CD_ssp)./sqrt(size(CD_ssp,1))) .* 1.96; % 95% confidence interval
c95_CD_ssp = c95_CD_ssp';
h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
    [Ensemble_Mean_CD_ssp - c95_CD_ssp; flipud(Ensemble_Mean_CD_ssp + c95_CD_ssp)],...
    RGB_ALL_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD
%% Plotting NAT Shade Area
% Historical CompoundDrought
CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(3).FractionalPopulation_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
c95_CD_Historical = c95_CD_Historical';
h1 = fill([[1850:2014]';flipud([1850:2014]')],...
    [Ensemble_Mean_CD_Historical - c95_CD_Historical; flipud(Ensemble_Mean_CD_Historical + c95_CD_Historical)],...
    RGB_NAT_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;

% Scenario CompoundDrought
CD_ssp = Met_Drought_FractionalPopulation_Attribution_Year(4).FractionalPopulation_Year.CompoundDrought;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';
c95_CD_ssp = (std(CD_ssp)./sqrt(size(CD_ssp,1))) .* 1.96; % 95% confidence interval
c95_CD_ssp = c95_CD_ssp';
h_ssp = fill([[2014:2100]';flipud([2014:2100]')],...
    [Ensemble_Mean_CD_ssp - c95_CD_ssp; flipud(Ensemble_Mean_CD_ssp + c95_CD_ssp)],...
    RGB_NAT_Shade./255,'EdgeAlpha',0,'FaceAlpha',0.5); hold on;
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD
%% Plotting piControl Shade Area
% piControl 150 year 
CD_piControl = Met_Drought_FractionalPopulation_Attribution_Year(5).FractionalPopulation_Year.CompoundDrought;
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
    text(1951,14.5,strcat( '[' , num2str(mean(CD_piControl),3),'��' ,...
        num2str(mean(c95_CD_Historical) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , [0 0 0]./255);
end
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD
% piControl 50 year 
CD_piControl = Met_Drought_FractionalPopulation_Attribution_Year(5).FractionalPopulation_Year.CompoundDrought;
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
    text(1975,14.5,strcat( '[' , num2str(mean(Change),3),'��' ,...
        num2str(c95_Change ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , [125 125 125]./255);
end

clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting ALL Ensemble Mean
CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(1).FractionalPopulation_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';

CD_ssp = Met_Drought_FractionalPopulation_Attribution_Year(2).FractionalPopulation_Year.CompoundDrought;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';

plot([1850:2014],Ensemble_Mean_CD_Historical,'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',1);hold on;
plot([1850:2014],smooth(Ensemble_Mean_CD_Historical,10),'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',2.5);
plot([2014:2100],Ensemble_Mean_CD_ssp,'-',...
    'Color',RGB_ALL_Line./255,'Linewidth',1);
plot([2014:2100],smooth(Ensemble_Mean_CD_ssp,10),'-',...
    'Color',RGB_ALL_Line/255,'Linewidth',2.5);

% Plot Statistical values
try
    % Mean over 1951-2000
    CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(1).FractionalPopulation_Year.CompoundDrought;
    Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';
    c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
    text(1951,16.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_Historical(102:151)),3),'��' ,...
        num2str(mean(c95_CD_Historical(102:151)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
try
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_FractionalPopulation_Attribution_Year(2).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
    c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
    text(2051,16.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
try
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(1).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = Met_Drought_FractionalPopulation_Attribution_Year(2).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
    c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
    text(2001,16.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_ALL_Line./255);
end
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting NAT Ensemble Mean
CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(3).FractionalPopulation_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';

CD_ssp = Met_Drought_FractionalPopulation_Attribution_Year(4).FractionalPopulation_Year.CompoundDrought;
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
    CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(3).FractionalPopulation_Year.CompoundDrought;
    Ensemble_Mean_CD_Historical = nanmean(CD_Historical)'; % Selecting 5 ESMs
    c95_CD_Historical = (std(CD_Historical)./sqrt(size(CD_Historical,1))) .* 1.96; % 95% confidence interval
    text(1951,15.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_Historical(102:151)),3),'��' ,...
        num2str(mean(c95_CD_Historical(102:151)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
try
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_FractionalPopulation_Attribution_Year(4).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
    c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
    text(2051,15.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
try
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(3).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = Met_Drought_FractionalPopulation_Attribution_Year(4).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
    c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
    text(2001,15.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_NAT_Line./255);
end
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD

%% Plotting Fix Pop Ensemble Mean
CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(1).FractionalPopulation_Year.CompoundDrought;
Ensemble_Mean_CD_Historical = nanmean(CD_Historical)';

CD_ssp = Met_Drought_FractionalPopulation_Attribution_Year(6).FractionalPopulation_Year.CompoundDrought;
CD_ssp = CD_ssp - repmat((CD_ssp(:,1) - CD_Historical(:,end)),1,size(CD_ssp,2));
CD_ssp = [CD_Historical(:,end) , CD_ssp];
Ensemble_Mean_CD_ssp = nanmean(CD_ssp)';

plot([2014:2100],Ensemble_Mean_CD_ssp,'-',...
    'Color',RGB_POP_Line./255,'Linewidth',1);
plot([2014:2100],smooth(Ensemble_Mean_CD_ssp,10),'-',...
    'Color',RGB_POP_Line./255,'Linewidth',2.5);

% Plot Statistical values
try
    % ssp 245 Mean over 2051-2100
    CD_ssp245 = Met_Drought_FractionalPopulation_Attribution_Year(6).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    CD_ssp245 = [CD_Historical(:,end) , CD_ssp245];
    Ensemble_Mean_CD_ssp245 = nanmean(CD_ssp245)';
    c95_CD_ssp245 = (std(CD_ssp245)./sqrt(size(CD_ssp245,1))) .* 1.96; % 95% confidence interval
    text(2051,14.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(37:86)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(37:86)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_POP_Line./255);
end
try
    % ssp 245 Mean over 2001-2052
    CD_Historical = Met_Drought_FractionalPopulation_Attribution_Year(1).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = Met_Drought_FractionalPopulation_Attribution_Year(6).FractionalPopulation_Year.CompoundDrought;
    CD_ssp245 = CD_ssp245 - repmat((CD_ssp245(:,1) - CD_Historical(:,end)),1,size(CD_ssp245,2));
    Ensemble_Mean_CD_ssp245 = [nanmean(CD_Historical)';nanmean(CD_ssp245)'];
    c95_CD_ssp245 = (std([CD_Historical,CD_ssp245])./sqrt(size([CD_Historical,CD_ssp245],1))) .* 1.96; % 95% confidence interval
    text(2001,14.5,strcat( '[' , num2str(mean(Ensemble_Mean_CD_ssp245(152:201)),3),'��' ,...
        num2str(mean(c95_CD_ssp245(152:201)) ,3) , ']'),...
        'FontSize' , 24 , 'FontName' , 'Arial' , 'Color' , RGB_POP_Line./255);
end

% Plot Time Window Line
plot([2000 2000],YlimRange_CD,'k--','LineWidth',2);
plot([2050 2050],YlimRange_CD,'k--','LineWidth',2);
% setting axis
ylabel('Fraction (%)');
set(gca,'xlim',XlimRange,'ylim',YlimRange_CD,'yTick',YTickRange_CD,...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5,'XMinorTick','on','YMinorTick','on');
clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD


%% Plotting Legend
axes('position',get(gca,'position'),'visible','off')
plot(0,'Color',RGB_ALL_Line./255,'Linewidth',3.5);hold on;
plot(0,'Color',RGB_NAT_Line./255,'Linewidth',3.5);
plot(0,'Color',RGB_POP_Line./255,'Linewidth',3.5);
plot(0,'k','Linewidth',3.5);
legend('historical + ssp245','hist-nat + ssp245-nat','ssp245 with fixed population','piControl',...
    'Location','NorthWest','Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
set(gca,'visible','off')

clearvars -except Met_Drought_Population_Attribution_Year Met_Drought_FractionalPopulation_Attribution_Year RGB_ALL_Shade RGB_ALL_Line RGB_NAT_Shade RGB_NAT_Line RGB_POP_Shade RGB_POP_Line XlimRange YlimRange_CD YTickRange_CD

end
