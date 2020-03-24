function Fig1b_Plotting( Middle_Year , rs_H_1948_2014 , rs_H_2070_2099)
figure
%% Three Windows
fill([1850;1879;1879;1850],[-9.7;-9.7;129.7;129.7],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);hold on;
fill([1948.5;2014;2014;1948.5],[-9.7;-9.7;129.7;129.7],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);
fill([2070;2099;2099;2070],[-9.7;-9.7;129.7;129.7],...
    [240,240,242]./255,'EdgeAlpha',0,'FaceAlpha',0.8);
%% Yearly Series: Relative Change of global average rs
% rs_H Percent Change
Ensemble_Mean_rs_H = nanmean(Middle_Year.rs_H)'; %1948-2014 is number 99-165
Ensemble_Mean_rs_H = (Ensemble_Mean_rs_H - mean(Ensemble_Mean_rs_H(99:165)))./mean(Ensemble_Mean_rs_H(99:165)).*100;%Relative Change
% Update the relative change of each model
for ii=1:13
    Middle_Year.rs_H(ii,:) = (Middle_Year.rs_H(ii,:) - mean(Middle_Year.rs_H(ii,99:165)))...
        ./mean(Middle_Year.rs_H(ii,99:165)).*100;%Relative Change
end
c95 = (std(Middle_Year.rs_H)')./sqrt(13).*2.96;
fill([[1850:2100]';flipud([1850:2100]')],...
    [Ensemble_Mean_rs_H - c95; flipud(Ensemble_Mean_rs_H + c95)],...
    [160,161,165]./255,'EdgeAlpha',0,'FaceAlpha',0.7);hold on;
plot([1850:2100],Ensemble_Mean_rs_H,...
    'Color',1.0-1*(1.0-[36,32,33]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度
% fill([[1850:2100]';flipud([1850:2100]')],...
%     [Ensemble_Mean_rs_H - c95; flipud(Ensemble_Mean_rs_H + c95)],...
%     [234,208,220]./255,'EdgeAlpha',0,'FaceAlpha',1);hold on;
% plot([1850:2100],Ensemble_Mean_rs_H,...
%     'Color',1.0-1*(1.0-[159,73,116]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度

% rs_Yang Percent Change
Ensemble_Mean_rs_Yang = nanmean(Middle_Year.rs_Yang)'; %1948-2014 is number 99-165
Ensemble_Mean_rs_Yang = (Ensemble_Mean_rs_Yang - mean(Ensemble_Mean_rs_Yang(99:165)))...
    ./mean(Ensemble_Mean_rs_Yang(99:165)).*100;%Relative Change
plot([1850:2100],Ensemble_Mean_rs_Yang,...
    'Color',1.0-1*(1.0-[99,99,99]./255),'EraseMode','xor','Linewidth',2.5);% 1为透明度

plot([1850,2100],[0 0],'k','LineWidth',1.5)
xlabel('Year');
set(gca,'xlim',[1948,2100],'ylim',[-10,130],'YTick',[-30:30:130],'XTick',[1850:50:2100],...
    'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
ylabel('Relative Chnage of rs (%)')

%% Yearly Grid: Relative Change of rs
% Relative Change of rs
AA = nanmean(rs_H_2070_2099,3);AA(end,:) =  AA(end-1,:); % Value One nan Column
BB = nanmean(rs_H_1948_2014,3);BB(end,:) =  BB(end-1,:); % Value One nan Column
Re_Change_rs_H = (AA - BB)./BB.*100;
% Adjust map range to -180 --- 180
A = Re_Change_rs_H(1:360,:);B = Re_Change_rs_H(361:end,:);
Re_Change_rs_H = [B;A];
extent=[-180,180,-59.75+0.195,89.75+0.195];
% extent=[-359.75,0.25,-59.75+0.195,89.75+0.195];
Re_Change_rs_H(isnan(Re_Change_rs_H))=-9999;
SaveData2GeoTIFF('Re_Change_rs_H',extent,Re_Change_rs_H');

% Ensemble_rs_H_1948_2014
Ensemble_rs_H_1948_2014 = nanmean(rs_H_1948_2014,3);
% Adjust map range to -180 --- 180
A = Ensemble_rs_H_1948_2014(1:360,:);B = Ensemble_rs_H_1948_2014(361:end,:);
Ensemble_rs_H_1948_2014 = [B;A];
Ensemble_rs_H_1948_2014(360,:) = nanmean([Ensemble_rs_H_1948_2014(359,:);Ensemble_rs_H_1948_2014(361,:)]);% Value One nan Column
Ensemble_rs_H_1948_2014(isnan(Ensemble_rs_H_1948_2014))=-9999;
SaveData2GeoTIFF('Ensemble_rs_H_1948_2014',extent,Ensemble_rs_H_1948_2014');
% h=imagesc(Re_Change_rs_H);
% set(h,'alphadata',~isnan(Re_Change_rs_H(:,:,1)))
% view(-90,90)
%% Latitudinal Distribution
figure

Re_Change_rs_H(Re_Change_rs_H==-9999)=nan;
Lat = [-59.75:0.5:89.75];
Re_Change_rs_H_Mean_Lat = nanmean(Re_Change_rs_H,1);
Re_Change_rs_H_Min_Lat = nanmin(Re_Change_rs_H);
Re_Change_rs_H_Max_Lat = nanmax(Re_Change_rs_H);

Lat(isnan(Re_Change_rs_H_Mean_Lat)) = [];
Re_Change_rs_H_Min_Lat(isnan(Re_Change_rs_H_Mean_Lat)) = [];
Re_Change_rs_H_Max_Lat(isnan(Re_Change_rs_H_Mean_Lat)) = [];
Re_Change_rs_H_Mean_Lat(isnan(Re_Change_rs_H_Mean_Lat)) = [];
Re_Change_rs_H(:,1:8)=[];Re_Change_rs_H(:,end-12:end)=[];

% Color Shade Area
ColorMatrix = [155,84,34;176,108,49;201,132,70;212,157,107;230,183,138;244,201,129;241,219,152;245,229,180;251,244,181;...
    196,226,192;149,208,167;121,202,165;68,190,160;101,167,195;71,132,160;35,97,127;46,86,114;10,57,90]./255;
ColorRange = [-40,-35,-30,-25,-20,-15,-10,-5,0,20,40,60,80,100,120,140,160,1000];
for ii = 1:length(Re_Change_rs_H_Max_Lat)
    Y = Re_Change_rs_H(:,ii);Y(isnan(Y))=[];
    for iii = 1:length(Y)
        ForColor = find([Y(iii)<ColorRange]==1);
        plot(Lat(ii),Y(iii),'.','Color',ColorMatrix(ForColor(1),:));hold on;
        clear ForColor
    end
    clear Y
end

% fill([Lat,fliplr(Lat)],...
%     [Re_Change_rs_H_Min_Lat,fliplr(Re_Change_rs_H_Max_Lat)],...
%     [160,161,165]./255,'facealpha',0.7,'edgealpha',0);hold on;
% % fill([Lat,fliplr(Lat)],...
% %     [Re_Change_rs_H_Min_Lat,fliplr(Re_Change_rs_H_Max_Lat)],...
% %     [234,208,220]./255,'facealpha',0.65,'edgealpha',0);hold on;
plot(Lat,40.34.*ones(size(Lat)),'Color',[52,53,56]./255,'LineWidth',2.5)
plot(Lat,Re_Change_rs_H_Mean_Lat,'Color',[32,33,36]./255,'LineWidth',2.5)
% % plot(Lat,Re_Change_rs_H_Mean_Lat,'Color',[159,73,116]./255,'LineWidth',2.5)
plot([-60 90],[0 0],'k','LineWidth',1.5)
view(-90,90)
set(gca,'xlim',[-60,90],'ylim',[-50,270],'YTick',[-50:50:270],'XTick',[-50:30:250],...
    'TickDir','out','FontSize',24,'FontName','Arial','LineWidth',2.5)
ylabel('Relative Chnage of rs (%)')
end