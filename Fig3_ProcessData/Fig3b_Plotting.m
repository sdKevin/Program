function Fig3b_Plotting( ETrc_Year , Met_Year , Middle_Var_Year)
for iii = 1 : size(ETrc_Year.PM_RC,1)
    %% Calculate Delta AI
    pr = Met_Year.pr.*1000.*31536000./997; %to mm/year
    AI_PM_RC = pr./ETrc_Year.PM_RC;
    AI_PM_RC_CO2_Jarvis_H = pr./ETrc_Year.PM_RC_CO2_Jarvis_H;
    AI_PM_RC_CO2_Yang = pr./ETrc_Year.PM_RC_CO2_Yang;
    
    delta_AI_PM_RC(iii) = nanmean(nanmean(AI_PM_RC(iii,221:250))) - nanmean(nanmean(AI_PM_RC(iii,141:170)));
    delta_AI_PM_RC_CO2_Yang(iii) = nanmean(nanmean(AI_PM_RC_CO2_Yang(iii,221:250))) - nanmean(nanmean(AI_PM_RC_CO2_Yang(iii,141:170)));
    delta_AI_PM_RC_CO2_Jarvis_H(iii) = nanmean(nanmean(AI_PM_RC_CO2_Jarvis_H(iii,221:250))) - nanmean(nanmean(AI_PM_RC_CO2_Jarvis_H(iii,141:170)));
    %% Calculate Delta AI Contributed by different Climate Variables
    pr = Met_Year.pr.*1000.*24*3600./997;% to mm/day
    delta_pr = nanmean(nanmean(pr(iii,221:250))) - nanmean(nanmean(pr(iii,141:170))); %2070-2099 minus 1990-2019
    mean_pr = nanmean(nanmean(pr(iii,141:250)));
    
    ETrc = ETrc_Year.PM_RC./365;% to mm/day
    delta_ETrc = nanmean(nanmean(ETrc(iii,221:250))) - nanmean(nanmean(ETrc(iii,141:170))); %2070-2099 minus 1990-2019
    mean_ETrc = nanmean(nanmean(ETrc(iii,141:250)));
    
    s = Middle_Var_Year.s;
    delta_s = nanmean(nanmean(s(iii,221:250))) - nanmean(nanmean(s(iii,141:170))); %2070-2099 minus 1990-2019
    mean_s = nanmean(nanmean(s(iii,141:250)));
    
    lamda = Middle_Var_Year.lamda;
    mean_lamda = nanmean(nanmean(lamda(iii,141:250)));
    
    gamma = Middle_Var_Year.gamma;
    mean_gamma = nanmean(nanmean(gamma(iii,141:250)));
    
    delta_rs = 0; %2070-2099 minus 1990-2019
    mean_rs = 70;
    
    ra = Middle_Var_Year.ra;
    delta_ra = nanmean(nanmean(ra(iii,221:250))) - nanmean(nanmean(ra(iii,141:170))); %2070-2099 minus 1990-2019
    mean_ra = nanmean(nanmean(ra(iii,141:250)));
    
    pa = Middle_Var_Year.pa;
    mean_pa = nanmean(nanmean(pa(iii,141:250)));
    
    Ca = Middle_Var_Year.Ca;
    mean_Ca = nanmean(nanmean(Ca(iii,141:250)));
    
    Rn_s = Middle_Var_Year.Rn_s;
    delta_Rn_s = nanmean(nanmean(Rn_s(iii,221:250))) - nanmean(nanmean(Rn_s(iii,141:170))); %2070-2099 minus 1990-2019
    mean_Rn_s = nanmean(nanmean(Rn_s(iii,141:250)));
    
    VPD = Middle_Var_Year.VPD;
    delta_VPD = nanmean(nanmean(VPD(iii,221:250))) - nanmean(nanmean(VPD(iii,141:170))); %2070-2099 minus 1990-2019
    mean_VPD = nanmean(nanmean(VPD(iii,141:250)));
    
    dAI_dpr(iii) = 1./mean_ETrc .* delta_pr; % pr caused AI change
    % dAI_dETrc = -mean_pr./mean_ETrc.^2 .* delta_ETrc; % pr caused AI change
    dAI_dRn_s(iii) = -mean_pr./mean_ETrc.^2 .* ...
        (mean_s./(mean_lamda.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra)))) ...
        .* delta_Rn_s; % Rn_s caused AI change
    dAI_dVPD(iii) = -mean_pr./mean_ETrc.^2 .*...
        ( mean_pa.*mean_Ca ./ (mean_lamda.*mean_ra.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra))) ) .* 24 .* 3600 ...
        .* delta_VPD; % VPD caused AI change  24.*3600 is based on Dimensional Analysis
    dAI_drs(iii) = -mean_pr./mean_ETrc.^2 .*...
        (-mean_gamma.*(mean_s.*mean_Rn_s+mean_pa.*mean_Ca.*mean_VPD.*24.*3600./mean_ra)./(mean_lamda.*mean_ra.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra)).^2))...
        .* delta_rs; % rs caused AI change  24.*3600 is based on Dimensional Analysis
    dAI_dra(iii) = -mean_pr./mean_ETrc.^2 .*...
        (mean_gamma.*mean_rs.*(mean_s.*mean_Rn_s+mean_pa.*mean_Ca.*mean_VPD.*24.*3600./mean_ra)./(mean_lamda.*mean_ra.^2.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra)).^2) - ...
        mean_pa.*mean_Ca.*mean_VPD.*24.*3600./(mean_lamda.*mean_ra.^2.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra))))...
        .* delta_ra;  % ra caused AI change 24.*3600 is based on Dimensional Analysis
    dAI_ds(iii) = -mean_pr./mean_ETrc.^2 .*...
        (mean_Rn_s./(mean_lamda.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra))) -...
        (mean_s.*mean_Rn_s+mean_pa.*mean_Ca.*mean_VPD.*24.*3600./mean_ra) ./ (mean_lamda.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra)).^2))...
        .* delta_s;  % ra caused AI change
    
    dAI_drs_Yang(iii) = delta_AI_PM_RC_CO2_Yang(iii) - delta_AI_PM_RC(iii);
    dAI_drs_Jarvis_H(iii) = delta_AI_PM_RC_CO2_Jarvis_H(iii) - delta_AI_PM_RC(iii);
    
    % Calculate Error of PM-RC Attribution
    Error(iii) = sum([dAI_dpr(iii),dAI_dRn_s(iii),dAI_dVPD(iii),...
        dAI_drs(iii),dAI_dra(iii),dAI_ds(iii)]) - delta_AI_PM_RC(iii);
end
%% Draw Bar
figure
hBar = bar([[1:12];...
    [81:92]],...
    [mean([delta_AI_PM_RC;delta_AI_PM_RC_CO2_Yang;delta_AI_PM_RC_CO2_Jarvis_H;...%y
    dAI_dpr;dAI_drs;dAI_drs_Yang;dAI_drs_Jarvis_H;dAI_dRn_s;dAI_dVPD;dAI_ds;dAI_dra;Error],2),...%0 value for Seperate AI value
    mean([delta_AI_PM_RC;delta_AI_PM_RC_CO2_Yang;delta_AI_PM_RC_CO2_Jarvis_H;...%y
    dAI_dpr;dAI_drs;dAI_drs_Yang;dAI_drs_Jarvis_H;dAI_dRn_s;dAI_dVPD;dAI_ds;dAI_dra;Error],2)]');
set(hBar(1),'FaceColor',[201,132,70]./255,'FaceAlpha',0.9,'EdgeColor','none')%delta_AI_PM_RC
set(hBar(2),'FaceColor',[35,97,127]./255,'FaceAlpha',0.9,'EdgeColor','none')%delta_AI_PM_RC_CO2_Yang
set(hBar(3),'FaceColor',[1,102,94]./255,'FaceAlpha',0.8,'EdgeColor','none')%delta_AI_PM_RC_CO2_Jarvis_H
set(hBar(4),'FaceColor',[71,132,160]./255,'FaceAlpha',0.85,'EdgeColor','none')%dAI_dpr
set(hBar(5),'FaceColor',[149,208,167]./255,'EdgeColor','none')%dAI_drs
set(hBar(6),'FaceColor',[68,190,160]./255,'EdgeColor','none')%dAI_drs_Yang
set(hBar(7),'FaceColor',[68,190,160]./255,'EdgeColor','none')%dAI_drs_Jarvis_H
set(hBar(8),'FaceColor',[212,157,107]./255,'EdgeColor','none')%dAI_dRn_s
set(hBar(9),'FaceColor',[212,157,107]./255,'EdgeColor','none')%dAI_dVPD
set(hBar(10),'FaceColor',[241,219,152]./255,'EdgeColor','none')%dAI_ds
set(hBar(11),'FaceColor',[244,201,129]./255,'EdgeColor','none')%dAI_dra
set(hBar(12),'FaceColor',[132,130,130]./255,'EdgeColor','none')%Error
hold on;
legend({'PM-RC';'PM-RC-Yang';'PM-RC-Jarvis';...
    'pr';'rs';'rs-Yang';'rs-Jarvis';'Rn_s';'VPD';'s';'ra';'Error'},...
    'Location','NorthEast')
%% Draw ErrorBar
% Black Part of ErrorBar
errorbar([-28.5:76.1/12:47],...
    ...%y
    mean([delta_AI_PM_RC;delta_AI_PM_RC_CO2_Yang;delta_AI_PM_RC_CO2_Jarvis_H;...
    dAI_dpr;dAI_drs;dAI_drs_Yang;dAI_drs_Jarvis_H;dAI_dRn_s;dAI_dVPD;dAI_ds;dAI_dra;Error],2),...
    ...% y negative
    [(std(delta_AI_PM_RC)./sqrt(length(delta_AI_PM_RC))).*1.96  , (std(delta_AI_PM_RC_CO2_Yang)./sqrt(length(delta_AI_PM_RC_CO2_Yang))).*1.96,...
    0,0,0,0,0,...
    (std(dAI_dRn_s)./sqrt(length(dAI_dRn_s))).*1.96  ,  (std(dAI_dVPD)./sqrt(length(dAI_dVPD))).*1.96,...
    (std(dAI_ds)./sqrt(length(dAI_ds))).*1.96  ,  (std(dAI_dra)./sqrt(length(dAI_dra))).*1.96,(std(Error)./sqrt(length(Error))).*1.96],...
    ...% y positive
    [0,0,(std(delta_AI_PM_RC_CO2_Jarvis_H)./sqrt(length(delta_AI_PM_RC_CO2_Jarvis_H))).*1.96,...
    (std(dAI_dpr)./sqrt(length(dAI_dpr))).*1.96  ,  (std(dAI_drs)./sqrt(length(dAI_drs))).*1.96,...
    (std(dAI_drs_Yang)./sqrt(length(dAI_drs_Yang))).*1.96  ,  (std(dAI_drs_Jarvis_H)./sqrt(length(dAI_drs_Jarvis_H))).*1.96,...
    0,0,(std(dAI_ds)./sqrt(length(dAI_ds))).*1.96  ,  (std(dAI_dra)./sqrt(length(dAI_dra))).*1.96,0],'.','LineWidth',1.6,'Color',[0 0 0])
% White Part of ErrorBar
errorbar([-28.5:76.1/12:47],...%x
    ...%y
    mean([delta_AI_PM_RC;delta_AI_PM_RC_CO2_Yang;delta_AI_PM_RC_CO2_Jarvis_H;...%y
    dAI_dpr;dAI_drs;dAI_drs_Yang;dAI_drs_Jarvis_H;dAI_dRn_s;dAI_dVPD;dAI_ds;dAI_dra;Error],2),...
    ...% y negative
    [0,0,(std(delta_AI_PM_RC_CO2_Jarvis_H)./sqrt(length(delta_AI_PM_RC_CO2_Jarvis_H))).*1.96,...
    (std(dAI_dpr)./sqrt(length(dAI_dpr))).*1.96  ,  (std(dAI_drs)./sqrt(length(dAI_drs))).*1.96,...
    (std(dAI_drs_Yang)./sqrt(length(dAI_drs_Yang))).*1.96  ,  (std(dAI_drs_Jarvis_H)./sqrt(length(dAI_drs_Jarvis_H))).*1.96,...
    0,0,0,0,0],...
    ...% y positive
    [(std(delta_AI_PM_RC)./sqrt(length(delta_AI_PM_RC))).*1.96  , (std(delta_AI_PM_RC_CO2_Yang)./sqrt(length(delta_AI_PM_RC_CO2_Yang))).*1.96,...
    0,0,0,0,0,...
    (std(dAI_dRn_s)./sqrt(length(dAI_dRn_s))).*1.96  ,  (std(dAI_dVPD)./sqrt(length(dAI_dVPD))).*1.96,...
    0 , 0,(std(Error)./sqrt(length(Error))).*1.96],...
    '.','LineWidth',1.6,'Color',[1 1 1])
plot([-35 47],[0 0],'k','LineWidth',2);
plot([-12.5 -12.5],[-0.2 0.22],'k','LineWidth',1.5)
set(gca,'xlim',[-35,47],'ylim',[-0.16 0.1],'FontName','Arial','FontSize',24,'LineWidth',2.5)
ylabel('\DeltaAI')
end

