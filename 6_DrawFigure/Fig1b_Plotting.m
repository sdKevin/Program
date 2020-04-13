function Fig1b_Plotting(GridAI_Princeton_ScenarioMIP , Path_Fig1b_Output)
%% (1) Adjust map range from 0~360 to -180~180
extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];
for ii = 1 : size(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC , 3)
    % ETrc_PM_RC
    A = GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % ETrc_PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % ETrc_PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.pr(: , : , ii) = [B;A];
end
for ii = 1 : size(GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC , 3)
    % ssp126
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(2).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp245
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(3).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp370
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(4).Ensemble_AI.pr(: , : , ii) = [B;A];
    % ssp585
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.ETrc_PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % pr
    A = GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.pr(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.pr(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(5).Ensemble_AI.pr(: , : , ii) = [B;A];
end
clear ii A B
%% (2) AI for Contemporary [Princeton 1948-2014]
% (2.1) PM_RC
ETrc_PM_RC_Princeton = mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC , 3);
AI_PM_RC_Princeton =  mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.pr , 3) ./ ...
    mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC , 3);
Humid = AI_PM_RC_Princeton >= 0.65;
Hyper_arid = AI_PM_RC_Princeton < 0.05;
Arid = AI_PM_RC_Princeton < 0.2 & AI_PM_RC_Princeton >= 0.05;
Semi_arid = AI_PM_RC_Princeton < 0.5 & AI_PM_RC_Princeton >= 0.2;
Dry_Sub_humid = AI_PM_RC_Princeton < 0.65 & AI_PM_RC_Princeton >= 0.5;
%Cold = [nanmean(ETrc_PM_RC_Princeton(:,1:250,:),3)<450,nanmean(ETrc_PM_RC_Princeton(:,251:end,:),3)<400];
Cold = nanmean(ETrc_PM_RC_Princeton,3)<400;
% Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
AI_PM_RC_Princeton(Humid) = 1;AI_PM_RC_Princeton(Hyper_arid) = 5;
AI_PM_RC_Princeton(Arid) = 4;AI_PM_RC_Princeton(Semi_arid) = 3;
AI_PM_RC_Princeton(Dry_Sub_humid) = 2;AI_PM_RC_Princeton(Cold) = 6;
AI_PM_RC_Princeton(isnan(AI_PM_RC_Princeton))=-9999;
SaveData2GeoTIFF([Path_Fig1b_Output 'AI_PM_RC_Princeton'],extent,AI_PM_RC_Princeton');
clear Humid Hyper_arid Arid Semi_arid Dry_Sub_humid Cold
clear ETrc_PM_RC_Princeton

% (2.2) PM_RC_CO2_Yang
ETrc_PM_RC_CO2_Yang_Princeton = mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang , 3);
AI_PM_RC_CO2_Yang_Princeton = mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.pr , 3) ./ ...
    mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Yang , 3);
Humid = AI_PM_RC_CO2_Yang_Princeton >= 0.65;
Hyper_arid = AI_PM_RC_CO2_Yang_Princeton < 0.05;
Arid = AI_PM_RC_CO2_Yang_Princeton < 0.2 & AI_PM_RC_CO2_Yang_Princeton >= 0.05;
Semi_arid = AI_PM_RC_CO2_Yang_Princeton < 0.5 & AI_PM_RC_CO2_Yang_Princeton >= 0.2;
Dry_Sub_humid = AI_PM_RC_CO2_Yang_Princeton < 0.65 & AI_PM_RC_CO2_Yang_Princeton >= 0.5;
%Cold = [nanmean(ETrc_PM_RC_CO2_Yang_Princeton(:,1:250,:),3)<450,nanmean(ETrc_PM_RC_CO2_Yang_Princeton(:,251:end,:),3)<400];
Cold = nanmean(ETrc_PM_RC_CO2_Yang_Princeton,3)<400;
% Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
AI_PM_RC_CO2_Yang_Princeton(Humid) = 1;AI_PM_RC_CO2_Yang_Princeton(Hyper_arid) = 5;
AI_PM_RC_CO2_Yang_Princeton(Arid) = 4;AI_PM_RC_CO2_Yang_Princeton(Semi_arid) = 3;
AI_PM_RC_CO2_Yang_Princeton(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Yang_Princeton(Cold) = 6;
AI_PM_RC_CO2_Yang_Princeton(isnan(AI_PM_RC_CO2_Yang_Princeton))=-9999;
SaveData2GeoTIFF([Path_Fig1b_Output 'AI_PM_RC_CO2_Yang_Princeton'],extent,AI_PM_RC_CO2_Yang_Princeton');
clear Humid Hyper_arid Arid Semi_arid Dry_Sub_humid Cold
clear ETrc_PM_RC_CO2_Yang_Princeton

% (2.3) PM_RC_CO2_Jarvis_H
ETrc_PM_RC_CO2_Jarvis_H_Princeton = mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H , 3);
AI_PM_RC_CO2_Jarvis_H_Princeton = mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.pr , 3) ./ ...
    mean(GridAI_Princeton_ScenarioMIP(1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H , 3);
Humid = AI_PM_RC_CO2_Jarvis_H_Princeton >= 0.65;
Hyper_arid = AI_PM_RC_CO2_Jarvis_H_Princeton < 0.05;
Arid = AI_PM_RC_CO2_Jarvis_H_Princeton < 0.2 & AI_PM_RC_CO2_Jarvis_H_Princeton >= 0.05;
Semi_arid = AI_PM_RC_CO2_Jarvis_H_Princeton < 0.5 & AI_PM_RC_CO2_Jarvis_H_Princeton >= 0.2;
Dry_Sub_humid = AI_PM_RC_CO2_Jarvis_H_Princeton < 0.65 & AI_PM_RC_CO2_Jarvis_H_Princeton >= 0.5;
%Cold = [nanmean(ETrc_PM_RC_CO2_Jarvis_H_Princeton(:,1:250,:),3)<450,nanmean(ETrc_PM_RC_CO2_Jarvis_H_Princeton(:,251:end,:),3)<400];
Cold = nanmean(ETrc_PM_RC_CO2_Jarvis_H_Princeton,3)<400;
% Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
AI_PM_RC_CO2_Jarvis_H_Princeton(Humid) = 1;AI_PM_RC_CO2_Jarvis_H_Princeton(Hyper_arid) = 5;
AI_PM_RC_CO2_Jarvis_H_Princeton(Arid) = 4;AI_PM_RC_CO2_Jarvis_H_Princeton(Semi_arid) = 3;
AI_PM_RC_CO2_Jarvis_H_Princeton(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Jarvis_H_Princeton(Cold) = 6;
AI_PM_RC_CO2_Jarvis_H_Princeton(isnan(AI_PM_RC_CO2_Jarvis_H_Princeton))=-9999;
SaveData2GeoTIFF([Path_Fig1b_Output 'AI_PM_RC_CO2_Jarvis_H_Princeton'],extent,AI_PM_RC_CO2_Jarvis_H_Princeton');
clear Humid Hyper_arid Arid Semi_arid Dry_Sub_humid Cold
clear ETrc_PM_RC_CO2_Jarvis_H_Princeton

%% (3) AI for Far Future [CMIP6 2070-2099]
ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    % (3.1) PM_RC
    pr_PM_RC_2070_2099 = mean(GridAI_Princeton_ScenarioMIP(i_ssp+1).Ensemble_AI.pr(:,:,end-30:end-1) , 3);
    ETrc_PM_RC_2070_2099 = mean(GridAI_Princeton_ScenarioMIP(i_ssp+1).Ensemble_AI.ETrc_PM_RC(:,:,end-30:end-1) , 3);
    AI_PM_RC_2070_2099 = pr_PM_RC_2070_2099 ./ ETrc_PM_RC_2070_2099;
    AI_PM_RC_2070_2099(360,:) = AI_PM_RC_2070_2099(359,:); % fill nan value
    Humid = AI_PM_RC_2070_2099 >= 0.65;
    Hyper_arid = AI_PM_RC_2070_2099 < 0.05;
    Arid = AI_PM_RC_2070_2099 < 0.2 & AI_PM_RC_2070_2099 >= 0.05;
    Semi_arid = AI_PM_RC_2070_2099 < 0.5 & AI_PM_RC_2070_2099 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_2070_2099 < 0.65 & AI_PM_RC_2070_2099 >= 0.5;
    %Cold = [nanmean(ETrc_PM_RC_2070_2099(:,1:250,:),3)<450,nanmean(ETrc_PM_RC_2070_2099(:,251:end,:),3)<400];
    Cold = nanmean(ETrc_PM_RC_2070_2099,3)<400;
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_2070_2099(Humid) = 1;AI_PM_RC_2070_2099(Hyper_arid) = 5;
    AI_PM_RC_2070_2099(Arid) = 4;AI_PM_RC_2070_2099(Semi_arid) = 3;
    AI_PM_RC_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_2070_2099(Cold) = 6;
    AI_PM_RC_2070_2099(isnan(AI_PM_RC_2070_2099))=-9999;
    SaveData2GeoTIFF([Path_Fig1b_Output 'AI_PM_RC_2070_2099_' ssp{i_ssp}],extent,AI_PM_RC_2070_2099');
    clear Humid Hyper_arid Arid Semi_arid Dry_Sub_humid Cold
    clear ETrc_PM_RC_2070_2099
    % (3.2) PM_RC_CO2_Yang
    ETrc_PM_RC_CO2_Yang_2070_2099 = mean(GridAI_Princeton_ScenarioMIP(i_ssp+1).Ensemble_AI.ETrc_PM_RC_CO2_Yang(:,:,end-30:end-1) , 3);
    AI_PM_RC_CO2_Yang_2070_2099 = pr_PM_RC_2070_2099 ./ ETrc_PM_RC_CO2_Yang_2070_2099;
    AI_PM_RC_CO2_Yang_2070_2099(360,:) = AI_PM_RC_CO2_Yang_2070_2099(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Yang_2070_2099 >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.05;
    Arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.2 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.5 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Yang_2070_2099 < 0.65 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.5;
    %Cold = [nanmean(ETrc_PM_RC_CO2_Yang_2070_2099(:,1:250,:),3)<450,nanmean(ETrc_PM_RC_CO2_Yang_2070_2099(:,251:end,:),3)<400];
    Cold = nanmean(ETrc_PM_RC_CO2_Yang_2070_2099,3)<400;
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Yang_2070_2099(Humid) = 1;AI_PM_RC_CO2_Yang_2070_2099(Hyper_arid) = 5;
    AI_PM_RC_CO2_Yang_2070_2099(Arid) = 4;AI_PM_RC_CO2_Yang_2070_2099(Semi_arid) = 3;
    AI_PM_RC_CO2_Yang_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Yang_2070_2099(Cold) = 6;
    AI_PM_RC_CO2_Yang_2070_2099(isnan(AI_PM_RC_CO2_Yang_2070_2099))=-9999;
    SaveData2GeoTIFF([Path_Fig1b_Output 'AI_PM_RC_CO2_Yang_2070_2099' ssp{i_ssp}],extent,AI_PM_RC_CO2_Yang_2070_2099');
    clear Humid Hyper_arid Arid Semi_arid Dry_Sub_humid Cold
    clear ETrc_PM_RC_CO2_Yang_2070_2099
    % (3.3) PM_RC_CO2_Jarvis_H
    ETrc_PM_RC_CO2_Jarvis_H_2070_2099 = mean(GridAI_Princeton_ScenarioMIP(i_ssp+1).Ensemble_AI.ETrc_PM_RC_CO2_Jarvis_H(:,:,end-30:end-1) , 3);
    AI_PM_RC_CO2_Jarvis_H_2070_2099 = pr_PM_RC_2070_2099 ./ ETrc_PM_RC_CO2_Jarvis_H_2070_2099;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(360,:) = AI_PM_RC_CO2_Jarvis_H_2070_2099(359,:); % fill nan value
    Humid = AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.65;
    Hyper_arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.05;
    Arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.2 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.05;
    Semi_arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.5 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.2;
    Dry_Sub_humid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.65 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.5;
    %Cold = [nanmean(ETrc_PM_RC_CO2_Jarvis_H_2070_2099(:,1:250,:),3)<450,nanmean(ETrc_PM_RC_CO2_Jarvis_H_2070_2099(:,251:end,:),3)<400];
    Cold = nanmean(ETrc_PM_RC_CO2_Jarvis_H_2070_2099,3)<400;
    % Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(Humid) = 1;AI_PM_RC_CO2_Jarvis_H_2070_2099(Hyper_arid) = 5;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(Arid) = 4;AI_PM_RC_CO2_Jarvis_H_2070_2099(Semi_arid) = 3;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Jarvis_H_2070_2099(Cold) = 6;
    AI_PM_RC_CO2_Jarvis_H_2070_2099(isnan(AI_PM_RC_CO2_Jarvis_H_2070_2099))=-9999;
    SaveData2GeoTIFF([Path_Fig1b_Output 'AI_PM_RC_CO2_Jarvis_H_2070_2099' ssp{i_ssp}],extent,AI_PM_RC_CO2_Jarvis_H_2070_2099');
    clear Humid Hyper_arid Arid Semi_arid Dry_Sub_humid Cold
    clear ETrc_PM_RC_CO2_Jarvis_H_2070_2099
    
    [Cold_Humid(i_ssp,:) , Cold_Dry(i_ssp,:)] = Fig1b_TransferMatrix(AI_PM_RC_Princeton , AI_PM_RC_CO2_Yang_Princeton ,...
        AI_PM_RC_CO2_Jarvis_H_Princeton , AI_PM_RC_2070_2099 ,...
        AI_PM_RC_CO2_Yang_2070_2099 , AI_PM_RC_CO2_Jarvis_H_2070_2099 ,...
        Path_Fig1b_Output , ssp{i_ssp})
end

%% Plotting As of 2070-2099, How much historical Permafrost will change to Humid & Dry lands
H_Bar = bar(Cold_Humid,'stacked','BarWidth',0.7);
H_Bar(1).FaceColor = [115,115,0]./255; H_Bar(1).EdgeColor = 'none';
H_Bar(2).FaceColor = [168,168,0]./255; H_Bar(2).EdgeColor = 'none';
H_Bar(3).FaceColor = [145,165,55]./255; H_Bar(3).EdgeColor = 'none';
H_Bar(4).FaceColor = [170,207,101]./255; H_Bar(4).EdgeColor = 'none';
set(gca,'View',[90,90],'xTickLabel',['ssp126';'ssp245';'ssp370';'ssp585'],...
    'ylim',[0,35],'yTick',[0:5:35],...
    'FontSize',24,'FontName','Arial','LineWidth',2.5,'TickDir','out')
ylabel('Permafrost to Humid Lands (%)','Color',[28,167,74]./255)

disp('Adjust Figure Location and Press Enter to Continue')
pause()

axes('position', get(gca,'Position'));
bar(flipud(Cold_Dry) , 'FaceColor' , [253,193,82]./255 ,...
    'EdgeColor' , 'none','BarWidth',0.7)
set(gca,'View',[-90,90],'xTickLabel','',...
    'ylim',[0,35],'yTick',[0:5:35],'FontSize',24,'FontName','Arial',...
    'LineWidth',2.5,'TickDir','out','yaxislocation','right')
ylabel('Permafrost to Drylands (%)','Color',[252,184,73]./255)
set(gca,'color','none');
end
