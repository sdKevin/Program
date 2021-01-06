%% ?2012 Vanderbilt University %%

function [ET,PR,R,RO,PRO,L,PL] = ...
    WaterBalance(AWC,PET,P)

% This function calculates the Thornthwaite water balance using inputs from
% the PET function and user-loaded precipitation data.

% NOTE: PET AND P SHOULD BE READ IN AS A MATRIX IN INCHES. AWC IS A
% CONSTANT AND SHOULD BE READ IN INCHES AS WELL.
% beg_row_col is a vector of the row numbers where the temperature data for
% each of the different locations begins.
% count_loc is the number of different locations in the input data.
% lat_col is the record of latitudes in degrees for all locations,
% arranged in a column vector, where a latitude is associated with each
% observation (i.e., month) of the record.

ET = [];
PR = [];
R = [];
RO = [];
PRO = [];
S = [];
L = [];
PL = [];



%% CONSTANTS

% NOTE: SOIL MOISTURE STORAGE IS HANDLED BY DIVIDING THE SOIL INTO TWO
% LAYERS AND ASSUMING THAT 1 INCH OF WATER CAN BE STORED IN THE SURFACE
% LAYER. AWC IS THE COMBINED AVAILABLE MOISTURE CAPACITY IN BOTH SOIL
% LAYERS. THE UNDERLYING LAYER HAS AN AVAILABLE CAPACITY THAT DEPENDS
% ON THE SOIL CHARACTERISTICS OF THE LOCATION. THE SOIL MOISTURE
% STORAGE WITHIN THE SURFACE LAYER (UNDERLYING LAYER) IS THE AMOUNT OF
% AVAILABLE MOISTURE STORED AT THE BEGINNING OF THE MONTH IN THE
% SURFACE (UNDERLYING) LAYER.

Ss_AWC = 1; % Ss_AWC is the available moisture capacity in the surface
% soil layer; it is a constant across all locations.
Su_AWC = AWC - Ss_AWC; % Su_AWC is the available moisture
% capacity in the underlying soil layer;
% it is a location- specific constant.

%% INITIAL CONDITIONS

% NOTE: AS THE FIRST STEP IN THE CALCULATION OF THE PALMER DROUGHT
% INDICES IS A WATER BALANCE, THE CALCULATION SHOULD BE INITIALIZED
% DURING A MONTH AND YEAR IN WHICH THE SOIL MOISTURE STORAGE CAN BE
% ASSUMED TO BE FULL.

S0 = AWC; % S0 = AWC is the initial combined soil moisture storage
% in both soil layers. Within the following water balance
% calculation loop, S0 is the soil moisture storage in
% both soil layers at the beginning of each month.
Ss0 = 1; % Ss0 = 1 is the initial soil moisture storage in the surface
% soil layer. Within the following water balance calculation
% loop, Ss0 is the soil moisture storage in the surface soil
% layer at the beginning of each month.
Su0 = Su_AWC; % Su0 = Su_AWC is the initial soil moisture storage in
% the underlying soil layer. Within the following
% water balance calculation loop, Su0 is the soil
% moisture storage in the underlying soil layer at the
% beginning of each month.

%% CALCULATION OF THE WATER BALANCE

% THE FIRST PART OF PALMER'S METHOD FOR CALCULATING THE PDSI INVOLVES
% THE CALCULATION OF  A WATER BALANCE USING HISTORIC RECORDS OF
% PRECIPITATION AND TEMPERATURE AND THORNTHWAITE'S METHOD.

% k is the counter for each year of the data on record for each of the
% different locations.
for k = 1:length(P)
    %% VARIABLE DEFINITIONS
    
    % P is the historical, monthly precipitation for the location.
    
    % Ss is the soil moisture storage in the surface layer at the end
    % of the month.
    
    % Su is the soil moisture storage in the underlying layer at the
    % end of the month.
    
    % S is the combined soil moisture storage in the combined surface
    % and underlying soil moisture storage layers at the end of the
    % month.
    
    % ET is the actual evapotranspiration from the combined surface and
    % underlying soil moisture storage layers.
    
    % Ls is the actual soil moisture loss from the surface soil
    % moisture storage layer.
    
    % Lu is the actual soil moisture loss from the underlying soil
    % moisture storage layer.
    
    % L is the actual soil moisture loss from the combined surface and
    % underlying soil moisture storage layers.
    
    % PLs is the potential soil moisture loss from the surface soil
    % moisture storage layer.
    
    % PLu is the potential soil moisture loss from the underlying soil
    % moisture storage layer.
    
    % PL is the potential soil moisture loss from the combined surface
    % and underlying soil moisture storage layers.
    
    % Rs is the actual recharge to the surface soil moisture storage
    % layer.
    
    % Ru is the actual recharge to the underlying soil moisture storage
    % layer.
    
    % R is the actual recharge to the combined surface and underlying
    % soil moisture storage layers.
    
    % PR is the potential recharge to the combined surface and
    % underlying soil moisture storage layers at the beginning of the
    % month.
    PR(k) = AWC - S0;
    
    % RO is the actual runoff from the combined surface and underlying
    % soil moisture storage layers.
    
    % PRO is the potential runoff. According to Alley (1984),
    % PRO = AWC - PR = Ss + Su; here Ss and Su refer to those values at
    % the beginning of the month: Ss0 and Su0.
    PRO(k) = AWC - PR(k);
    
    % A is the difference between the soil moisture in the surface soil
    % layer and the potential evapotranspiration.
    A(k) = Ss0 - PET(k);
    
    % B is the difference between the precipitation and potential
    % evapotranspiration - it is the excess precipitation.
    B(k) = P(k) - PET(k);
    
    %% INTERNAL CALCULATIONS
    
    if A(k) >= 0 % A >= 0 indicates that there is sufficient moisture
        % in the surface soil layer to satisfy the PET
        % requirement for month k. Therefore, there is
        % potential moisture loss from only the surface soil
        % layer.
        PLs(k) = PET(k);
        PLu(k) = 0;
    else % A < 0 indicates that there is not sufficient moisture in the
        % surface soil layer to satisfy the PET requirement for month
        % k. Therefore, there is potential moisture loss from both the
        % surface and underlying soil layers. The equation for PLu is
        % given in Alley (1984).
        PLs(k) = Ss0;
        PLu(k) = ((PET(k) - PLs(k))*Su0)/AWC;
        if Su0 >= PLu(k) % Su0 >= PLu indicates that there is
            % sufficient moisture in the underlying soil
            % layer to (along with the moisture in the
            % surface soil layer) satisfy the PET
            % requirement for month k; therefore, PLu is
            % as calculated according to the equation
            % given in Alley (1984).
            PLu(k) = ((PET(k) - PLs(k))*Su0)/AWC;
        else % Su0 < PLu indicates that there is not sufficient
            % moisture in the underlying soil layer to (along with the
            % moisture in the surface soil layer) satisfy the PET
            % requirement for month k; therefore, PLu is equal to the
            % moisture storage in the underlying soil layer at the
            % beginning of the month.
            PLu(k) = Su0;
        end
    end
    PL(k) = PLs(k) + PLu(k);
    %%
    if B(k) >= 0 % B >= 0 indicates that there is sufficient
        % precipitation during month k to satisfy the PET
        % requirement for month k - i.e., there is excess
        % precipitation. Therefore, there is no moisture loss
        % from either soil layer.
        C(k) = 1 - Ss0; % C is the amount of room (in inches) in the
        % surface soil layer that can be recharged with
        % precipitation. Here 1 refers to the
        % approximate number of inches of moisture
        % allocated to the surface soil layer.
        if C(k) >= B(k) % C >= B indicates that there is AT LEAST
            % enough room in the surface soil layer for
            % recharge than than there is excess
            % precipitation. Therefore, precipitation will
            % recharge ONLY the surface soil layer, and
            % there is NO runoff and NO soil moisture loss
            % from either soil layer.
            Rs(k) = B(k);
            Ls(k) = 0;
            Ss(k) = Ss0 + Rs(k);
            Ru(k) = 0;
            Lu(k) = 0;
            Su(k) = Su0;
            RO(k) = 0;
        else % C < B indicates that there is more excess precipitation
            % than there is room in the surface soil layer for
            % recharge. Therefore, the excess precipitation will
            % recharge BOTH the surface soil layer and the underlying
            % soil layer, and there is NO soil moisture loss from
            % either soil layer.
            Rs(k) = C(k);
            Ls(k) = 0;
            Ss(k) = 1; % Here 1 refers to the approximate number of
            % inches of moisture allocated to the surface
            % soil layer.
            D(k) = B(k) - Rs(k); % D is the amount of excess
            % precipitation (in inches) that is
            % left over after the surface soil
            % layer is recharged.
            E(k) = Su_AWC - Su0; % E is the amount of room (in
            % inches) in the underlying soil
            % layer that is available to be
            % recharged with excess
            % precipitation.
            if E(k) > D(k) % E > D indicates that there is more room in
                % the underlying soil layer than there is
                % excess precipitation available after
                % recharge to the surface soil layer.
                % Therefore, there is no runoff.
                Ru(k) = D(k);
                RO(k) = 0;
            else % E <= D indicates that there is AT MOST enough room
                % in the underlying soil layer for the excess
                % precipitation available after recharge to the
                % surface soil layer. In the case that there is enough
                % room, there is no runoff. In the case that there is
                % not enough room, runoff occurs.
                Ru(k) = E(k);
                RO(k) = D(k) - Ru(k);
            end
            Lu(k) = 0;
            Su(k) = Su0 + Ru(k); % Since there is more excess
            % precipitation than there is room in
            % the surface soil layer for recharge,
            % the soil moisture storage in the
            % underlying soil layer at the end of
            % the month is equal to the storage at
            % the beginning of the month plus any
            % recharge to the underlying soil
            % layer.
        end
        ET(k) = PET(k); % Since there is sufficient precipitation
        % during month k to satisfy the PET
        % requirement for month k, the actual
        % evapotranspiration is equal to PET.
        
    else % B < 0 indicates that there is not sufficient precipitation
        % during month k to satisfy the PET requirement for month k -
        % i.e., there is NO excess precipitation. Therefore, soil
        % moisture loss occurs, and there is NO runoff and NO recharge
        % to either soil layer.
        if Ss0 >= abs(B(k)) % Ss0 >= abs(B) indicates that there is AT
            % LEAST sufficient moisture in the surface
            % soil layer at the beginning of the month
            % k to satsify the PET requirement for
            % month k. Therefore, soil moisture loss
            % occurs from ONLY the surface soil layer,
            % and the soil moisture storage in the
            % surface soil layer at the end of the
            % month is equal to the storage at the
            % beginning of the month less any loss from
            % the surface soil layer.
            Ls(k) = abs(B(k));
            Rs(k) = 0;
            Ss(k) = Ss0 - Ls(k);
            Lu(k) = 0;
            Ru(k) = 0;
            Su(k) = Su0;
        else % Ss0 < abs(B) indicates that there is NOT sufficient
            % moisture in the surface soil layer at the beginning of
            % month k to satisfy the PET requirement for month k.
            % Therefore, soil moisture loss occurs from BOTH the
            % surface and underlying soil layers, and Lu is calculated
            % according to the equation given in Alley (1984). The
            % soil moisture storage in the underlying soil layer at
            % the end of the month is equal to the storage at the
            % beginning of the month less the loss from the underlying
            % soil layer.
            Ls(k) = Ss0;
            Rs(k) = 0;
            Ss(k) = 0;
            Lu(k) = min((abs(B(k)) - Ls(k))*Su0/(AWC),Su0);
            %*
            %
            % Lu(k) = min((abs(B(k)) - Ls(k))*Su0/(AWC(j) + 1),Su0);
            % NOTE: This equation was used by the NCDC in their FORTRAN
            % code prior to 2013. See Jacobi et al. (2013) for a full
            % explanation. To use this equation, uncomment Line 301 and
            % comment out Line 298.
            %
            %*
            Ru(k) = 0;
            Su(k) = Su0 - Lu(k);
        end
        RO(k) = 0;
        ET(k) = P(k) + Ls(k) + Lu(k); % Since there is NOT sufficient
        % precipitation during month k to
        % satisfy the PET requirement for
        % month k, the actual
        % evapotranspiration is equal to
        % precipitation plus any soil
        % moisture loss from BOTH the
        % surface and underlying soil
        % layers.
    end
    R(k) = Rs(k) + Ru(k);
    L(k) = Ls(k) + Lu(k);
    S(k) = Ss(k) + Su(k);
    
    % S0, Ss0, and Su0 are reset to their end of the current month (k)
    % values - S, Ss, and Su0, respectively - such that they can be
    % used as the beginning of the month values for the next month
    % (k + 1).
    S0 = S(k);
    Ss0 = Ss(k);
    Su0 = Su(k);
    
end
ET = reshape(ET,[],1);
PR = reshape(PR,[],1);
R = reshape(R,[],1);
RO = reshape(RO,[],1);
PRO = reshape(PRO,[],1);
L = reshape(L,[],1);
PL = reshape(PL,[],1);
end