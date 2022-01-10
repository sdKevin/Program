function Fig2_Right_Plotting(Met_Land_Year)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(1,8,[1:4])
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Pr = [0.9,1.2];

%% Plotting Pr Under historical, ssp126 , 245 & 585
for i_ssp = [5 , 3 , 2]
    Pr_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Pr;
    Pr_ssp(:,:,i_ssp-1) = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Pr;
end

H = notBoxPlot([mean(Pr_Historical(:,99:end,1)')',...
    mean(Pr_ssp(:,end-30:end-1,1)')',mean(Pr_ssp(:,end-30:end-1,2)')',...
    mean(Pr_ssp(:,end-30:end-1,4)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Historical_Line(1,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_Historical_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(1,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(2,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(2,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(4).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(4,:)./255),'EraseMode','xor');
set([H(4).semPtch],'FaceColor',RGB_ssp_Shade(4,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Pr,'FontSize',24,'FontName','Arial','LineWidth',2.5);
ylabel('Month under drought');
title('Pr<10th Percentile')
%% Plotting Pr Under ssp370
subplot(1,8,[5:8])
for i_ssp = 4
    Pr_ssp370 = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Pr;
end

H = notBoxPlot([mean(Pr_ssp370(:,end-30:end-1)')',mean(Pr_ssp370(:,end-30:end-1)')',...
    mean(Pr_ssp370(:,end-30:end-1)')',mean(Pr_ssp370(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp370','','','']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(4).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(4).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Pr,'FontSize',24,'FontName','Arial','LineWidth',2.5);
clearvars -except Met_Land_Year


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr_ET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(1,8,[1:4])
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Pr_ET = [0.9,1.4];

%% Plotting Pr_ET Under historical, ssp126 , 245 & 585
for i_ssp = [5 , 3 , 2]
    Pr_ET_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Pr_ET;
    Pr_ET_ssp(:,:,i_ssp-1) = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Pr_ET;
end

H = notBoxPlot([mean(Pr_ET_Historical(:,99:end,1)')',...
    mean(Pr_ET_ssp(:,end-30:end-1,1)')',mean(Pr_ET_ssp(:,end-30:end-1,2)')',...
    mean(Pr_ET_ssp(:,end-30:end-1,4)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Historical_Line(1,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_Historical_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(1,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(2,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(2,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(4).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(4,:)./255),'EraseMode','xor');
set([H(4).semPtch],'FaceColor',RGB_ssp_Shade(4,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Pr_ET,'FontSize',24,'FontName','Arial','LineWidth',2.5);
ylabel('Month under drought');
title('Pr-ET<10th Percentile')
%% Plotting Pr_ET Under ssp370
subplot(1,8,[5:8])
for i_ssp = 4
    Pr_ET_ssp370 = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Pr_ET;
end

H = notBoxPlot([mean(Pr_ET_ssp370(:,end-30:end-1)')',mean(Pr_ET_ssp370(:,end-30:end-1)')',...
    mean(Pr_ET_ssp370(:,end-30:end-1)')',mean(Pr_ET_ssp370(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp370','','','']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(4).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(4).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Pr_ET,'FontSize',24,'FontName','Arial','LineWidth',2.5);
clearvars -except Met_Land_Year


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(1,8,[1:4])
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Q = [0.6,1.1]; 

%% Plotting Q Under historical, ssp126 , 245 & 585
for i_ssp = [5 , 3 , 2]
    Q_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.Q;
    Q_ssp(:,:,i_ssp-1) = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Q;
end

H = notBoxPlot([mean(Q_Historical(:,99:end,1)')',...
    mean(Q_ssp(:,end-30:end-1,1)')',mean(Q_ssp(:,end-30:end-1,2)')',...
    mean(Q_ssp(:,end-30:end-1,4)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Historical_Line(1,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_Historical_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(1,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(2,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(2,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(4).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(4,:)./255),'EraseMode','xor');
set([H(4).semPtch],'FaceColor',RGB_ssp_Shade(4,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Q,'FontSize',24,'FontName','Arial','LineWidth',2.5);
ylabel('Month under drought');
title('Q<10th Percentile')
%% Plotting Q Under ssp370
subplot(1,8,[5:8])
for i_ssp = 4
    Q_ssp370 = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.Q;
end

H = notBoxPlot([mean(Q_ssp370(:,end-30:end-1)')',mean(Q_ssp370(:,end-30:end-1)')',...
    mean(Q_ssp370(:,end-30:end-1)')',mean(Q_ssp370(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp370','','','']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(4).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(4).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Q,'FontSize',24,'FontName','Arial','LineWidth',2.5);
clearvars -except Met_Land_Year


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(1,8,[1:4])
%% Setting Color and axis property
RGB_Historical_Shade = [205,205,205]; RGB_Historical_Line = [23,23,23];
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_SM = [0.7,3.1];

%% Plotting SM Under historical, ssp126 , 245 & 585
for i_ssp = [5 , 3 , 2]
    SM_Historical = Met_Land_Year(1).DroughtFrequency_GMYear.SM;
    SM_ssp(:,:,i_ssp-1) = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.SM;
end

H = notBoxPlot([mean(SM_Historical(:,99:end,1)')',...
    mean(SM_ssp(:,end-30:end-1,1)')',mean(SM_ssp(:,end-30:end-1,2)')',...
    mean(SM_ssp(:,end-30:end-1,4)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_Historical_Line(1,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_Historical_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(1,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(2,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(2,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(4).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(4,:)./255),'EraseMode','xor');
set([H(4).semPtch],'FaceColor',RGB_ssp_Shade(4,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_SM,'FontSize',24,'FontName','Arial','LineWidth',2.5);
ylabel('Month under drought');
title('SoilMoisture<10th Percentile')
%% Plotting SM Under ssp370
subplot(1,8,[5:8])
for i_ssp = 4
    SM_ssp370 = Met_Land_Year(i_ssp).DroughtFrequency_GMYear.SM;
end

H = notBoxPlot([mean(SM_ssp370(:,end-30:end-1)')',mean(SM_ssp370(:,end-30:end-1)')',...
    mean(SM_ssp370(:,end-30:end-1)')',mean(SM_ssp370(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp370','','','']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(4).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(4).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(3,:)./255),'EraseMode','xor');
set([H(4).semPtch],'FaceColor',RGB_ssp_Shade(3,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_SM,'FontSize',24,'FontName','Arial','LineWidth',2.5);
clearvars -except Met_Land_Year

end