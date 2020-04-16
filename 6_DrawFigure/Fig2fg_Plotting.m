function Fig2fg_Plotting(Ensemble_Mean_PerChange)
for i_ssp = 4
    %% AI
    figure
    disp('Adjust Figure Size, and Press Enter to Continue');
    pause()
    
    Re_Change_AI = Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_AI;
    Re_Change_AI(Re_Change_AI==-9999)=nan;
    Lat1 = [-59.75:0.5:89.75];
    Re_Change_AI_Mean_Lat = nanmean(Re_Change_AI,1);
    Re_Change_AI_Min_Lat = nanmin(Re_Change_AI);
    Re_Change_AI_Max_Lat = nanmax(Re_Change_AI);
    
    Lat1(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI(:,isnan(Re_Change_AI_Mean_Lat))=[];
    Re_Change_AI_Min_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI_Max_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI_Mean_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    
    % Color Shade Area
    ColorMatrix = [156,85,31;168,101,45;181,119,62;194,139,79;204,157,96;217,178,115;227,198,136;...
        237,218,154;250,243,180;242,247,188;216,232,183;191,217,178;165,201,173;140,186,168;...
        116,173,163;90,158,157;65,143,150;36,131,145]./255;
    ColorRange = [-101,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,101];
    for ii = 1:length(Re_Change_AI_Max_Lat)
        Y = Re_Change_AI(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat1(ii),Y(iii),'.','MarkerSize',5.5,'Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat1,fliplr(Lat1)],...
    %         [Re_Change_AI_Min_Lat,fliplr(Re_Change_AI_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    
    %% pr_evspsbl
    %     figure
    Re_Change_pr_evspsbl = Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_pr_evspsbl;
    Re_Change_pr_evspsbl(Re_Change_pr_evspsbl==-9999)=nan;
    Lat2 = [-59.75:0.5:89.75];
    Re_Change_pr_evspsbl_Mean_Lat = nanmean(Re_Change_pr_evspsbl,1);
    Re_Change_pr_evspsbl_Min_Lat = nanmin(Re_Change_pr_evspsbl);
    Re_Change_pr_evspsbl_Max_Lat = nanmax(Re_Change_pr_evspsbl);
    
    Lat2(isnan(Re_Change_pr_evspsbl_Mean_Lat)) = [];
    Re_Change_pr_evspsbl(:,isnan(Re_Change_pr_evspsbl_Mean_Lat))=[];
    Re_Change_pr_evspsbl_Min_Lat(isnan(Re_Change_pr_evspsbl_Mean_Lat)) = [];
    Re_Change_pr_evspsbl_Max_Lat(isnan(Re_Change_pr_evspsbl_Mean_Lat)) = [];
    Re_Change_pr_evspsbl_Mean_Lat(isnan(Re_Change_pr_evspsbl_Mean_Lat)) = [];
    
    % Color Shade Area
    ColorMatrix = [156,85,31;168,101,45;181,119,62;194,139,79;204,157,96;217,178,115;227,198,136;...
        237,218,154;250,243,180;242,247,188;216,232,183;191,217,178;165,201,173;140,186,168;...
        116,173,163;90,158,157;65,143,150;36,131,145]./255;
    ColorRange = [-100,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,101];
    for ii = 1:length(Re_Change_pr_evspsbl_Max_Lat)
        Y = Re_Change_pr_evspsbl(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat2(ii),Y(iii),'.','MarkerSize',5.5,'Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat2,fliplr(Lat2)],...
    %         [Re_Change_pr_evspsbl_Min_Lat,fliplr(Re_Change_pr_evspsbl_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    
    %% mrro
    %     figure
    Re_Change_mrro = Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_mrro;
    Re_Change_mrro(Re_Change_mrro==-9999)=nan;
    Lat3 = [-59.75:0.5:89.75];
    Re_Change_mrro_Mean_Lat = nanmean(Re_Change_mrro,1);
    Re_Change_mrro_Min_Lat = nanmin(Re_Change_mrro);
    Re_Change_mrro_Max_Lat = nanmax(Re_Change_mrro);
    
    Lat3(isnan(Re_Change_mrro_Mean_Lat)) = [];
    Re_Change_mrro(:,isnan(Re_Change_mrro_Mean_Lat))=[];
    Re_Change_mrro_Min_Lat(isnan(Re_Change_mrro_Mean_Lat)) = [];
    Re_Change_mrro_Max_Lat(isnan(Re_Change_mrro_Mean_Lat)) = [];
    Re_Change_mrro_Mean_Lat(isnan(Re_Change_mrro_Mean_Lat)) = [];
    
    % Color Shade Area
    ColorMatrix = [156,85,31;168,101,45;181,119,62;194,139,79;204,157,96;217,178,115;227,198,136;...
        237,218,154;250,243,180;242,247,188;216,232,183;191,217,178;165,201,173;140,186,168;...
        116,173,163;90,158,157;65,143,150;36,131,145]./255;
    ColorRange = [-100,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,100];
    for ii = 1:length(Re_Change_mrro_Max_Lat)
        Y = Re_Change_mrro(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat3(ii),Y(iii),'.','MarkerSize',5.5,'Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat3,fliplr(Lat3)],...
    %         [Re_Change_mrro_Min_Lat,fliplr(Re_Change_mrro_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    
    %% mrso
    %     figure
    Re_Change_mrso = Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_mrso;
    Re_Change_mrso(Re_Change_mrso==-9999)=nan;
    Lat4 = [-59.75:0.5:89.75];
    Re_Change_mrso_Mean_Lat = nanmean(Re_Change_mrso,1);
    Re_Change_mrso_Min_Lat = nanmin(Re_Change_mrso);
    Re_Change_mrso_Max_Lat = nanmax(Re_Change_mrso);
    
    Lat4(isnan(Re_Change_mrso_Mean_Lat)) = [];
    Re_Change_mrso(:,isnan(Re_Change_mrso_Mean_Lat))=[];
    Re_Change_mrso_Min_Lat(isnan(Re_Change_mrso_Mean_Lat)) = [];
    Re_Change_mrso_Max_Lat(isnan(Re_Change_mrso_Mean_Lat)) = [];
    Re_Change_mrso_Mean_Lat(isnan(Re_Change_mrso_Mean_Lat)) = [];
    
    % Color Shade Area
    ColorMatrix = [156,85,31;168,101,45;181,119,62;194,139,79;204,157,96;217,178,115;227,198,136;...
        237,218,154;250,243,180;242,247,188;216,232,183;191,217,178;165,201,173;140,186,168;...
        116,173,163;90,158,157;65,143,150;36,131,145]./255;
    ColorRange = [-100,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,101];
    for ii = 1:length(Re_Change_mrso_Max_Lat)
        Y = Re_Change_mrso(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat4(ii),Y(iii),'.','MarkerSize',5.5,'Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat4,fliplr(Lat4)],...
    %         [Re_Change_mrso_Min_Lat,fliplr(Re_Change_mrso_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    plot([-60 90],[0 0],'Color',[189,188,188]./255,'LineWidth',3)
    view(-90,90)
    set(gca,'xlim',[-60,90],'ylim',[-100,100],'YTick',[-100:25:100],'XTick',[-60:30:90],...
        'XMinorTick','on','YMinorTick','on',...
        'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
    ylabel('Relative Change (%)')
    
    axes('position',get(gca,'position'))
    plot(Lat1,Re_Change_AI_Mean_Lat,'-','Color',[37,37,37]./255,'LineWidth',2.5);hold on
    plot(Lat4,Re_Change_mrso_Mean_Lat,'-','Color',[160,160,160]./255,'LineWidth',2.5)
    plot(Lat2,Re_Change_pr_evspsbl_Mean_Lat,'--','Color',[82,82,82]./255,'LineWidth',2.5)
    plot(Lat3,Re_Change_mrro_Mean_Lat,':','Color',[115,115,115]./255,'LineWidth',2.5)
    
    plot([-60 90],[0 0],'Color',[189,188,188]./255,'LineWidth',2)
    view(-90,90)
    legend('AI','\theta','Pr-ET','Q','Location','NorthEast',...
        'Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
    set(gca,'xlim',[-60,90],'ylim',[-100,100],'YTick',[-100:25:100],'XTick',[-60:30:90],...
        'XMinorTick','on','YMinorTick','on','visible','off',...
        'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
    
    print(gcf,'-r600','-dpng','Fig2fg.png');
end
end