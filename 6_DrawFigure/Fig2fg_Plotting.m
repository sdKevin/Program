function Fig2fg_Plotting(Ensemble_Mean_PerChange)
for i_ssp = 4
    %% AI
    figure
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
    ColorMatrix = [155,84,34;176,108,49;201,132,70;212,157,107;230,183,138;244,201,129;241,219,152;245,229,180;251,244,181;...
        196,226,192;149,208,167;121,202,165;68,190,160;101,167,195;71,132,160;35,97,127;46,86,114;10,57,90]./255;
    ColorRange = [-100,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,101];
    for ii = 1:length(Re_Change_AI_Max_Lat)
        Y = Re_Change_AI(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat1(ii),Y(iii),'.','Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat1,fliplr(Lat1)],...
    %         [Re_Change_AI_Min_Lat,fliplr(Re_Change_AI_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    
    plot(Lat1,Re_Change_AI_Mean_Lat,'Color',[32,33,36]./255,'LineWidth',2.5)
    
    plot([-60 90],[0 0],'k','LineWidth',1.5)
    view(-90,90)
    set(gca,'xlim',[-60,90],'ylim',[-100,100],'YTick',[-50:50:270],'XTick',[-50:30:250],...
        'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
    ylabel('Relative Chnage of AI (%)')
    
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
    ColorMatrix = [155,84,34;176,108,49;201,132,70;212,157,107;230,183,138;244,201,129;241,219,152;245,229,180;251,244,181;...
        196,226,192;149,208,167;121,202,165;68,190,160;101,167,195;71,132,160;35,97,127;46,86,114;10,57,90]./255;
    ColorRange = [-100,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,101];
    for ii = 1:length(Re_Change_pr_evspsbl_Max_Lat)
        Y = Re_Change_pr_evspsbl(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat2(ii),Y(iii),'.','Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat2,fliplr(Lat2)],...
    %         [Re_Change_pr_evspsbl_Min_Lat,fliplr(Re_Change_pr_evspsbl_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    
    plot(Lat2,Re_Change_pr_evspsbl_Mean_Lat,'Color',[32,33,36]./255,'LineWidth',2.5)
    
    plot([-60 90],[0 0],'k','LineWidth',1.5)
    view(-90,90)
    set(gca,'xlim',[-60,90],'ylim',[-100,100],'YTick',[-50:50:270],'XTick',[-50:30:250],...
        'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
    ylabel('Relative Chnage of pr-evspsbl (%)')
    
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
    ColorMatrix = [155,84,34;176,108,49;201,132,70;212,157,107;230,183,138;244,201,129;241,219,152;245,229,180;251,244,181;...
        196,226,192;149,208,167;121,202,165;68,190,160;101,167,195;71,132,160;35,97,127;46,86,114;10,57,90]./255;
    ColorRange = [-100,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,100];
    for ii = 1:length(Re_Change_mrro_Max_Lat)
        Y = Re_Change_mrro(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat3(ii),Y(iii),'.','Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat3,fliplr(Lat3)],...
    %         [Re_Change_mrro_Min_Lat,fliplr(Re_Change_mrro_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    
    plot(Lat3,Re_Change_mrro_Mean_Lat,'Color',[32,33,36]./255,'LineWidth',2.5)
    
    plot([-60 90],[0 0],'k','LineWidth',1.5)
    view(-90,90)
    set(gca,'xlim',[-60,90],'ylim',[-100,100],'YTick',[-50:50:270],'XTick',[-50:30:250],...
        'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
    ylabel('Relative Chnage of mrro (%)')
    
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
    ColorMatrix = [155,84,34;176,108,49;201,132,70;212,157,107;230,183,138;244,201,129;241,219,152;245,229,180;251,244,181;...
        196,226,192;149,208,167;121,202,165;68,190,160;101,167,195;71,132,160;35,97,127;46,86,114;10,57,90]./255;
    ColorRange = [-100,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,101];
    for ii = 1:length(Re_Change_mrso_Max_Lat)
        Y = Re_Change_mrso(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat4(ii),Y(iii),'.','Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat4,fliplr(Lat4)],...
    %         [Re_Change_mrso_Min_Lat,fliplr(Re_Change_mrso_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    plot(Lat1,Re_Change_AI_Mean_Lat,'Color',[32,33,36]./255,'LineWidth',2.5)
    plot(Lat2,Re_Change_pr_evspsbl_Mean_Lat,'Color',[32,33,36]./255,'LineWidth',2.5)
    plot(Lat3,Re_Change_mrro_Mean_Lat,'Color',[32,33,36]./255,'LineWidth',2.5)
    plot(Lat4,Re_Change_mrso_Mean_Lat,'Color',[32,33,36]./255,'LineWidth',2.5)
    
    
    plot([-60 90],[0 0],'k','LineWidth',1.5)
    view(-90,90)
    set(gca,'xlim',[-60,90],'ylim',[-100,100],'YTick',[-50:50:270],'XTick',[-50:30:250],...
        'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
    ylabel('Relative Chnage of mrso (%)')
end
end

