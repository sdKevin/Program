%%
% Programmed by Wei Tian,  Nov.20,2020
% IGSNRR, Beijing, China
function [z, k, d, Phat] = Z_index_scPDSI(P, PET, ET, PR, R, PRO, RO, PL, L, cal_index_beg, cal_index_end)
    % P is the monthly precipitation for the location.
    
    % PET is the monthly potential evapotranspiration for the location.
    
    % ET is the actual evapotranspiration from the combined surface and
    % underlying soil moisture storage layers.
    
    % PR is the potential recharge to the combined surface and
    % underlying soil moisture storage layers at the beginning of the
    % month.    
    
    % R is the actual recharge to the combined surface and underlying
    % soil moisture storage layers.
    
    % PL is the potential soil moisture loss from the combined surface
    % and underlying soil moisture storage layers.   
    
    % L is the actual soil moisture loss from the combined surface and
    % underlying soil moisture storage layers.
    
    % PRO is the potential runoff.
    
    % RO is the actual runoff from the combined surface and underlying
    % soil moisture storage layers.
    
    % cal_index_beg is the starting serial number of calibration period.
    
    % cal_index_end is the ending serial number of calibration period.
m = 12;
if cal_index_end == 0
    pre_cal = P;
    pe_cal = PET;
    et_cal = ET;
    pr_cal = PR;
    r_cal = R;
    pro_cal = PRO;
    ro_cal = RO;
    pl_cal = PL;
    l_cal = L;
else
    pre_cal = P(cal_index_beg : cal_index_end);
    pe_cal = PET(cal_index_beg : cal_index_end);
    et_cal = ET(cal_index_beg : cal_index_end);
    pr_cal = PR(cal_index_beg : cal_index_end);
    r_cal = R(cal_index_beg : cal_index_end);
    pro_cal = PRO(cal_index_beg : cal_index_end);
    ro_cal = RO(cal_index_beg : cal_index_end);
    pl_cal = PL(cal_index_beg : cal_index_end);
    l_cal = L(cal_index_beg : cal_index_end);
end

for i = 1 : m
    PREsum(i,1) = sum(pre_cal(i:m:length(pre_cal)));
    PEsum(i,1) = sum(pe_cal(i:m:length(pre_cal)));
    ETsum(i,1) = sum(et_cal(i:m:length(pre_cal)));
    PRsum(i,1) = sum(pr_cal(i:m:length(pre_cal)));
    Rsum(i,1) = sum(r_cal(i:m:length(pre_cal)));
    PROsum(i,1) = sum(pro_cal(i:m:length(pre_cal)));
    ROsum(i,1) = sum(ro_cal(i:m:length(pre_cal)));
    PLsum(i,1) = sum(pl_cal(i:m:length(pre_cal)));
    Lsum(i,1) = sum(l_cal(i:m:length(pre_cal)));
    
    % Calculate alpha.
    if PEsum(i) == 0
        if ETsum(i) == 0
            alpha(i,1) = 1;
        else
            alpha(i,1) = 0;
            %fprintf('CHECK DATA: PET is less than ET.');
        end
    else
        alpha(i,1) = ETsum(i)/PEsum(i);
    end
    
    % Calculate beta.
    if PRsum(i) == 0
        if Rsum(i) == 0
            beta(i,1) = 1;
        else
            beta(i,1) = 0;
            %fprintf('CHECK DATA: PR is less than R.');
        end
    else
        beta(i,1) = Rsum(i)/PRsum(i);
    end
    
    % Calculate gamma.
    if PROsum(i) == 0
        if ROsum(i) == 0
            gamma(i,1) = 1;
        else
            gamma(i,1) = 0;
            %fprintf('CHECK DATA: PRO is less than RO.');
        end
    else
        gamma(i,1) = ROsum(i)/PROsum(i);
    end
    
    % Calcuate delta.
    if PLsum(i) == 0
        if Lsum(i) == 0
            delta(i,1) = 1;
        else
            delta(i,1) = 0;
            %fprintf('CHECK DATA: PL is less than L.');
        end
    else
        delta(i,1) = Lsum(i)/PLsum(i);
    end
end

% Calculate Phat, k, and d
for k = 1 : length(P)/12
    for i = 1 : m
        Phat(i+m*(k-1),1) = (alpha(i) * PET(i+m*(k-1),1)) + (beta(i)...
            * PR(i+m*(k-1),1)) + (gamma(i) * PRO(i+m*(k-1),1))- (delta(i) * PL(i+m*(k-1),1));
        d(i+m*(k-1),1) = P(i+m*(k-1),1)-Phat(i+m*(k-1),1);
    end
end

if cal_index_end == 0
    dabs = abs(d);
else
    dabs = abs(d(cal_index_beg : cal_index_end));
end

for i = 1 : 12
    Dbar(i) = nanmean(dabs(i:m:length(dabs)));
    T(i) = (PEsum(i) + Rsum(i) + ROsum(i)) / (PREsum(i) + Lsum(i));
    if PREsum(i) + Lsum(i) == 0
        T(i) = 0;
    else
        T(i) = T(i);
    end
    k(i) = 1.5 * log10((T(i)+2.8)/Dbar(i)) + .50;
    if Dbar(i) == 0
        k(i) = 0.5;
    else
        k(i) = k(i);
    end
end

k = reshape((reshape(k,12,1) * ones(1,length(d)/12)),length(d),1);
z = d .* k;