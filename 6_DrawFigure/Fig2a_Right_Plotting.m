function Fig2a_Right_Plotting(ETrc_Year , Met_Year , Attribution_Year)
for i_ssp = [2,3,5,4]
    % HadGEM3-GC31-LL does not have ssp370
    if i_ssp == 4
        Attribution_Year(1).Attribution_Year.s(16,:) = [];
        Attribution_Year(1).Attribution_Year.lamda(16,:) = [];
        Attribution_Year(1).Attribution_Year.gamma(16,:) = [];
        Attribution_Year(1).Attribution_Year.rs_H(16,:) = [];
        Attribution_Year(1).Attribution_Year.ra(16,:) = [];
        Attribution_Year(1).Attribution_Year.ea(16,:) = [];
        Attribution_Year(1).Attribution_Year.pa(16,:) = [];
        Attribution_Year(1).Attribution_Year.Ca(16,:) = [];
        Attribution_Year(1).Attribution_Year.Rn_s(16,:) = [];
        Attribution_Year(1).Attribution_Year.VPD(16,:) = [];
        ETrc_Year(1).ETrc_Year.PM_RC(16,:) = [];
        ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H(16,:) = [];
        Met_Year(1).Met_Year.pr(16,:) = [];
    end
    for iii = 1 : size(ETrc_Year(i_ssp).ETrc_Year.PM_RC_CO2_Jarvis_H,1)
        %% Calculate Delta AI
        AI_historical = (Met_Year(1).Met_Year.pr.*1000.*31536000./997)./...
            (ETrc_Year(1).ETrc_Year.PM_RC.*365);
        AI_ssp = (Met_Year(i_ssp).Met_Year.pr.*1000.*31536000./997)./...
            (ETrc_Year(i_ssp).ETrc_Year.PM_RC.*365);
        delta_AI_PM_RC(i_ssp-1 , iii) = nanmean(nanmean(AI_ssp(iii,end-30:end-1))) - nanmean(nanmean(AI_historical(iii,99:end)));
        clear AI_historical AI_ssp
        % pr kg/(m2s), ETrc mm/day
        AI_historical = (Met_Year(1).Met_Year.pr.*1000.*31536000./997)./...
            (ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H.*365);
        AI_ssp = (Met_Year(i_ssp).Met_Year.pr.*1000.*31536000./997)./...
            (ETrc_Year(i_ssp).ETrc_Year.PM_RC_CO2_Jarvis_H.*365);
        % 2070-2099 minus 1948-2014
        delta_AI_PM_RC_CO2_Jarvis_H(i_ssp-1 , iii) = nanmean(nanmean(AI_ssp(iii,end-30:end-1))) - nanmean(nanmean(AI_historical(iii,99:end)));
        clear AI_historical AI_ssp
        %% Calculate Delta AI Contributed by different Climate Variables
        pr_historical = Met_Year(1).Met_Year.pr .* 1000 .* 24 .* 3600 ./ 997; % to mm/day
        pr_ssp = Met_Year(i_ssp).Met_Year.pr .* 1000 .* 24 .* 3600 ./ 997; % to mm/day
        delta_pr = nanmean(nanmean(pr_ssp(iii,end-30:end-1))) - nanmean(nanmean(pr_historical(iii,99:end)));% 2070-2099 minus 1948-2014
        mean_pr = nanmean(nanmean([pr_historical(iii,99:end) , pr_ssp(iii,:)]));
        clear pr_historical pr_ssp
        
        ETrc_historical = ETrc_Year(1).ETrc_Year.PM_RC_CO2_Jarvis_H; % mm/day
        ETrc_ssp = ETrc_Year(i_ssp).ETrc_Year.PM_RC_CO2_Jarvis_H; % mm/day
        delta_ETrc = nanmean(nanmean(ETrc_ssp(iii,end-30:end-1))) - nanmean(nanmean(ETrc_historical(iii,99:end)));% 2070-2099 minus 1948-2014
        mean_ETrc = nanmean(nanmean([ETrc_historical(iii,99:end) , ETrc_ssp(iii,:)]));
        clear ETrc_historical ETrc_ssp
        
        s_historical = Attribution_Year(1).Attribution_Year.s;
        s_ssp = Attribution_Year(i_ssp).Attribution_Year.s;
        delta_s = nanmean(nanmean(s_ssp(iii,end-30:end-1))) - nanmean(nanmean(s_historical(iii,99:end)));% 2070-2099 minus 1948-2014
        mean_s = nanmean(nanmean([s_historical(iii,99:end) , s_ssp(iii,:)]));
        clear s_historical s_ssp
        
        lamda_historical = Attribution_Year(1).Attribution_Year.lamda;
        lamda_ssp = Attribution_Year(i_ssp).Attribution_Year.lamda;
        mean_lamda = nanmean(nanmean([lamda_historical(iii,99:end) , lamda_ssp(iii,:)]));
        clear lamda_historical lamda_ssp
        
        gamma_historical = Attribution_Year(1).Attribution_Year.gamma;
        gamma_ssp = Attribution_Year(i_ssp).Attribution_Year.gamma;
        mean_gamma = nanmean(nanmean([gamma_historical(iii,99:end) , gamma_ssp(iii,:)]));
        clear gamma_historical gamma_ssp
        
        delta_rs = 0; %2070-2099 minus 1990-2019
        mean_rs = 70;
        
        ra_historical = Attribution_Year(1).Attribution_Year.ra;
        ra_ssp = Attribution_Year(i_ssp).Attribution_Year.ra;
        delta_ra = nanmean(nanmean(ra_ssp(iii,end-30:end-1))) - nanmean(nanmean(ra_historical(iii,99:end)));% 2070-2099 minus 1948-2014
        mean_ra = nanmean(nanmean([ra_historical(iii,99:end) , ra_ssp(iii,:)]));
        clear ra_historical ra_ssp
        
        pa_historical = Attribution_Year(1).Attribution_Year.pa;
        pa_ssp = Attribution_Year(i_ssp).Attribution_Year.pa;
        mean_pa = nanmean(nanmean([pa_historical(iii,99:end) , pa_ssp(iii,:)]));
        clear pa_historical pa_ssp
        
        Ca_historical = Attribution_Year(1).Attribution_Year.Ca;
        Ca_ssp = Attribution_Year(i_ssp).Attribution_Year.Ca;
        mean_Ca = nanmean(nanmean([Ca_historical(iii,99:end) , Ca_ssp(iii,:)]));
        clear Ca_historical Ca_ssp
        
        Rn_s_historical = Attribution_Year(1).Attribution_Year.Rn_s;
        Rn_s_ssp = Attribution_Year(i_ssp).Attribution_Year.Rn_s;
        delta_Rn_s = nanmean(nanmean(Rn_s_ssp(iii,end-30:end-1))) - nanmean(nanmean(Rn_s_historical(iii,99:end)));% 2070-2099 minus 1948-2014
        mean_Rn_s = nanmean(nanmean([Rn_s_historical(iii,99:end) , Rn_s_ssp(iii,:)]));
        clear Rn_s_historical Rn_s_ssp
        
        VPD_historical = Attribution_Year(1).Attribution_Year.VPD;
        VPD_ssp = Attribution_Year(i_ssp).Attribution_Year.VPD;
        delta_VPD = nanmean(nanmean(VPD_ssp(iii,end-30:end-1))) - nanmean(nanmean(VPD_historical(iii,99:end)));% 2070-2099 minus 1948-2014
        mean_VPD = nanmean(nanmean([VPD_historical(iii,99:end) , VPD_ssp(iii,:)]));
        clear VPD_historical VPD_ssp
        
        
        dAI_dpr(i_ssp-1 , iii) = 1./mean_ETrc .* delta_pr; % pr caused AI change
        % dAI_dETrc = -mean_pr./mean_ETrc.^2 .* delta_ETrc; % pr caused AI change
        dAI_dRn_s(i_ssp-1 , iii) = -mean_pr./mean_ETrc.^2 .* ...
            (mean_s./(mean_lamda.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra)))) ...
            .* delta_Rn_s; % Rn_s caused AI change
        dAI_dVPD(i_ssp-1 , iii) = -mean_pr./mean_ETrc.^2 .*...
            ( mean_pa.*mean_Ca ./ (mean_lamda.*mean_ra.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra))) ) .* 24 .* 3600 ...
            .* delta_VPD; % VPD caused AI change  24.*3600 is based on Dimensional Analysis
        dAI_drs(i_ssp-1 , iii) = -mean_pr./mean_ETrc.^2 .*...
            (-mean_gamma.*(mean_s.*mean_Rn_s+mean_pa.*mean_Ca.*mean_VPD.*24.*3600./mean_ra)./(mean_lamda.*mean_ra.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra)).^2))...
            .* delta_rs; % rs caused AI change  24.*3600 is based on Dimensional Analysis
        dAI_dra(i_ssp-1 , iii) = -mean_pr./mean_ETrc.^2 .*...
            (mean_gamma.*mean_rs.*(mean_s.*mean_Rn_s+mean_pa.*mean_Ca.*mean_VPD.*24.*3600./mean_ra)./(mean_lamda.*mean_ra.^2.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra)).^2) - ...
            mean_pa.*mean_Ca.*mean_VPD.*24.*3600./(mean_lamda.*mean_ra.^2.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra))))...
            .* delta_ra;  % ra caused AI change 24.*3600 is based on Dimensional Analysis
        dAI_ds(i_ssp-1 , iii) = -mean_pr./mean_ETrc.^2 .*...
            (mean_Rn_s./(mean_lamda.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra))) -...
            (mean_s.*mean_Rn_s+mean_pa.*mean_Ca.*mean_VPD.*24.*3600./mean_ra) ./ (mean_lamda.*(mean_s+mean_gamma.*(1+mean_rs./mean_ra)).^2))...
            .* delta_s;  % ra caused AI change
        
        dAI_drs_Jarvis_H(i_ssp-1 , iii) = delta_AI_PM_RC_CO2_Jarvis_H(iii) - delta_AI_PM_RC(iii);
        
        % Calculate Error of PM-RC Attribution
        Error(i_ssp-1 , iii) = sum([dAI_dpr(i_ssp-1 , iii),...
            dAI_dRn_s(i_ssp-1 , iii),dAI_dVPD(i_ssp-1 , iii),...
            dAI_drs(i_ssp-1 , iii),dAI_dra(i_ssp-1 , iii),dAI_ds(i_ssp-1 , iii)])...
            - delta_AI_PM_RC(i_ssp-1 , iii);
    end
end
%% Draw Bar
figure
for ii=4:-1:1
    bar(mean([delta_AI_PM_RC(ii,:);delta_AI_PM_RC_CO2_Jarvis_H(ii,:);...%y
        dAI_dpr(ii,:);dAI_drs(ii,:);dAI_drs_Jarvis_H(ii,:);...
        dAI_dRn_s(ii,:);dAI_dVPD(ii,:);dAI_ds(ii,:);dAI_dra(ii,:);Error(ii,:)],2))
    hold on
end

















hBar = bar([[1:12];...
    [81:92]],...
    [mean([delta_AI_PM_RC;delta_AI_PM_RC_CO2_Jarvis_H;...%y
    dAI_dpr;dAI_drs;dAI_drs_Jarvis_H;dAI_dRn_s;dAI_dVPD;dAI_ds;dAI_dra;Error],2),...%0 value for Seperate AI value
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

