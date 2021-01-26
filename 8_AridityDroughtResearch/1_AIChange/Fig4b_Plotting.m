function Fig4b_Plotting(Ensemble_Mean_PerChange)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Drawing ssp126, ssp245, ssp370, ssp585 pr_evspsbl
figure
disp('Adjust Figure Size, and Press Enter to Continue');
pause()
for i_ssp = 1:4
    %% AI
    %figure
    Re_Change_AI = Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_AI;
    Re_Change_AI(Re_Change_AI==-9999)=nan;
    Lat2 = [-59.75:0.5:89.75];
    Re_Change_AI_Mean_Lat = nanmean(Re_Change_AI,1);
    Re_Change_AI_Min_Lat = nanmin(Re_Change_AI);
    Re_Change_AI_Max_Lat = nanmax(Re_Change_AI);
    
    Lat2(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI(:,isnan(Re_Change_AI_Mean_Lat))=[];
    Re_Change_AI_Min_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI_Max_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI_Mean_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    
    % Color Shade Area
    ColorMatrix = [156,85,31;168,101,45;181,119,62;194,139,79;204,157,96;217,178,115;227,198,136;...
        237,218,154;250,243,180;242,247,188;216,232,183;191,217,178;165,201,173;140,186,168;...
        116,173,163;90,158,157;65,143,150;36,131,145]./255;
    ColorRange = [-100,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,101];
    for ii = 1:length(Re_Change_AI_Max_Lat)
        Y = Re_Change_AI(:,ii);Y(isnan(Y))=[];
        for iii = 1:length(Y)
            ForColor = find([Y(iii)<ColorRange]==1);
            plot(Lat2(ii),Y(iii),'.','MarkerSize',5.5,'Color',ColorMatrix(ForColor(1),:));hold on;
            clear ForColor
        end
        clear Y
    end
    
    %     fill([Lat2,fliplr(Lat2)],...
    %         [Re_Change_AI_Min_Lat,fliplr(Re_Change_AI_Max_Lat)],...
    %         [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
    
    plot([-60 90] , [0 0] , 'Color' , [189,188,188]./255 , 'LineWidth',3); hold on;
    view(-90,90)
    set(gca,'xlim',[-60,90],'ylim',[-100,100],'YTick',[-100:25:100],'XTick',[-60:30:90],...
        'XMinorTick','on','YMinorTick','on',...
        'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
    ylabel('Relative Change (%)')
end
axes('position',get(gca,'position'))
for i_ssp = 1:4
    %% AI
    %     figure
    Re_Change_AI = Ensemble_Mean_PerChange(i_ssp).Ensemble_Mean_PerChange_AI;
    Re_Change_AI(Re_Change_AI==-9999)=nan;
    Lat2 = [-59.75:0.5:89.75];
    Re_Change_AI_Mean_Lat = nanmean(Re_Change_AI,1);
    Re_Change_AI_Min_Lat = nanmin(Re_Change_AI);
    Re_Change_AI_Max_Lat = nanmax(Re_Change_AI);
    
    Lat2(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI(:,isnan(Re_Change_AI_Mean_Lat))=[];
    Re_Change_AI_Min_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI_Max_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    Re_Change_AI_Mean_Lat(isnan(Re_Change_AI_Mean_Lat)) = [];
    
    if i_ssp==1
        plot(Lat2,Re_Change_AI_Mean_Lat,':','Color',[115,115,115]./255,'LineWidth',2.5);hold on;
    elseif i_ssp==2
        plot(Lat2,Re_Change_AI_Mean_Lat,'--','Color',[82,82,82]./255,'LineWidth',2.5);
    elseif i_ssp==3
        plot(Lat2,Re_Change_AI_Mean_Lat,'-','Color',[160,160,160]./255,'LineWidth',2.5);
    elseif i_ssp==4
        plot(Lat2,Re_Change_AI_Mean_Lat,'-','Color',[37,37,37]./255,'LineWidth',2.5);
    end
    
    view(-90,90)
    legend('SSP126','SSP245','SSP370','SSP585','Position',[0.204,0.935,0.6,0.05],'Orientation','Horizontal',...
        'Color','None','EdgeColor','None','FontSize',24,'FontName','Arial')
    set(gca,'xlim',[-60,90],'ylim',[-100,100],'YTick',[-100:25:100],'XTick',[-60:30:90],...
        'XMinorTick','on','YMinorTick','on','visible','off',...
        'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
end
print(gcf,'-r900','-dpng','Fig4b(AI).png');
end