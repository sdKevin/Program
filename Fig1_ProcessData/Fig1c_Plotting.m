function Fig1c_Plotting( ETrc_Year , pr , PM_RC_2070_2099 , PM_RC_CO2_Yang_2070_2099 , PM_RC_CO2_Jarvis_H_2070_2099)
%% Three Windows
fill([1850;1879;1879;1850],[850.5;850.5;1199.5;1199.5],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.7);hold on;
fill([1990;2019;2019;1990],[850.5;850.5;1199.5;1199.5],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.7);
fill([2070;2099;2099;2070],[850.5;850.5;1199.5;1199.5],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.7);
%% ETrc %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Yearly Series: Global average Reference Crop Evapotranspiration
% PM_RC_CO2_Jarvis_H
Ensemble_Mean_PM_RC_CO2_Jarvis_H = nanmean(ETrc_Year.PM_RC_CO2_Jarvis_H)';
STD_PM_RC_CO2_Jarvis_H = std(ETrc_Year.PM_RC_CO2_Jarvis_H)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_PM_RC_CO2_Jarvis_H - STD_PM_RC_CO2_Jarvis_H; flipud(Ensemble_Mean_PM_RC_CO2_Jarvis_H + STD_PM_RC_CO2_Jarvis_H)],...
    [194,196,226]./255,'EdgeAlpha',0,'FaceAlpha',0.85);hold on;
plot([1850:2100],Ensemble_Mean_PM_RC_CO2_Jarvis_H,...
    'Color',1.0-1*(1.0-[57,83,164]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
% PM_RC_CO2_Yang
Ensemble_Mean_PM_RC_CO2_Yang = nanmean(ETrc_Year.PM_RC_CO2_Yang)';
STD_PM_RC_CO2_Yang = std(ETrc_Year.PM_RC_CO2_Yang)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_PM_RC_CO2_Yang - STD_PM_RC_CO2_Yang; flipud(Ensemble_Mean_PM_RC_CO2_Yang + STD_PM_RC_CO2_Yang)],...
    [251,188,141]./255,'EdgeAlpha',0,'FaceAlpha',0.65);hold on;
plot([1850:2100],Ensemble_Mean_PM_RC_CO2_Yang,...
    'Color',1.0-1*(1.0-[245,129,51]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
% PM_RC
Ensemble_Mean_PM_RC = nanmean(ETrc_Year.PM_RC)';
STD_PM_RC = std(ETrc_Year.PM_RC)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_PM_RC - STD_PM_RC; flipud(Ensemble_Mean_PM_RC + STD_PM_RC)],...
    [252,202,184]./255,'EdgeAlpha',0,'FaceAlpha',0.5);hold on;
plot([1850:2100],Ensemble_Mean_PM_RC,...
    'Color',1.0-1*(1.0-[238,32,37]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
ylabel('Reference Crop Evapotranspiration (mm year^-^1)');
set(gca,'xlim',[1850,2100],'ylim',[850,1200],'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
%% Mean ETrc Over 2070:2099: index is 221 to 250
figure
H = notBoxPlot([mean(ETrc_Year.PM_RC(:,221:250)')',mean(ETrc_Year.PM_RC_CO2_Yang(:,221:250)')',mean(ETrc_Year.PM_RC_CO2_Jarvis_H(:,221:250)')'],[]);
set(gca,'color',[ 255 255 255]./255,'Box','On')
set([H.data],'MarkerSize',6,...
    'markerFaceColor',[77,77,77]./255,...
    'markerEdgeColor', 'none')
% PM_RC
set([H(1).sdPtch],'FaceColor',[252,202,184]./255,'EdgeColor','none')
set([H(1).mu],'Color',[238,32,37]./255)
set([H(1).semPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
% PM_RC_Yang
set([H(2).sdPtch],'FaceColor',[251,188,141]./255,'EdgeColor','none')
set([H(2).mu],'Color',[245,129,51]./255)
set([H(2).semPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval
% PM_RC_CO2_Jarvis_H
set([H(3).sdPtch],'FaceColor',[194,196,226]./255,'EdgeColor','none')
set([H(3).mu],'Color',[57,83,164]./255)
set([H(3).semPtch],'EdgeColor','none','FaceAlpha',0)%delete 95% confidence interval

set(gca,'ylim',[850,1200],'XTick',[1;2;3],'XTickLabel',{'PM-RC           ';'PM-RC-Yang';'                PM-RC-Jarvis'},...
    'FontSize',24,'FontName','Arial','LineWidth',2.5)

%% Yearly Grid: Relative Change of ETrc
Re_Change_PM_RC_CO2_Jarvis_H_2070_2099 = (nanmean(PM_RC_CO2_Jarvis_H_2070_2099,3) - nanmean(PM_RC_2070_2099,3))./nanmean(PM_RC_2070_2099,3).*100;
extent=[-359.75,0.25,-59.75+0.195,89.75+0.195];
Re_Change_PM_RC_CO2_Jarvis_H_2070_2099(isnan(Re_Change_PM_RC_CO2_Jarvis_H_2070_2099))=-9999;
SaveData2GeoTIFF('Re_Change_PM_RC_CO2_Jarvis_H_2070_2099',extent,Re_Change_PM_RC_CO2_Jarvis_H_2070_2099');

Re_Change_PM_RC_CO2_Yang_2070_2099 = (nanmean(PM_RC_CO2_Yang_2070_2099,3) - nanmean(PM_RC_2070_2099,3))./nanmean(PM_RC_2070_2099,3).*100;
extent=[-359.75,0.25,-59.75+0.195,89.75+0.195];
Re_Change_PM_RC_CO2_Yang_2070_2099(isnan(Re_Change_PM_RC_CO2_Yang_2070_2099))=-9999;
SaveData2GeoTIFF('Re_Change_PM_RC_CO2_Yang_2070_2099',extent,Re_Change_PM_RC_CO2_Yang_2070_2099');
% h=imagesc(Re_Change_PM_RC_CO2_Jarvis_H_2070_2099);
% set(h,'alphadata',~isnan(Re_Change_PM_RC_CO2_Jarvis_H_2070_2099(:,:,1)))
% view(-90,90)
%% AI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Yearly Series: Global average Aridity Index
figure
% AI in PM_RC
AI_PM_RC = pr./ETrc_Year.PM_RC;
Ensemble_Mean_AI_PM_RC = nanmean(AI_PM_RC)';
STD_AI_PM_RC = std(AI_PM_RC)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC - STD_AI_PM_RC; flipud(Ensemble_Mean_AI_PM_RC + STD_AI_PM_RC)],...
    [252,202,184]./255,'EdgeAlpha',0,'FaceAlpha',0.65);hold on;
plot([1850:2100],Ensemble_Mean_AI_PM_RC,...
    'Color',1.0-1*(1.0-[238,32,37]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
% AI in PM_RC_CO2_Yang
AI_PM_RC_CO2_Yang = pr./ETrc_Year.PM_RC_CO2_Yang;
Ensemble_Mean_AI_PM_RC_CO2_Yang = nanmean(AI_PM_RC_CO2_Yang)';
STD_AI_PM_RC_CO2_Yang = std(AI_PM_RC_CO2_Yang)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC_CO2_Yang - STD_AI_PM_RC_CO2_Yang; flipud(Ensemble_Mean_AI_PM_RC_CO2_Yang + STD_AI_PM_RC_CO2_Yang)],...
    [251,188,141]./255,'EdgeAlpha',0,'FaceAlpha',0.55);hold on;
plot([1850:2100],Ensemble_Mean_AI_PM_RC_CO2_Yang,...
    'Color',1.0-1*(1.0-[245,129,51]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
% AI in PM_RC_CO2_Jarvis_H
AI_PM_RC_CO2_Jarvis_H = pr./ETrc_Year.PM_RC_CO2_Jarvis_H;
Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H = nanmean(AI_PM_RC_CO2_Jarvis_H)';
STD_AI_PM_RC_CO2_Jarvis_H = std(AI_PM_RC_CO2_Jarvis_H)';
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H - STD_AI_PM_RC_CO2_Jarvis_H; flipud(Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H + STD_AI_PM_RC_CO2_Jarvis_H)],...
    [194,196,226]./255,'EdgeAlpha',0,'FaceAlpha',0.45);hold on;
plot([1850:2100],Ensemble_Mean_AI_PM_RC_CO2_Jarvis_H,...
    'Color',1.0-1*(1.0-[57,83,164]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
ylabel('AI (mm mm^-^1)');
set(gca,'xlim',[1850,2100],'ylim',[0.65,0.88],'YTick',[0.65:0.04:0.88],...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
end

