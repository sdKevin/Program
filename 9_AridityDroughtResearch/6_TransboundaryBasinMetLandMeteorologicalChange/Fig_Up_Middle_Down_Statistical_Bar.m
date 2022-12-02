function Fig_Up_Middle_Down_Statistical_Bar(Extent , Intensity , Frequency , Population , c95_Extent , c95_Intensity , c95_Frequency , c95_Population)
subplot(3,1,[1,2])
RGB_ssp_Shade = [200,202,229; 223,238,246; 252,218,197; 248,162,134];
RGB_ssp_Line = [50,78,161; 133,184,227; 245,132,63; 238,31,36];

% Bar chart 2051-2100 v.s.1951-2000
for ii = 9 : -1 : 6
    if ii == 9
        % Intensity, Frequency, and Extent under ssp585, Population under ssp370
        bar([1,2,3,4] , [(Intensity(1,ii)-Intensity(1,1))./Intensity(1,1)*100, (Extent(1,ii)-Extent(1,1))./Extent(1,1)*100, (Frequency(1,ii)-Frequency(1,1))./Frequency(1,1)*100, (Population(1,ii-1)-Population(1,1))./Population(1,1)*100;...
            (Intensity(2,ii)-Intensity(2,1))./Intensity(2,1)*100, (Extent(2,ii)-Extent(2,1))./Extent(2,1)*100, (Frequency(2,ii)-Frequency(2,1))./Frequency(2,1)*100, (Population(2,ii-1)-Population(2,1))./Population(2,1)*100;]',...
            'FaceColor',RGB_ssp_Shade(ii-5,:)./255,'EdgeColor','none','BarWidth',0.8);hold on;
    elseif ii == 8
        bar([1,2,3,4] , [(Intensity(1,ii)-Intensity(1,1))./Intensity(1,1)*100, (Extent(1,ii)-Extent(1,1))./Extent(1,1)*100, (Frequency(1,ii)-Frequency(1,1))./Frequency(1,1)*100, (Population(1,ii+1)-Population(1,1))./Population(1,1)*100;...
            (Intensity(2,ii)-Intensity(2,1))./Intensity(2,1)*100, (Extent(2,ii)-Extent(2,1))./Extent(2,1)*100, (Frequency(2,ii)-Frequency(2,1))./Frequency(2,1)*100, (Population(2,ii+1)-Population(2,1))./Population(2,1)*100]',...
            'FaceColor',RGB_ssp_Shade(ii-5,:)./255,'EdgeColor','none','BarWidth',0.8);hold on;
    else
        bar([1,2,3,4] , [(Intensity(1,ii)-Intensity(1,1))./Intensity(1,1)*100, (Extent(1,ii)-Extent(1,1))./Extent(1,1)*100, (Frequency(1,ii)-Frequency(1,1))./Frequency(1,1)*100, (Population(1,ii)-Population(1,1))./Population(1,1)*100;...
            (Intensity(2,ii)-Intensity(2,1))./Intensity(2,1)*100, (Extent(2,ii)-Extent(2,1))./Extent(2,1)*100, (Frequency(2,ii)-Frequency(2,1))./Frequency(2,1)*100, (Population(2,ii)-Population(2,1))./Population(2,1)*100]',...
            'FaceColor',RGB_ssp_Shade(ii-5,:)./255,'EdgeColor','none','BarWidth',0.8)
    end
    hold on
end
set(gca,'XTick', [ 1 : 4] ,'XTickLabel',{'\Delta Intensity','\Delta Extent','\Delta Frequency','\Delta Exposed \newline Population'})

% Error bar 2051-2100 v.s.1951-2000
X_Pos = [-0.24,-0.24,-0.24,-0.24,0.05,0.05,0.05,0.05;-0.18,-0.18,-0.18,-0.18,0.11,0.11,0.11,0.11;...
    -0.12,-0.12,-0.12,-0.12,0.18,0.18,0.18,0.18;-0.05,-0.05,-0.05,-0.05,0.24,0.24,0.24,0.24;];

for ii = 9 : -1 : 6
    errorbar(repmat([1:4],[1,2]) + X_Pos(abs(ii-10),:) ,...
        [(Intensity(1,ii)-Intensity(1,1))./Intensity(1,1)*100, (Extent(1,ii)-Extent(1,1))./Extent(1,1)*100, (Frequency(1,ii)-Frequency(1,1))./Frequency(1,1)*100, (Population(1,ii)-Population(1,1))./Population(1,1)*100,...
        (Intensity(2,ii)-Intensity(2,1))./Intensity(2,1)*100, (Extent(2,ii)-Extent(2,1))./Extent(2,1)*100, (Frequency(2,ii)-Frequency(2,1))./Frequency(2,1)*100, (Population(2,ii)-Population(2,1))./Population(2,1)*100]' , ...
        [c95_Intensity(1,ii)./Intensity(1,ii)*100 , c95_Extent(1,ii)./Extent(1,ii)*100 , c95_Frequency(1,ii)./Frequency(1,ii)*100 , c95_Population(1,ii)./Population(1,ii)*100,...
        c95_Intensity(2,ii)./Intensity(2,ii)*100 , c95_Extent(2,ii)./Extent(2,ii)*100 , c95_Frequency(2,ii)./Frequency(2,ii)*100 , c95_Population(2,ii)./Population(2,ii)*100],...
        'o','MarkerSize',3,'MarkerEdgeColor',RGB_ssp_Line(ii-5,:)./255,...
        'Color',[150,150,150]./255,'LineWidth',2.5)
end


plot([1.5 1.5],[0 285],'k--','LineWidth',2)
plot([2.5 2.5],[0 285],'k--','LineWidth',2)
plot([3.5 3.5],[0 285],'k--','LineWidth',2)

view(90,-90)
set(gca,'ylim',[0,285],'FontSize',24,'FontName','Arial','TickDir','out','LineWidth',2.5);
end

