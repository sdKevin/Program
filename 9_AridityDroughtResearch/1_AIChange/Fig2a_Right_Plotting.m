function Fig2a_Right_Plotting(ETrc_Year , Met_Year , Attribution_Year , Path_Fig2a_Output)
% Drawing AI Attribution calculated by PM_RC_CO2_Jarvis_H
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
RGB_ssp_Line = [156,85,31;194,139,79;116,173,163;36,131,145];
RGB_ssp_Shade = [211,178,150;229,206,175;197,220,211;160,199,202];
Xlim_Range = [-0.1,8.6]; Ylim_Range = [-0.185,0.10];
% plot y=0
plot(Xlim_Range,[0 0],'Color',[189,188,188]./255,'LineWidth',3)

for ii = 4 : -1 : 1
    bar([0.5 , 2 : 8] , mean([delta_AI_PM_RC_CO2_Jarvis_H(ii,:);...
        dAI_dpr(ii,:);dAI_drs_Jarvis_H(ii,:);dAI_dRn_s(ii,:);...
        dAI_dVPD(ii,:);dAI_ds(ii,:);dAI_dra(ii,:);Error(ii,:)],2),...
        'FaceColor',RGB_ssp_Shade(ii,:)./255,'EdgeColor','none')
    hold on
end
set(gca,'XTick', [0.5 , 2 : 8] ,'XTickLabel',{'\Delta AI','P','rs','Rn^*','VPD','s','ra','error'})
%% Draw ErrorBar
% Black Part of ErrorBar
X_Pos = [-0.24,-0.08,0.08,0.24];
for ii = 4 : -1 : 1
    errorbar([0.5 , 2 : 8] + X_Pos(ii) ,...
        mean([delta_AI_PM_RC_CO2_Jarvis_H(ii,:); dAI_dpr(ii,:);...
        dAI_drs_Jarvis_H(ii,:); dAI_dRn_s(ii,:); dAI_dVPD(ii,:);...
        dAI_ds(ii,:); dAI_dra(ii,:); Error(ii,:)],2) , ...
        [(std(delta_AI_PM_RC_CO2_Jarvis_H(ii,:))./sqrt(length(delta_AI_PM_RC_CO2_Jarvis_H(ii,:)))).*1.28,...
        (std(dAI_dpr(ii,:))./sqrt(length(dAI_dpr(ii,:)))).*1.28  ,...
        (std(dAI_drs_Jarvis_H(ii,:))./sqrt(length(dAI_drs_Jarvis_H(ii,:)))).*1.28  ,...
        (std(dAI_dRn_s(ii,:))./sqrt(length(dAI_dRn_s(ii,:)))).*1.28  ,...
        (std(dAI_dVPD(ii,:))./sqrt(length(dAI_dVPD(ii,:)))).*1.28  ,...
        (std(dAI_ds(ii,:))./sqrt(length(dAI_ds(ii,:)))).*1.28  ,...
        (std(dAI_dra(ii,:))./sqrt(length(dAI_dra(ii,:)))).*1.28  ,...
        (std(Error(ii,:))./sqrt(length(Error(ii,:)))).*1.28],...
        'o','MarkerSize',3,'MarkerEdgeColor',RGB_ssp_Line(ii,:)./255,...
        'Color',[120,120,120]./255,'LineWidth',2.5)
    % upper boundary of 80% Confidence Interval
    A = mean([delta_AI_PM_RC_CO2_Jarvis_H(ii,:); dAI_dpr(ii,:);...
        dAI_drs_Jarvis_H(ii,:); dAI_dRn_s(ii,:); dAI_dVPD(ii,:);...
        dAI_ds(ii,:); dAI_dra(ii,:); Error(ii,:)],2)' +...
        [(std(delta_AI_PM_RC_CO2_Jarvis_H(ii,:))./sqrt(length(delta_AI_PM_RC_CO2_Jarvis_H(ii,:)))).*1.28,...
        (std(dAI_dpr(ii,:))./sqrt(length(dAI_dpr(ii,:)))).*1.28  ,...
        (std(dAI_drs_Jarvis_H(ii,:))./sqrt(length(dAI_drs_Jarvis_H(ii,:)))).*1.28  ,...
        (std(dAI_dRn_s(ii,:))./sqrt(length(dAI_dRn_s(ii,:)))).*1.28  ,...
        (std(dAI_dVPD(ii,:))./sqrt(length(dAI_dVPD(ii,:)))).*1.28  ,...
        (std(dAI_ds(ii,:))./sqrt(length(dAI_ds(ii,:)))).*1.28  ,...
        (std(dAI_dra(ii,:))./sqrt(length(dAI_dra(ii,:)))).*1.28  ,...
        (std(Error(ii,:))./sqrt(length(Error(ii,:)))).*1.28];
    % lower boundary of 80% Confidence Interval
    B = mean([delta_AI_PM_RC_CO2_Jarvis_H(ii,:); dAI_dpr(ii,:);...
        dAI_drs_Jarvis_H(ii,:); dAI_dRn_s(ii,:); dAI_dVPD(ii,:);...
        dAI_ds(ii,:); dAI_dra(ii,:); Error(ii,:)],2)' -...
        [(std(delta_AI_PM_RC_CO2_Jarvis_H(ii,:))./sqrt(length(delta_AI_PM_RC_CO2_Jarvis_H(ii,:)))).*1.28,...
        (std(dAI_dpr(ii,:))./sqrt(length(dAI_dpr(ii,:)))).*1.28  ,...
        (std(dAI_drs_Jarvis_H(ii,:))./sqrt(length(dAI_drs_Jarvis_H(ii,:)))).*1.28  ,...
        (std(dAI_dRn_s(ii,:))./sqrt(length(dAI_dRn_s(ii,:)))).*1.28  ,...
        (std(dAI_dVPD(ii,:))./sqrt(length(dAI_dVPD(ii,:)))).*1.28  ,...
        (std(dAI_ds(ii,:))./sqrt(length(dAI_ds(ii,:)))).*1.28  ,...
        (std(dAI_dra(ii,:))./sqrt(length(dAI_dra(ii,:)))).*1.28  ,...
        (std(Error(ii,:))./sqrt(length(Error(ii,:)))).*1.28];
    % Ouput 80% Confidence Interval
    if ii==4
        xlswrite([Path_Fig2a_Output '80% confidence interval.xlsx'] , A , 'PM_RC_Jarvis' , 'B25:I25');
        xlswrite([Path_Fig2a_Output '80% confidence interval.xlsx'] , B , 'PM_RC_Jarvis' , 'B26:I26');
    elseif ii==3
        xlswrite([Path_Fig2a_Output '80% confidence interval.xlsx'] , A , 'PM_RC_Jarvis' , 'B18:I18');
        xlswrite([Path_Fig2a_Output '80% confidence interval.xlsx'] , B , 'PM_RC_Jarvis' , 'B19:I19');
    elseif ii==2
        xlswrite([Path_Fig2a_Output '80% confidence interval.xlsx'] , A , 'PM_RC_Jarvis' , 'B11:I11');
        xlswrite([Path_Fig2a_Output '80% confidence interval.xlsx'] , B , 'PM_RC_Jarvis' , 'B12:I12');
    else
        xlswrite([Path_Fig2a_Output '80% confidence interval.xlsx'] , A , 'PM_RC_Jarvis' , 'B4:I4');
        xlswrite([Path_Fig2a_Output '80% confidence interval.xlsx'] , B , 'PM_RC_Jarvis' , 'B5:I5');
    end
    clear A B
end

plot([1.25 1.25],Ylim_Range,'k--','LineWidth',1.5)
plot([3.5 3.5],Ylim_Range,'k--','LineWidth',1.5)
plot([7.5 7.5],Ylim_Range,'k--','LineWidth',1.5)
view(-90,90)

set(gca,'xlim',Xlim_Range,'ylim',Ylim_Range,...
    'YMinorTick','on',...
    'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
ylabel('\Delta AI Attribution')

end

