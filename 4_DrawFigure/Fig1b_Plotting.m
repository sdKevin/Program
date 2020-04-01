function Fig1b_Plotting(GridAI_Princeton_ScenarioMIP , Path_Fig1b_Output)
%% Adjust map range from 0~360 to -180~180
for ii = 1 : size(GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC , 3)
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(1).Grid_AI.PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
for ii = 1 : size(GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC , 3)
    % ssp126
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(2).Grid_AI.PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp245
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(3).Grid_AI.PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp370
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(4).Grid_AI.PM_RC_CO2_Yang(: , : , ii) = [B;A];
    % ssp585
    % PM_RC
    A = GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC(: , : , ii) = [B;A];
    % PM_RC_CO2_Jarvis_H
    A = GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC_CO2_Jarvis_H(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC_CO2_Jarvis_H(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC_CO2_Jarvis_H(: , : , ii) = [B;A];
    % PM_RC_CO2_Yang
    A = GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC_CO2_Yang(1:360 , : , ii);
    B = GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC_CO2_Yang(361:end , : , ii);
    GridAI_Princeton_ScenarioMIP(5).Grid_AI.PM_RC_CO2_Yang(: , : , ii) = [B;A];
end
clear ii A B
%% AI for 2070_2099
% PM_RC
AI_PM_RC_2070_2099 = (nanmean(pr_2070_2099,3).*1000.*31536000./997)...
    ./nanmean(PM_RC_2070_2099,3);
AI_PM_RC_2070_2099(360,:) = AI_PM_RC_2070_2099(359,:); % fill nan value
Humid = AI_PM_RC_2070_2099 >= 0.65;
Hyper_arid = AI_PM_RC_2070_2099 < 0.05;
Arid = AI_PM_RC_2070_2099 < 0.2 & AI_PM_RC_2070_2099 >= 0.05;
Semi_arid = AI_PM_RC_2070_2099 < 0.5 & AI_PM_RC_2070_2099 >= 0.2;
Dry_Sub_humid = AI_PM_RC_2070_2099 < 0.65 & AI_PM_RC_2070_2099 >= 0.5;
Cold = [nanmean(PM_RC_2070_2099(:,1:250,:),3)<450,nanmean(PM_RC_2070_2099(:,251:end,:),3)<400];
% Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
AI_PM_RC_2070_2099(Humid) = 1;AI_PM_RC_2070_2099(Hyper_arid) = 5;
AI_PM_RC_2070_2099(Arid) = 4;AI_PM_RC_2070_2099(Semi_arid) = 3;
AI_PM_RC_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_2070_2099(Cold) = 6;
AI_PM_RC_2070_2099(isnan(AI_PM_RC_2070_2099))=-9999;
SaveData2GeoTIFF('AI_PM_RC_2070_2099',extent,AI_PM_RC_2070_2099');
% (2.2.2) PM_RC_CO2_Yang
AI_PM_RC_CO2_Yang_2070_2099 = (nanmean(pr_2070_2099,3).*1000.*31536000./997)...
    ./nanmean(PM_RC_CO2_Yang_2070_2099,3);
AI_PM_RC_CO2_Yang_2070_2099(360,:) = AI_PM_RC_CO2_Yang_2070_2099(359,:); % fill nan value
Humid = AI_PM_RC_CO2_Yang_2070_2099 >= 0.65;
Hyper_arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.05;
Arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.2 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.05;
Semi_arid = AI_PM_RC_CO2_Yang_2070_2099 < 0.5 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.2;
Dry_Sub_humid = AI_PM_RC_CO2_Yang_2070_2099 < 0.65 & AI_PM_RC_CO2_Yang_2070_2099 >= 0.5;
Cold = [nanmean(PM_RC_CO2_Yang_2070_2099(:,1:250,:),3)<450,nanmean(PM_RC_CO2_Yang_2070_2099(:,251:end,:),3)<400];
% Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
AI_PM_RC_CO2_Yang_2070_2099(Humid) = 1;AI_PM_RC_CO2_Yang_2070_2099(Hyper_arid) = 5;
AI_PM_RC_CO2_Yang_2070_2099(Arid) = 4;AI_PM_RC_CO2_Yang_2070_2099(Semi_arid) = 3;
AI_PM_RC_CO2_Yang_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Yang_2070_2099(Cold) = 6;
AI_PM_RC_CO2_Yang_2070_2099(isnan(AI_PM_RC_CO2_Yang_2070_2099))=-9999;
SaveData2GeoTIFF('AI_PM_RC_CO2_Yang_2070_2099',extent,AI_PM_RC_CO2_Yang_2070_2099');
% PM_RC_CO2_Jarvis_H
AI_PM_RC_CO2_Jarvis_H_2070_2099 = (nanmean(pr_2070_2099,3).*1000.*31536000./997)...
    ./nanmean(PM_RC_CO2_Jarvis_H_2070_2099,3);
AI_PM_RC_CO2_Jarvis_H_2070_2099(360,:) = AI_PM_RC_CO2_Jarvis_H_2070_2099(359,:); % fill nan value
Humid = AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.65;
Hyper_arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.05;
Arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.2 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.05;
Semi_arid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.5 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.2;
Dry_Sub_humid = AI_PM_RC_CO2_Jarvis_H_2070_2099 < 0.65 & AI_PM_RC_CO2_Jarvis_H_2070_2099 >= 0.5;
Cold = [nanmean(PM_RC_CO2_Jarvis_H_2070_2099(:,1:250,:),3)<400,nanmean(PM_RC_CO2_Jarvis_H_2070_2099(:,251:end,:),3)<400];
% Humid 1; Hyper_arid 5; Arid 4; Semi_arid 3; Dry_Sub_humid 2; Cold 6;
AI_PM_RC_CO2_Jarvis_H_2070_2099(Humid) = 1;AI_PM_RC_CO2_Jarvis_H_2070_2099(Hyper_arid) = 5;
AI_PM_RC_CO2_Jarvis_H_2070_2099(Arid) = 4;AI_PM_RC_CO2_Jarvis_H_2070_2099(Semi_arid) = 3;
AI_PM_RC_CO2_Jarvis_H_2070_2099(Dry_Sub_humid) = 2;AI_PM_RC_CO2_Jarvis_H_2070_2099(Cold) = 6;
AI_PM_RC_CO2_Jarvis_H_2070_2099(isnan(AI_PM_RC_CO2_Jarvis_H_2070_2099))=-9999;
SaveData2GeoTIFF('AI_PM_RC_CO2_Jarvis_H_2070_2099',extent,AI_PM_RC_CO2_Jarvis_H_2070_2099');

end

