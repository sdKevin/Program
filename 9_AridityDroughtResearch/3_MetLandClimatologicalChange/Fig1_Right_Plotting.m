function Fig1_Right_Plotting(Met_Year , Land_Year)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(1,6,[1:3])
%% Setting Color and axis property
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Pr = [-20,120];

%% Plotting Pr Under ssp126 , 245 & 585
for i_ssp = [5 , 3 , 2]
    % pr kg/(m2s) to mm/year
    Pr_Historical = Met_Year(1).Met_Year.pr .* 1000.*31536000./997;
    Pr_ssp(:,:,i_ssp-1) = Met_Year(i_ssp).Met_Year.pr .* 1000.*31536000./997;
    Pr_ssp(:,:,i_ssp-1) = Pr_ssp(:,:,i_ssp-1) - repmat(mean(Pr_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
end

H = notBoxPlot([mean(Pr_ssp(:,end-30:end-1,1)')',mean(Pr_ssp(:,end-30:end-1,2)')',...
    mean(Pr_ssp(:,end-30:end-1,4)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(1,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_ssp_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(2,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(2,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(4,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(4,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Pr,'FontSize',24,'FontName','Arial','LineWidth',2.5);
ylabel('Pr Anomaly (mm year^-^1)');
%% Plotting Pr Under ssp370
subplot(1,6,[4:6])
for i_ssp = 4
    % pr kg/(m2s) to mm/year
    Pr_Historical = Met_Year(1).Met_Year.pr .* 1000.*31536000./997;
    Pr_Historical(16,:) = []; % HadGEM3-GC31-LL
    Pr_ssp370 = Met_Year(i_ssp).Met_Year.pr .* 1000.*31536000./997;
    Pr_ssp370 = Pr_ssp370 - repmat(mean(Pr_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
end

H = notBoxPlot([mean(Pr_ssp370(:,end-30:end-1)')',mean(Pr_ssp370(:,end-30:end-1)')',...
    mean(Pr_ssp370(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp370','','']);
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

set(gca,'ylim',YlimRange_Pr,'FontSize',24,'FontName','Arial','LineWidth',2.5);
clearvars -except Met_Year Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pr-ET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
for ii = 1 : length(Met_Year)
    Met_Year(ii).Met_Year.pr(12:14,:) = [];
end
subplot(1,6,[1:3])
%% Setting Color and axis property
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Pr_ET = [-10,80];

%% Plotting Pr_ET Under ssp126 , 245 & 585
for i_ssp = [5 , 3 , 2]
    % pr-ET kg/(m2s) to mm/year
    Pr_ET_Historical = (Met_Year(1).Met_Year.pr - Land_Year(1).Land_Year.evspsbl) .* 1000.*31536000./997;
    Pr_ET_ssp(:,:,i_ssp-1) = (Met_Year(i_ssp).Met_Year.pr -  Land_Year(i_ssp).Land_Year.evspsbl) .* 1000.*31536000./997;
    Pr_ET_ssp(:,:,i_ssp-1) = Pr_ET_ssp(:,:,i_ssp-1) - repmat(mean(Pr_ET_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
end

H = notBoxPlot([mean(Pr_ET_ssp(:,end-30:end-1,1)')',mean(Pr_ET_ssp(:,end-30:end-1,2)')',...
    mean(Pr_ET_ssp(:,end-30:end-1,4)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(1,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_ssp_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(2,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(2,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(4,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(4,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Pr_ET,'FontSize',24,'FontName','Arial','LineWidth',2.5);
ylabel('Pr-ET Anomaly (mm year^-^1)');
%% Plotting Pr_ET Under ssp370
subplot(1,6,[4:6])
for i_ssp = 4
    % pr-ET kg/(m2s) to mm/year
    Pr_ET_Historical = (Met_Year(1).Met_Year.pr - Land_Year(1).Land_Year.evspsbl) .* 1000.*31536000./997;
    Pr_ET_Historical(13,:) = []; % HadGEM3-GC31-LL
    Pr_ET_ssp370 = (Met_Year(i_ssp).Met_Year.pr -  Land_Year(i_ssp).Land_Year.evspsbl) .* 1000.*31536000./997;
    Pr_ET_ssp370 = Pr_ET_ssp370 - repmat(mean(Pr_ET_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
end

H = notBoxPlot([mean(Pr_ET_ssp370(:,end-30:end-1)')',mean(Pr_ET_ssp370(:,end-30:end-1)')',...
    mean(Pr_ET_ssp370(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp370','','']);
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

set(gca,'ylim',YlimRange_Pr_ET,'FontSize',24,'FontName','Arial','LineWidth',2.5);
clearvars -except Met_Year Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(1,6,[1:3])
%% Setting Color and axis property
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_Q = [-20,140];
%% Plotting Q Under ssp126 , 245 & 585
for i_ssp = [5 , 3 , 2]
    % Q kg/(m2s) to mm/year
    Q_Historical = Land_Year(1).Land_Year.mrro .* 1000.*31536000./997;
    Q_ssp(:,:,i_ssp-1) = Land_Year(i_ssp).Land_Year.mrro .* 1000.*31536000./997;
    Q_ssp(:,:,i_ssp-1) = Q_ssp(:,:,i_ssp-1) - repmat(mean(Q_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
end

H = notBoxPlot([mean(Q_ssp(:,end-30:end-1,1)')',mean(Q_ssp(:,end-30:end-1,2)')',...
    mean(Q_ssp(:,end-30:end-1,4)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(1,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_ssp_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(2,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(2,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(4,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(4,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_Q,'FontSize',24,'FontName','Arial','LineWidth',2.5);
ylabel('Q Anomaly (mm year^-^1)');
%% Plotting Q Under ssp370
subplot(1,6,[4:6])
for i_ssp = 4
    % Q kg/(m2s) to mm/year
    Q_Historical = Land_Year(1).Land_Year.mrro .* 1000.*31536000./997;
    Q_Historical(13,:) = []; % HadGEM3-GC31-LL
    Q_ssp370 = Land_Year(i_ssp).Land_Year.mrro .* 1000.*31536000./997;
    Q_ssp370 = Q_ssp370 - repmat(mean(Q_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
end

H = notBoxPlot([mean(Q_ssp370(:,end-30:end-1)')',mean(Q_ssp370(:,end-30:end-1)')',...
    mean(Q_ssp370(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp370','','']);
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

set(gca,'ylim',YlimRange_Q,'FontSize',24,'FontName','Arial','LineWidth',2.5);
clearvars -except Met_Year Land_Year

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(1,6,[1:3])
%% Setting Color and axis property
RGB_ssp_Shade = [222,235,247; 198,234,251; 161,196,218; 194,196,226];
RGB_ssp_Line = [133,184,227; 0,173,238; 50,128,185; 57,83,164];
YlimRange_SM = [-40,20];
%% Plotting SM Under ssp126 , 245 & 585
for i_ssp = [5 , 3 , 2]
    % SM kg/(m2) to mm/year
    SM_Historical = Land_Year(1).Land_Year.mrso .* 1000./997;
    SM_ssp(:,:,i_ssp-1) = Land_Year(i_ssp).Land_Year.mrso .* 1000./997;
    SM_ssp(:,:,i_ssp-1) = SM_ssp(:,:,i_ssp-1) - repmat(mean(SM_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
end

H = notBoxPlot([mean(SM_ssp(:,end-30:end-1,1)')',mean(SM_ssp(:,end-30:end-1,2)')',...
    mean(SM_ssp(:,end-30:end-1,4)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp126';'ssp245';'ssp585']);
set([H.data],'MarkerSize',6,'markerFaceColor','none','markerEdgeColor', 'none');

set([H(1).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(1).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(1,:)./255),'EraseMode','xor');
set([H(1).semPtch],'FaceColor',RGB_ssp_Shade(1,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(2).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(2).mu],'LineStyle',':','Color',1.0-1*(1.0-RGB_ssp_Line(2,:)./255),'EraseMode','xor');
set([H(2).semPtch],'FaceColor',RGB_ssp_Shade(2,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set([H(3).sdPtch],'EdgeColor','none','FaceAlpha',0); %delete 1std
set([H(3).mu],'Color',1.0-1*(1.0-RGB_ssp_Line(4,:)./255),'EraseMode','xor');
set([H(3).semPtch],'FaceColor',RGB_ssp_Shade(4,:)./255,'FaceAlpha',0.9,'EdgeColor','none');

set(gca,'ylim',YlimRange_SM,'FontSize',24,'FontName','Arial','LineWidth',2.5);
ylabel('Soil Moisture Anomaly (mm)');
%% Plotting SM Under ssp370
subplot(1,6,[4:6])
for i_ssp = 4
    % SM kg/(m2) to mm/year
    SM_Historical = Land_Year(1).Land_Year.mrso .* 1000./997;
    SM_Historical(13,:) = []; % HadGEM3-GC31-LL
    SM_ssp370 = Land_Year(i_ssp).Land_Year.mrso .* 1000./997;
    SM_ssp370 = SM_ssp370 - repmat(mean(SM_Historical(:,99:165),2), 1 ,86); % Change to Anomaly
end

H = notBoxPlot([mean(SM_ssp370(:,end-30:end-1)')',mean(SM_ssp370(:,end-30:end-1)')',...
    mean(SM_ssp370(:,end-30:end-1)')'],'jitter',0.3);
set(gca,'color',[ 255 255 255]./255,'Box','On','xTickLabel',['ssp370','','']);
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

set(gca,'ylim',YlimRange_SM,'FontSize',24,'FontName','Arial','LineWidth',2.5);
clearvars -except Met_Year Land_Year


end