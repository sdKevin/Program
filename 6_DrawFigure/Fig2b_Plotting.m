function Fig2b_Plotting(PerChange , Path_Fig2b2d_Output)

extent = [-179.75 , 179.75 , -59.75+0.195 , 89.75+0.195];

ssp = {'ssp126','ssp245','ssp370','ssp585'};
for i_ssp = 1 : length(ssp)
    %% AI Change
    Ensemble_Mean_PerChange_AI = nanmean(PerChange(i_ssp).PerChange.PerChange_AI,3);
    Ensemble_Mean_PerChange_AI(360,:) = Ensemble_Mean_PerChange_AI(361,:); % fill nan value
    for i_GCM = 1 : size(PerChange(i_ssp).PerChange.PerChange_AI,3)
        A = ...
            PerChange(i_ssp).PerChange.PerChange_AI(:,:,i_GCM) .* Ensemble_Mean_PerChange_AI;
        A(A>0) = 1; A(A<=0) = -1;
        PerChange(i_ssp).PerChange.PerChange_AI(:,:,i_GCM) = A;
    end
    nansum( PerChange(i_ssp).PerChange.PerChange_AI , 3)
    
end
end

